import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:myrealty/app/routes/app_pages.dart';
import 'package:uuid/uuid.dart';

import '../../../services/ApiRepo.dart';
import '../../../services/dialog_helper.dart';
import '../../../services/storage.dart';

class VerificationController extends GetxController {
  var eOtp = TextEditingController();

  var isOtp = false.obs;
  var phone = "".obs;
  var deviceId = "".obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    phone.value = Get.arguments;
    deviceId.value = await getDeviceId();

    print(deviceId.value);
  }

  Future<String> getDeviceId() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    var uuid = const Uuid();

    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      return androidInfo.id ??uuid.v1(); // unique ID on Android
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      return iosInfo.identifierForVendor ?? uuid.v1(); // unique ID on iOS
    } else {
      return '';
    }
  }

  verification() async {
    DialogHelper.showLoading();
    try {
      final response = await ApiRepo.loginWithSMS(sms: "${eOtp.text}&deviceid=${deviceId.value}", body: {"phone": phone.value});
      Get.find<GetStorageService>().authToken = response.data['token'];
      Get.find<GetStorageService>().expiration = response.data['expiration'];
      Get.find<GetStorageService>().deviceId = deviceId.value;
      Get.find<GetStorageService>().isLoggedIn = true;
      if (response.data['newUser'] == true) {
        Get.toNamed(Routes.EDIT_PROFILE);
      } else {
        Get.offAllNamed(Routes.HOME);
      }
    } catch (e) {
      print(e);
    }
    DialogHelper.hideDialog();
  }
}
