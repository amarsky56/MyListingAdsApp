import 'package:flutter/material.dart';
import 'package:myrealty/app/services/responsive_size.dart';

import '../../../components/CommonImageView.dart';
import '../../../components/ImgPath.dart';
import '../../../services/strings.dart';
import 'CardButton.dart';
import 'Indicators.dart';

class ItemCard extends StatelessWidget {
 final downloadImage;
 final copyImageFromUrl;


 const ItemCard({super.key, required this.downloadImage,required this.copyImageFromUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16.kh),
      child: Column(
        children: [
          CommonImageView(
            imagePath: "assets/png/temp.png",
            height: 400.kh,
            width: 100.w,
            borderRadius: 12.kh,
          ),
          SizedBox(
            height: 16.kh,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  InkWell(onTap: () => downloadImage(""), child: CardButton(lable: Strings.Copy, img: ImgPath.pngCopy)),
                  SizedBox(
                    width: 12.kw,
                  ),
                  InkWell(onTap: () => copyImageFromUrl("imageUrl"), child: CardButton(lable: Strings.Save, img: ImgPath.pngSave)),
                ],
              ),
              const Indicators(),
            ],
          )
        ],
      ),
    );
  }
}
