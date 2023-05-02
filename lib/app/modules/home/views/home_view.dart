import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myrealty/app/modules/home/views/ItemCard.dart';
import 'package:myrealty/app/routes/app_pages.dart';
import 'package:myrealty/app/services/responsive_size.dart';
import '../../../components/CommonImageView.dart';
import '../../../components/ImgPath.dart';
import '../../../components/NotFound.dart';
import '../../../components/gredient_button.dart';
import '../../../services/colors.dart';
import '../../../services/strings.dart';
import '../../../services/textstyles.dart';
import '../../ListingAds/controllers/listing_ads_controller.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtil.backGround,
      appBar: AppBar(
        backgroundColor: ColorUtil.backGround,
        elevation: 0,
        leadingWidth: 0,
        title: ListTile(
          onTap: () => Get.toNamed(Routes.EDIT_PROFILE),
          contentPadding: EdgeInsets.zero,
          title: Text(
            Strings.Hello + "Bobby",
            style: TextStyleUtil.txt34_7(),
          ),
          subtitle: Text(
            Strings.Edityourprofile,
            style: TextStyleUtil.txt15_6(),
          ),
          trailing: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(66.kh)),
            child: CommonImageView(
              imagePath: ImgPath.pngProfile,
              height: 55.kh,
              width: 55.kh,
            ),
          ),
        ),
      ),
      body: Obx(
        () => controller.isLoad.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : controller.allListingAds.value.isEmpty
                ? NotFound()
                : Padding(
                    padding: EdgeInsets.all(16.0.kh),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              Strings.ListingAds,
                              style: TextStyleUtil.txt24_7(),
                            ),
                          ),
                          SizedBox(
                            height: 30.kh,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${Strings.All} ${controller.allListingAds.value.length} ${Strings.images}",
                                style: TextStyleUtil.txt11_6(),
                              ),
                              Container(
                                  height: 35.kh,
                                  width: 150.kw,
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
                                            Text(controller.selectedOption.value),
                                            Icon(Icons.keyboard_arrow_down),
                                          ],
                                        ),
                                      ),
                                      itemBuilder: (BuildContext context) => controller.menuOptions.value.map((String option) {
                                        return PopupMenuItem<String>(
                                          value: option,
                                          child: Text(option),
                                        );
                                      }).toList(),
                                      onSelected: (String value) {
                                        controller.selectedOption.value = value; // update selected value
                                        // Handle menu item selection here
                                      },
                                    ),
                                  )),
                            ],
                          ),
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) => ItemCard(
                                allListingAds: controller.allListingAds.value[index],
                                downloadImage: (downloadImage) => controller.shareImage(downloadImage),
                                copyImageFromUrl: (copyImageFromUrl) => controller.shareImage(copyImageFromUrl)),
                            itemCount: controller.allListingAds.value.length,
                          ),
                          SizedBox(
                            height: 100.kh,
                          ),
                        ],
                      ),
                    ),
                  ),
      ),
      bottomSheet: SizedBox(
        height: 100.kh,
        width: 100.w,
        child: Card(
          color: Colors.white,
          elevation: 6,
          child: Center(
            child: SizedBox(
              height: 50.kh,
              width: 250.kw,
              child: RaisedGradientButton(
                onPressed: () {
                  Get.find<ListingAdsController>().getLastSavedAd(context);

                },
                height: 50.kh,
                width: 250.kw,
                child: Text(
                  Strings.CreateAds,
                  style: TextStyleUtil.txt16_4(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
