import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';
import 'package:myrealty/app/modules/home/controllers/home_controller.dart';
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart' as path;
import '../../../data/AllItem.dart';
import '../../../data/LastSaveModel.dart';
import '../../../services/ApiRepo.dart';
import '../../../services/storage.dart';

class ListingAdsController extends GetxController {
  var eMLSListingID = TextEditingController();
  RxBool iseMLSListingID = false.obs;

  var eTitle = TextEditingController();
  RxBool isTitle = false.obs;

  var eSubtitle = TextEditingController();
  RxBool isSubtitle = false.obs;

  RxBool checked = false.obs;

  RxString listingPhoto = "".obs;
  RxBool useSimpleForm = false.obs;

  var eAddress = TextEditingController();
  RxBool isAddress = false.obs;
  var eFeatures = TextEditingController();
  RxBool isFeatures = false.obs;
  var ePrice = TextEditingController();
  RxBool isPrice = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> getLastSavedAd(BuildContext context) async {
    try {
      final response = await ApiRepo.getLastSavedAd(deviceid: Get.find<GetStorageService>().deviceId);
      var mData = LastSaveModel.fromJson(response.data);
      eMLSListingID.text = mData.mlsListingId ?? "";
      eTitle.text = mData.title ?? "";
      eSubtitle.text = mData.subtitle ?? "";
      checked.value = mData.hideprice ?? false;
      eAddress.text = mData.address ?? "";
      ePrice.text = mData.price ?? "";
      eFeatures.text = mData.features ?? "";
      listingPhoto.value = mData.listingPhoto ?? "";
      useSimpleForm.value = mData.useSimpleForm ?? false;
      Get.find<HomeController>().bottomSheet(context);
    } catch (e) {
      print(e);
    }
  }

  Future<void> fileUpload(PickedFile pickedImage, String fileName, String type) async {
    try {
      final extension = path.extension(pickedImage.path.toString()).replaceAll(".", "");
      var mDatajson = await FormData.fromMap({"file": await MultipartFile.fromFile(pickedImage.path, contentType: MediaType('application', extension.toString()))});
      final response = await ApiRepo.uploadlistingAdImage(body: mDatajson, deviceid: Get.find<GetStorageService>().deviceId);
      listingPhoto.value = response.data;
    } catch (e) {
      print(e);
    }
  }



  Future<void> createlistingAd() async {
    try {
      final response = await ApiRepo.createlistingAd(deviceid: Get.find<GetStorageService>().deviceId, body: {
        "mlsListingId": eMLSListingID.text.toString(),
        "title": eTitle.text.toString(),
        "subtitle": eSubtitle.text.toString(),
        "hideprice": checked.value,
        "listingPhoto": listingPhoto.value,
        "address": eAddress.text.toString(),
        "features": eFeatures.text.toString(),
        "price": ePrice.text.toString(),
        "useSimpleForm": useSimpleForm.value
      });
      print(response.data);
      Get.find<HomeController>().getImages();
    } catch (e) {
      print(e);
    }
  }

  Future<void> openImage(String type) async {
    final picker = ImagePicker();
    PickedFile? pickedImage;
    pickedImage = await picker.getImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      final String fileName = path.basename(pickedImage!.path);
      fileUpload(pickedImage, fileName, type);
    }
  }
}
