import 'package:flutter/material.dart';
import 'package:myrealty/app/services/responsive_size.dart';

import '../services/colors.dart';
import '../services/textstyles.dart';
import '../services/util.dart';

class CustomTextFiledTitle extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController controller;
  final String? Function(String?) validator;
  final TextInputType inputType;
  final bool enable;

  const CustomTextFiledTitle({
    super.key,
    required this.title,
    required this.hint,
    required this.controller,
    required this.validator,
    this.inputType = TextInputType.text,
    this.enable=true,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.kw),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyleUtil.txt16_4(
                fontWeight: FontWeight.w500,
                color: ColorUtil.kdark,
              ),
            ),
            SizedBox(height: 4.kh),
            TextFormField(
              enabled:enable ,
              controller: controller,
              style: TextStyle(
                color: ColorUtil.brandColor1,
              ),
              keyboardType:inputType ,
             /* inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(inputType == TextInputType.phone ? RegExp("[0-9]") : RegExp("[0-9a-zA-Z]")),
              ],*/
              cursorColor: ColorUtil.brandColor1,
              onChanged: (value) {},
              validator: validator,
              decoration: inputDecoration(hint),
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
          ],
        ),
      ),
    );
  }
}
