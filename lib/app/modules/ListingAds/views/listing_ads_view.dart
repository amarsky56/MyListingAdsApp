import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:myrealty/app/modules/home/controllers/home_controller.dart';
import 'package:myrealty/app/services/responsive_size.dart';

import '../../../components/custom_textfiled_title.dart';
import '../../../components/gredient_button.dart';
import '../../../services/colors.dart';
import '../../../services/dialog_helper.dart';
import '../../../services/strings.dart';
import '../../../services/textstyles.dart';
import '../controllers/listing_ads_controller.dart';

class ListingAdsView extends GetView<ListingAdsController> {
  const ListingAdsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 14.kh,
            ),
            CustomTextFiledTitle(
              title: Strings.MLSListingID,
              hint: '',
              inputType: TextInputType.name,
              controller: controller.eMLSListingID,
              validator: (value) {
                controller.iseMLSListingID.value = false;
                if (value!.isEmpty) {
                  return Strings.PleaseEnterValid + Strings.MLSListingID;
                }
                controller.iseMLSListingID.value = true;
                return null;
              },
            ),
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
              height: 14.kh,
            ),
            CustomTextFiledTitle(
              title: Strings.address,
              hint: '',
              inputType: TextInputType.text,
              controller: controller.eAddress,
              validator: (value) {
                controller.isAddress.value = false;
                if (value!.isEmpty) {
                  return Strings.PleaseEnterValid + Strings.address;
                }
                controller.isAddress.value = true;
                return null;
              },
            ),
            SizedBox(
              height: 14.kh,
            ),
            CustomTextFiledTitle(
              title: Strings.Features,
              hint: '',
              inputType: TextInputType.text,
              controller: controller.eFeatures,
              validator: (value) {
                controller.isFeatures.value = false;
                if (value!.isEmpty) {
                  return Strings.PleaseEnterValid + Strings.Features;
                }
                controller.isFeatures.value = true;
                return null;
              },
            ),
            SizedBox(
              height: 14.kh,
            ),
            CustomTextFiledTitle(
              title: Strings.Price,
              hint: '',
              inputType: TextInputType.number,
              controller: controller.ePrice,
              validator: (value) {
                controller.isPrice.value = false;
                if (value!.isEmpty) {
                  return Strings.PleaseEnterValid + Strings.Price;
                }
                controller.isPrice.value = true;
                return null;
              },
            ),
            SizedBox(
              height: 14.kh,
            ),
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
                    Flexible(
                        child: Obx(() => Text(
                              controller.listingPhoto.value,
                              maxLines: 1,
                            ))),
                    RaisedGradientButton(
                      onPressed: () async {
                        controller.openImage(Strings.logo);
                      },
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
            ),
            SizedBox(
              height: 14.kh,
            ),
            Obx(
              () => InkWell(
                onTap: () {
                  controller.checked.value = !controller.checked.value;
                },
                child: Row(
                  children: [
                    Checkbox(
                      value: controller.checked.value,
                      onChanged: (bool? value) {
                        controller.checked.value = value!;
                      },
                    ),
                    Text(Strings.ShowPrice),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 40.kh,
            ),
            SizedBox(
              height: 50.kh,
              width: 250.kw,
              child: RaisedGradientButton(
                onPressed: () {
                  controller.createlistingAd();
                  /*if (controller.iseMLSListingID.value && controller.isTitle.value && controller.isSubtitle.value) {*/

                  /*   } else {
                    DialogHelper.showMySnackbar('Info!', Strings.msg);
                  }*/
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
    );
  }
}
