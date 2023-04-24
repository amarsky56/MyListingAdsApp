import 'package:flutter/material.dart';
import 'package:myrealty/app/services/responsive_size.dart';

import '../services/colors.dart';


class RaisedGradientButton extends StatelessWidget {
  final Widget child;
  final double width;
  final double height;
  final Function onPressed;

  const RaisedGradientButton(
      {super.key,
      required this.width,
      required this.height,
      required this.onPressed,
      required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.kh),
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            ColorUtil.brandColor1,
            ColorUtil.brandColor1,
          ],
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
            onTap: () {
              onPressed();
            },
            child: Center(
              child: child,
            )),
      ),
    );
  }
}
