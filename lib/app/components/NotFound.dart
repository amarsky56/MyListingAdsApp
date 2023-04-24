import 'package:flutter/material.dart';
import 'package:myrealty/app/services/colors.dart';
import 'package:myrealty/app/services/responsive_size.dart';

import '../services/strings.dart';
import '../services/textstyles.dart';

class NotFound extends StatelessWidget {
  String title;

  NotFound({this.title = "No product found!"});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0.kh),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              Strings.NoAdsAvailable,
              textAlign: TextAlign.center,
              style: TextStyleUtil.txt32_6(color: ColorUtil.lightGrey1),
            ),
          ),
          SizedBox(
            height: 10.kh,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              Strings.Clickoncreateadstocreate,
              textAlign: TextAlign.center,
              style: TextStyleUtil.txt17_7(),
            ),
          ),
          Image.asset("assets/png/arrow.png"),
        ],
      ),
    );
  }
}
