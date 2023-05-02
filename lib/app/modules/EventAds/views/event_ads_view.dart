import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:myrealty/app/services/responsive_size.dart';

import '../../../components/custom_textfiled_title.dart';
import '../../../components/gredient_button.dart';
import '../../../services/colors.dart';
import '../../../services/dialog_helper.dart';
import '../../../services/strings.dart';
import '../../../services/textstyles.dart';
import '../controllers/event_ads_controller.dart';

class EventAdsView extends GetView<EventAdsController> {
  const EventAdsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () => controller.isLoad.value
              ? const CircularProgressIndicator()
              : Column(
                  children: [
                    SizedBox(
                      height: 14.kh,
                    ),
                    Container(
                        height: 60.kh,
                        width: 100.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: ColorUtil.kdark,
                            width: 1,
                          ),
                        ),
                        padding: EdgeInsets.zero,
                        child: Center(
                          child: PopupMenuButton<String>(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(controller.selectedEvent.value),
                                  const Icon(Icons.keyboard_arrow_down),
                                ],
                              ),
                            ),
                            itemBuilder: (BuildContext context) => controller.eventList.value.map((String option) {
                              return PopupMenuItem<String>(
                                value: option,
                                child: Text(option),
                              );
                            }).toList(),
                            onSelected: (String value) {
                              controller.selectedEvent.value = value; // update selected value
                              // Handle menu item selection here
                            },
                          ),
                        )),
                    SizedBox(
                      height: 14.kh,
                    ),
                    CustomTextFiledTitle(
                      title: Strings.title,
                      hint: 'select/edit your title',
                      inputType: TextInputType.name,
                      controller: controller.eTitle,
                      validator: (value) {
                        controller.isTitle.value = false;
                        if (value!.isEmpty) {
                          return Strings.PleaseEnterValid + Strings.title;
                        }
                        controller.isTitle.value = true;
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 14.kh,
                    ),
                    CustomTextFiledTitle(
                      title: Strings.Subtitle,
                      hint: '',
                      inputType: TextInputType.name,
                      controller: controller.eSubtitle,
                      validator: (value) {
                        controller.isSubtitle.value = false;
                        if (value!.isEmpty) {
                          return Strings.PleaseEnterValid + Strings.Subtitle;
                        }
                        controller.isSubtitle.value = true;
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 40.kh,
                    ),
                    SizedBox(
                      height: 50.kh,
                      width: 250.kw,
                      child: RaisedGradientButton(
                        onPressed: () {
                          if (controller.selectedEvent.value != "select a event" && controller.isTitle.value && controller.isSubtitle.value) {
                            controller.getImages();
                          } else {
                            DialogHelper.showMySnackbar('Info!', Strings.msg);
                          }
                        },
                        height: 50.kh,
                        width: 250.kw,
                        child: Text(
                          Strings.Create,
                          style: TextStyleUtil.txt16_4(color: Colors.white),
                        ),
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
