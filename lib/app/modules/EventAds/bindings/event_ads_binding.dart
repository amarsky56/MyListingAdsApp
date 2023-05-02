import 'package:get/get.dart';

import '../controllers/event_ads_controller.dart';

class EventAdsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EventAdsController>(
      () => EventAdsController(),
    );
  }
}
