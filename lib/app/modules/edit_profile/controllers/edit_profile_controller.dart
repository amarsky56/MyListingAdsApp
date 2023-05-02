import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myrealty/app/routes/app_pages.dart';
import 'package:http_parser/http_parser.dart';
import 'package:myrealty/app/services/storage.dart';
import '../../../data/ProfileMoldel.dart';
import '../../../data/StatesModel.dart';
import '../../../services/ApiRepo.dart';
import 'package:path/path.dart' as path;
import 'package:dio/dio.dart';

import '../../../services/strings.dart';

class EditProfileController extends GetxController {
  var eName = TextEditingController();

  var isName = false.obs;

  var ePhone = TextEditingController();

  var isPhone = false.obs;

  var eCompanyName = TextEditingController();

  var isCompanyName = false.obs;

  var eEmailID = TextEditingController();

  var isEmailID = false.obs;

  var eWebsite = TextEditingController();

  var isWebsite = false.obs;

  var eStreet = TextEditingController();

  var isStreet = false.obs;

  RxString countryValue = "".obs;

  RxString stateValue = "".obs;

  RxString cityValue = "".obs;

  var eCity = TextEditingController();

  var isCity = false.obs;

  var profilePicture = "".obs;
  var logo = "".obs;
  RxList<String> stateList = <String>[
    "Select a state",
    "Alabama, US",
    "Alaska, US",
    "Arizona, US",
    "Arkansas, US",
    "Armed Forces America",
    "Armed Forces Europe",
    "Armed Forces Pacific",
    "California, US",
    "Colorado, US",
    "Connecticut, US",
    "Delaware, US",
    "District of Columbia, US",
    "Florida, US",
    "Georgia, US",
    "Hawaii, US",
    "Idaho, US",
    "Illinois, US",
    "Indiana, US",
    "Iowa, US",
    "Kansas, US",
    "Kentucky, US",
    "Louisiana, US",
    "Maine, US",
    "Maryland, US",
    "Massachusetts, US",
    "Michigan, US",
    "Minnesota, US",
    "Mississippi, US",
    "Missouri, US",
    "Montana, US",
    "Nebraska, US",
    "Nevada, US",
    "New Hampshire, US",
    "New Jersey, US",
    "New Mexico, US",
    "New York, US",
    "North Carolina, US",
    "North Dakota, US",
    "Ohio, US",
    "Oklahoma, US",
    "Oregon, US",
    "Pennsylvania, US",
    "Rhode Island, US",
    "South Carolina, US",
    "South Dakota, US",
    "Tennessee, US",
    "Texas, US",
    "Utah, US",
    "Vermont, US",
    "Virginia, US",
    "Washington, US",
    "West Virginia, US",
    "Wisconsin, US",
    "Wyoming, US"
  ].obs;

  RxString selectedState = "Select a state".obs;

  @override
  void onInit() {
    super.onInit();
    getprofile();
  }

  save() async {
    try {
      final response = await ApiRepo.updateprofile(body: {
        "phone": ePhone.text.toString(),
        "name": eName.text.toString(),
        "address": eStreet.text.toString(),
        "city": eCity.text.toString(),
        "stateProvince": selectedState.value,
        "postalCode": "",
        "profilePicture": profilePicture.value,
        "logo": logo.value,
        "email": eEmailID.text.toString(),
        "website": eWebsite.text.toString(),
        "companyName": eCompanyName.text.toString(),
        "brokerageName": "string"
      }, deviceid: Get.find<GetStorageService>().deviceId);
      print(response.data);

      Get.toNamed(Routes.HOME);
    } catch (e) {
      print(e);
    }
  }

  Future<void> getJsonData() async {
    try {
      final jsonString = await rootBundle.loadString('assets/states.json');
      final List<dynamic> jsonList = json.decode(jsonString);
      var stateList = jsonList.map((json) => StatesModel.fromJson(json)).toList();
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

  Future<void> fileUpload(PickedFile pickedImage, String fileName, String type) async {
    try {
      final extension = path.extension(pickedImage.path.toString()).replaceAll(".", "");
      var mDatajson = await FormData.fromMap(
          {"type": "userProfile", "file": await MultipartFile.fromFile(pickedImage.path, contentType: MediaType('application', extension.toString()))});
      final response = await ApiRepo.uploadPicture(body: mDatajson, deviceid: Get.find<GetStorageService>().deviceId);
      if (type == Strings.logo) {
        logo.value = response.data;
      } else {
        profilePicture.value = response.data;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> getprofile() async {
    try {
      final response = await ApiRepo.getprofile(deviceid: Get.find<GetStorageService>().deviceId);
      print(response.data);
      var profileData = ProfileMoldel.fromJson(response.data);
      ePhone.text = profileData.phone ?? "";
      eName.text = profileData.name ?? "";
      eStreet.text = profileData.address ?? "";
      eCity.text = profileData.city ?? "";
      selectedState.value = profileData.stateProvince ?? "";
      profilePicture.value = profileData.profilePicture ?? "";
      eEmailID.text = profileData.email ?? "";
      eWebsite.text = profileData.website ?? "";
      eCompanyName.text = profileData.companyName ?? "";
      eName.text = profileData.name ?? "";
      if (eName.text.isNotEmpty) {
        isName.value = true;
      }
      if (ePhone.text.isNotEmpty) {
        isPhone.value = true;
      }
      if (eEmailID.text.isNotEmpty) {
        isEmailID.value = true;
      }
      if (eEmailID.text.isNotEmpty) {
        isEmailID.value = true;
      }
    } catch (e) {
      print(e);
    }
  }
}
