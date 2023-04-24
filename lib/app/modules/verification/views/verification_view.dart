import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:myrealty/app/services/responsive_size.dart';

import '../../../components/ImgPath.dart';
import '../../../components/custom_textfiled.dart';
import '../../../components/gredient_button.dart';
import '../../../services/dialog_helper.dart';
import '../../../services/strings.dart';
import '../../../services/textstyles.dart';
import '../controllers/verification_controller.dart';

class VerificationView extends GetView<VerificationController> {
  const VerificationView({Key? key}) : super(key: key);

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
              Strings.EnterOTP,
              style: TextStyleUtil.txt40_6(),
            ),
            SizedBox(height: 40.kh),
            CustomTextFiled(
              hint: Strings.EnterYourOTP,
              controller: controller.eOtp,
              obsR: true,
              validator: (value) {
                controller.isOtp.value = false;
                if (!GetUtils.isNum(value ?? "")) {
                  return "Please Enter Valid OTP";
                }
                controller.isOtp.value = true;
                return null;
              },
            ),
            SizedBox(height: 20.kh),
            RaisedGradientButton(
              onPressed: () async {
                if (controller.isOtp.value) {
                  await controller.verification();
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
