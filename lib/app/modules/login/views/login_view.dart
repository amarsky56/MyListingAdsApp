import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:myrealty/app/components/ImgPath.dart';
import 'package:myrealty/app/services/responsive_size.dart';
import 'package:myrealty/app/services/textstyles.dart';

import '../../../components/custom_textfiled.dart';
import '../../../components/gredient_button.dart';
import '../../../services/dialog_helper.dart';
import '../../../services/strings.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0.kh),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(alignment: Alignment.center, child: Image.asset(ImgPath.pngLogo)),
            SizedBox(height: 40.kh),
            Text(
              Strings.Signin,
              style: TextStyleUtil.txt40_6(),
            ),
            SizedBox(height: 20.kh),
            Text(
              Strings.SigninMsg,
              style: TextStyleUtil.txt12_4(),
            ),
            SizedBox(height: 20.kh),
            CustomTextFiled(
              inputType: TextInputType.phone,
              hint: Strings.EnterYourPhoneNumber,
              controller: controller.ePhone,
              validator: (value) {
                controller.isPhoneValid.value = false;
                if (!GetUtils.isPhoneNumber(value ?? "")) {
                  return "Please Enter Valid Phone";
                }
                controller.isPhoneValid.value = true;
                return null;
              },
            ),
            SizedBox(height: 20.kh),
            RaisedGradientButton(
              onPressed: () async {
                if (controller.isPhoneValid.value) {
                  await controller.sentOtp();
                } else {
                  DialogHelper.showMySnackbar('Info!', "Please check all your fields before proceeding.");
                }
              },
              height: 48.kh,
              width: 100.w,
              child: Text(
                Strings.CONTINUE,
                style: TextStyleUtil.txt16_4(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
