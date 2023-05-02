import 'package:get/get.dart';

import '../controllers/listing_ads_controller.dart';

class ListingAdsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListingAdsController>(
      () => ListingAdsController(),
    );
  }
}
