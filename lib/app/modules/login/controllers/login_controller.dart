import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:myrealty/app/routes/app_pages.dart';

import '../../../services/ApiRepo.dart';
import '../../../services/dialog_helper.dart';
import '../../../services/storage.dart';

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
      final response = await ApiRepo.login(body: {"phone": ePhone.text.toString()});
      Get.find<GetStorageService>().authToken = response.data['token'];
      if(response.data['newUser']==true){
        Get.toNamed(Routes.VERIFICATION);
      }else{
        Get.offAllNamed(Routes.HOME);
      }

    } catch (e) {
      print(e);
    }
    DialogHelper.hideDialog();
  }
}
