import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:myrealty/app/components/CommonImageView.dart';
import 'package:myrealty/app/components/ImgPath.dart';
import 'package:myrealty/app/components/custom_textfiled_title.dart';
import 'package:myrealty/app/services/colors.dart';
import 'package:myrealty/app/services/responsive_size.dart';
import 'package:myrealty/app/services/strings.dart';
import 'package:myrealty/app/services/textstyles.dart';
import '../../../components/gredient_button.dart';
import '../../../services/dialog_helper.dart';
import '../controllers/edit_profile_controller.dart';

class EditProfileView extends GetView<EditProfileController> {
  const EditProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorUtil.backGround,
        elevation: 0,
        title: Text(
          Strings.Myprofile,
          style: TextStyleUtil.txt24_7(),
        ),
      ),
      backgroundColor: ColorUtil.backGround,
      body: Padding(
        padding: EdgeInsets.all(16.0.kh),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  const Icon(Icons.arrow_back_outlined),
                  SizedBox(
                    width: 80.w,
                    child: Align(
                      alignment: Alignment.center,
                      child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(137.kh)),
                            child: CommonImageView(
                              imagePath: ImgPath.pngProfile,
                              height: 137.kh,
                              width: 137.kh,
                            ),
                          ),
                          ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(24.kh)),
                              child: Container(
                                  color: ColorUtil.backCam.withOpacity(0.5),
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0.kh),
                                    child: Icon(Icons.camera_alt),
                                  )))
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0.kh),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.kh, vertical: 32.kh),
                  child: Column(
                    children: [
                      CustomTextFiledTitle(
                        title: Strings.Name,
                        hint: '',
                        inputType: TextInputType.name,
                        controller: controller.eName,
                        validator: (value) {
                          controller.isName.value = false;
                          if (value!.isEmpty) {
                            return Strings.PleaseEnterValid + Strings.Name;
                          }
                          controller.isName.value = true;
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 14.kh,
                      ),
                      CustomTextFiledTitle(
                        title: Strings.Phone,
                        hint: '',
                        inputType: TextInputType.phone,
                        controller: controller.ePhone,
                        validator: (value) {
                          controller.isPhone.value = false;
                          if (!GetUtils.isPhoneNumber(value ?? "")) {
                            return Strings.PleaseEnterValid + Strings.Phone;
                          }
                          controller.isPhone.value = true;
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 14.kh,
                      ),
                      CustomTextFiledTitle(
                        title: Strings.CompanyName,
                        hint: '',
                        inputType: TextInputType.name,
                        controller: controller.eCompanyName,
                        validator: (value) {
                          controller.isCompanyName.value = false;
                          if (value!.isEmpty) {
                            return Strings.PleaseEnterValid + Strings.CompanyName;
                          }
                          controller.isCompanyName.value = true;
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 14.kh,
                      ),
                      CustomTextFiledTitle(
                        title: Strings.EmailID,
                        hint: '',
                        inputType: TextInputType.emailAddress,
                        controller: controller.eEmailID,
                        validator: (value) {
                          controller.isEmailID.value = false;
                          if (!GetUtils.isEmail(value ?? "")) {
                            return Strings.PleaseEnterValid + Strings.EmailID;
                          }
                          controller.isEmailID.value = true;
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 14.kh,
                      ),
                      CustomTextFiledTitle(
                        title: Strings.Website,
                        hint: '',
                        inputType: TextInputType.name,
                        controller: controller.eWebsite,
                        validator: (value) {
                          controller.isWebsite.value = false;
                          if (value!.isEmpty) {
                            return Strings.PleaseEnterValid + Strings.Website;
                          }
                          controller.isWebsite.value = true;
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 14.kh,
                      ),
                      CustomTextFiledTitle(
                        title: Strings.Street,
                        hint: '',
                        inputType: TextInputType.streetAddress,
                        controller: controller.eStreet,
                        validator: (value) {
                          controller.isStreet.value = false;
                          if (value!.isEmpty) {
                            return Strings.PleaseEnterValid + Strings.Street;
                          }
                          controller.isStreet.value = true;
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 14.kh,
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: CustomTextFiledTitle(
                              title: Strings.City,
                              hint: '',
                              inputType: TextInputType.streetAddress,
                              controller: controller.eCity,
                              validator: (value) {
                                controller.isCity.value = false;
                                if (value!.isEmpty) {
                                  return Strings.PleaseEnterValid + Strings.Street;
                                }
                                controller.isCity.value = true;
                                return null;
                              },
                            ),
                          ),
                          SizedBox(
                            width: 20.kw,
                          ),
                          Flexible(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    Strings.state,
                                    style: TextStyleUtil.txt16_4(
                                      fontWeight: FontWeight.w500,
                                      color: ColorUtil.kdark,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 4.kh),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: ColorUtil.kdark,
                                      width: 1,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 8.0.kh, vertical: 16.kh),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Flexible(
                                            child: Text(
                                          Strings.selectYourState,
                                          style: TextStyleUtil.txt16_4(),
                                        )),
                                        Icon(Icons.keyboard_arrow_down)
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 14.kh,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          Strings.logo,
                          style: TextStyleUtil.txt16_4(
                            fontWeight: FontWeight.w500,
                            color: ColorUtil.kdark,
                          ),
                        ),
                      ),
                      SizedBox(height: 4.kh),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: ColorUtil.kdark,
                            width: 1,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0.kh, vertical: 4.kh),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("data"),
                              RaisedGradientButton(
                                onPressed: () async {},
                                height: 48.kh,
                                width: 100.kw,
                                child: Text(
                                  Strings.Upload,
                                  style: TextStyleUtil.txt16_4(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 40.kh,
              ),
              RaisedGradientButton(
                onPressed: () async {
                  if (controller.isName.value) {
                    await controller.save();
                  } else {
                    DialogHelper.showMySnackbar('Info!', "Please check all your fields before proceeding.");
                  }
                },
                height: 48.kh,
                width: 300.kw,
                child: Text(
                  Strings.Save,
                  style: TextStyleUtil.txt16_4(color: Colors.white),
                ),
              ),
              SizedBox(
                height: 40.kh,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
