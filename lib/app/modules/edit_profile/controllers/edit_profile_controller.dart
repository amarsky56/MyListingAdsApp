import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:myrealty/app/routes/app_pages.dart';

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

  RxString countryValue="".obs;

  RxString stateValue="".obs;

  RxString cityValue="".obs;

  @override
  void onInit() {
    super.onInit();
  }

  save() {

  }
}
