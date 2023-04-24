import 'package:flutter/material.dart';
import 'package:myrealty/app/services/responsive_size.dart';
import '../services/colors.dart';
import '../services/util.dart';

class CustomTextFiled extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final String? Function(String?) validator;
  final TextInputType inputType;
  final bool enable;
  final bool obsR;

  const CustomTextFiled({
    super.key,
    required this.hint,
    required this.controller,
    required this.validator,
    this.inputType = TextInputType.text,
    this.enable = true,
    this.obsR=false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.kw),
        child: TextFormField(
          enabled: enable,
          controller: controller,
          textAlign: TextAlign.center,
          obscureText: obsR,
          obscuringCharacter: "*",
          style: const TextStyle(
            color: ColorUtil.brandColor1,
          ),
          keyboardType: inputType,
          /* inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(inputType == TextInputType.phone ? RegExp("[0-9]") : RegExp("[0-9a-zA-Z]")),
              ],*/
          cursorColor: ColorUtil.brandColor1,
          onChanged: (value) {},
          validator: validator,
          decoration: inputDecoration(hint),
          autovalidateMode: AutovalidateMode.onUserInteraction,
        ),
      ),
    );
  }
}
