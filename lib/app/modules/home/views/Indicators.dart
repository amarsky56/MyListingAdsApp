import 'package:flutter/material.dart';
import 'package:myrealty/app/services/responsive_size.dart';

import '../../../services/colors.dart';

class Indicators extends StatelessWidget {
  const Indicators({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Row(
      children: [
        Container(
          height: 10.kh,
          width: 10.kh,
          margin: EdgeInsets.symmetric(horizontal: 4.kw),
          decoration: BoxDecoration(color: ColorUtil.kdark, borderRadius: BorderRadius.circular(100)),
        ),
        Container(
          height: 10.kh,
          width: 10.kh,
          margin: EdgeInsets.symmetric(horizontal: 4.kw),
          decoration: BoxDecoration(color: ColorUtil.kBlue, borderRadius: BorderRadius.circular(100)),
        ),
        Container(
          height: 10.kh,
          width: 10.kh,
          margin: EdgeInsets.symmetric(horizontal: 4.kw),
          decoration: BoxDecoration(color: ColorUtil.kYello, borderRadius: BorderRadius.circular(100)),
        ),
        Container(
          height: 10.kh,
          width: 10.kh,
          margin: EdgeInsets.symmetric(horizontal: 4.kw),
          decoration: BoxDecoration(color: ColorUtil.kprimaryblack, borderRadius: BorderRadius.circular(100)),
        ),
      ],
    );
  }
}
