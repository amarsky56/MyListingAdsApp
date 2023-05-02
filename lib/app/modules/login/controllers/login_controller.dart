import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:myrealty/app/routes/app_pages.dart';
import '../../../services/ApiRepo.dart';
import '../../../services/dialog_helper.dart';

class LoginController extends GetxController {
  var ePhone = TextEditingController();
  var isPhoneValid = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  sentOtp() async {
    DialogHelper.showLoading();
    try {
      final response = await ApiRepo.sendVerificationsms(body: {"phone": ePhone.text.toString()});
      if (response.data == true) {
        Get.toNamed(Routes.VERIFICATION,arguments: ePhone.text.toString());
      }
    } catch (e) {
      print(e);
    }
    DialogHelper.hideDialog();
  }
}
