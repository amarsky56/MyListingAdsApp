import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myrealty/app/services/responsive_size.dart';
import 'colors.dart';

class DialogHelper {
  static void showLoading([String? message]) {
    Get.dialog(
      WillPopScope(
        child: SizedBox(
          child: Column(
            children: [
              SizedBox(height: 60.h),
              Center(
                child: CircularProgressIndicator(),
              ),
              // message != null ? SizedBox(height: 8.kh) : const SizedBox(),
              // message != null ? Text(message) : const SizedBox(),
            ],
          ),
        ),
        onWillPop: () => Future.value(false),
      ),
      barrierDismissible: false,
      barrierColor: const Color(0xff141A31).withOpacity(.4),
      useSafeArea: true,
    );
  }


  //hide loading
  static Future<void> hideDialog() async {
    if (Get.isDialogOpen!) Get.until((route) => !Get.isDialogOpen!);
  }

  static showMySnackbar(String title, String desc) {
    //if (Get.isSnackbarOpen) Get.until((route) => !Get.isSnackbarOpen);
    Get.closeAllSnackbars();
    Get.snackbar(
      title, desc,
      isDismissible: true,
      duration: const Duration(seconds: 3),
      colorText: ColorUtil.kprimarywhite,
      animationDuration: const Duration(milliseconds: 200),
      onTap: (snack) {
        Get.closeAllSnackbars();
      },
      snackStyle: SnackStyle.FLOATING,
      snackPosition: SnackPosition.TOP,
      backgroundColor: ColorUtil.brandColor1.withOpacity(0.8),
      // backgroundColor: ColorUtil.brandColor1,
    );
  }

  static showMySnackbar4Sec(String title, String desc, {Color? bgColor}) {
    //if (Get.isSnackbarOpen) Get.until((route) => !Get.isSnackbarOpen);
    Get.closeAllSnackbars();
    Get.snackbar(title, desc,
        duration: const Duration(seconds: 6),
        colorText: ColorUtil.kprimarywhite,
        animationDuration: const Duration(milliseconds: 200),
        isDismissible: true, onTap: (snack) {
      Get.closeAllSnackbars();
    }, snackStyle: SnackStyle.FLOATING, snackPosition: SnackPosition.TOP, backgroundColor: bgColor ?? ColorUtil.brandColor1.withOpacity(0.9), boxShadows: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 5,
        blurRadius: 7,
        offset: const Offset(0, 3), // changes position of shadow
      ),
    ]
        // backgroundColor: ColorUtil.brandColor1,
        );
  }

  static showMySnackbar1min(String title, String desc) {
    // if (Get.isSnackbarOpen) Get.until((route) => !Get.isSnackbarOpen);
    Get.closeAllSnackbars();
    Get.snackbar(
      title, desc,
      isDismissible: true,

      duration: const Duration(minutes: 1),
      colorText: ColorUtil.kprimarywhite,
      animationDuration: const Duration(milliseconds: 200),
      onTap: (snack) {
        Get.closeAllSnackbars();
      },

      snackStyle: SnackStyle.FLOATING,
      snackPosition: SnackPosition.TOP,

      backgroundColor: ColorUtil.brandColor1.withOpacity(0.8),
      // backgroundColor: ColorUtil.brandColor1,
    );
  }


  static Widget   MyAppContainer(){
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            ColorUtil.brandColor1,
            ColorUtil.brandColor2,
          ],
        ),
      ),
    );
  }
}
