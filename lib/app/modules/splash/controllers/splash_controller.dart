import 'package:get/get.dart';
import 'package:myrealty/app/components/ImgPath.dart';

import '../../../routes/app_pages.dart';
import '../../../services/storage.dart';

class SplashController extends GetxController {
  final RxString imgSplash = "".obs;

  @override
  void onInit() {
    super.onInit();
    imgSplash.value = ImgPath.pngLogo;
    Future.delayed(const Duration(seconds: 1)).then((value) => Get.offAllNamed(Get.find<GetStorageService>().isLoggedIn ? Routes.HOME : Routes.LOGIN));
  }
}
