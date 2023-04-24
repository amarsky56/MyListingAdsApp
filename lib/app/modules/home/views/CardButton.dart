import 'package:flutter/material.dart';
import 'package:myrealty/app/components/CommonImageView.dart';
import 'package:myrealty/app/services/responsive_size.dart';

import '../../../services/textstyles.dart';

class CardButton extends StatelessWidget {
  String img, lable;

  CardButton({super.key, required this.img, required this.lable});

  @override
  Widget build(BuildContext context) {
    return Chip(
      labelPadding: EdgeInsets.all(4.0.kw),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.kh))),
      avatar: CommonImageView(
        imagePath: img,
        height: 18.kh,
        width: 18.kh,
        fit: BoxFit.fill,
        borderRadius: 0,
      ),
      label: Text(
        lable,
        style: TextStyleUtil.txt11_6(),
      ),
      backgroundColor: Colors.white,
      elevation: 4.0,
      padding: EdgeInsets.symmetric(horizontal: 16.0.kw, vertical: 8.kh),
    );
  }
}
