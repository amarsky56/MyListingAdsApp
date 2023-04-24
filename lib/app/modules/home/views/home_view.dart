import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:myrealty/app/services/responsive_size.dart';
import 'package:myrealty/app/services/storage.dart';

import '../../../components/CommonImageView.dart';
import '../../../components/ImgPath.dart';
import '../../../services/colors.dart';
import '../../../services/strings.dart';
import '../../../services/textstyles.dart';
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
      body: Padding(
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    Strings.ListingAds,
                    style: TextStyleUtil.txt11_6(),
                  ),
                  Text(
                    Strings.ListingAds,
                    style: TextStyleUtil.txt11_6(),
                  ),
                ],
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => Container(
                  margin: EdgeInsets.symmetric(vertical: 16.kh),
                  child: Column(
                    children: [
                      CommonImageView(imagePath: "assets/png/temp.png", height: 360.kh, width: 100.w, borderRadius: 12.kh, fit: BoxFit.cover),
                      _buildChip("label", Colors.red)
                    ],
                  ),
                ),
                itemCount: 5,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChip(String label, Color color) {
    return Chip(
      labelPadding: EdgeInsets.all(2.0),
      avatar: CommonImageView(
        imagePath: ImgPath.pngSave,
        height: 18.kh,
        width: 18.kh,
        fit: BoxFit.fill,
      ),
      label: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 6.0,
      shadowColor: Colors.grey[60],
      padding: EdgeInsets.all(8.0),
    );
  }
}
