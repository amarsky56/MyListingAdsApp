import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:myrealty/app/routes/app_pages.dart';

class VerificationController extends GetxController {
  var eOtp = TextEditingController();

  var isOtp = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  verification() {
    Get.toNamed(Routes.EDIT_PROFILE);
  }
}
