import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:myrealty/app/services/storage.dart';

import '../../../data/AllItem.dart';
import '../../../services/ApiRepo.dart';
import '../../home/controllers/home_controller.dart';

class EventAdsController extends GetxController {
  var eTitle = TextEditingController();
  RxBool isTitle = false.obs;

  var eSubtitle = TextEditingController();
  RxBool isSubtitle = false.obs;

  var isLoad = true.obs;

  final eventList = <String>[].obs;
  RxString selectedEvent = "select a event".obs;

  @override
  Future<void> onInit() async {
    super.onInit();

    eventList.assignAll(await fetchMenuOptions());
    isLoad.value = false;
  }

  fetchMenuOptions() async {
    try {
      final response = await ApiRepo.getAllEventNames(deviceid: Get.find<GetStorageService>().deviceId);
      return (response.data as List<dynamic>).cast<String>();
    } catch (e) {
      return [''];
    }
  }

  getImages() async {
    Get.find<HomeController>().getImagesEvent({"title": eTitle.text.toString(), "subtitle": eTitle.text.toString(), "eventName": selectedEvent.value});
  }
}
