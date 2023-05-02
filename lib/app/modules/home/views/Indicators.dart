import 'package:flutter/material.dart';
import 'package:myrealty/app/data/AllItem.dart';
import 'package:myrealty/app/services/responsive_size.dart';

class Indicators extends StatelessWidget {
  List<AllItemColors> colors;

  Indicators({required this.colors});

  @override
  Widget build(BuildContext context) {
    return Row(
        children: colors
            .map((color) => Container(
                  height: 10.kh,
                  width: 10.kh,
                  margin: EdgeInsets.symmetric(horizontal: 4.kw),
                  decoration: BoxDecoration(color: Color(int.parse(color.colorCode.toString(), radix: 16) + 0xFF000000), borderRadius: BorderRadius.circular(100)),
                ))
            .toList());
  }
}
