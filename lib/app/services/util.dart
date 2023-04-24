import 'responsive_size.dart';
import 'package:flutter/material.dart';
import 'colors.dart';

inputDecoration(String hinttext) => InputDecoration(
      hintText: hinttext,
      hintStyle: const TextStyle(
        color: ColorUtil.darkGrey,
      ),
      fillColor: Colors.transparent,
      filled: true,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.kh),
        borderSide: const BorderSide(
          width: 1,
          color: ColorUtil.lightGrey,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.kh),
        borderSide: const BorderSide(
          width: 1,
          color: ColorUtil.borderLine,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.kh),
        borderSide: const BorderSide(
          width: 1,
          color: ColorUtil.borderLine,
        ),
      ),
    );
