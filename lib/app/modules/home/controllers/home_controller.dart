import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:myrealty/app/data/AllItem.dart';
import 'package:myrealty/app/modules/EventAds/controllers/event_ads_controller.dart';
import 'package:myrealty/app/modules/EventAds/views/event_ads_view.dart';
import 'package:myrealty/app/modules/ListingAds/controllers/listing_ads_controller.dart';
import 'package:myrealty/app/modules/ListingAds/views/listing_ads_view.dart';
import 'package:myrealty/app/services/colors.dart';
import 'package:myrealty/app/services/responsive_size.dart';
import 'package:myrealty/app/services/storage.dart';
import 'package:myrealty/app/services/textstyles.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:io';
import '../../../routes/app_pages.dart';
import '../../../services/ApiRepo.dart';
import '../../../services/dialog_helper.dart';

import 'package:dio/dio.dart';

class HomeController extends GetxController with WidgetsBindingObserver {
  RxBool downloading = false.obs;
  RxBool copying = false.obs;
  late String destinationPath;
  var selectedValue = "Recently Added".obs;
  final List<Widget> tabs = [
    const Tab(text: 'Listing Ads'),
    const Tab(text: 'Event Ads'),
  ];

  final menuOptions = <String>[].obs;

  var isLoad = true.obs;

  RxString selectedOption = "Default".obs;

  RxList<AllItem> allListingAds = <AllItem>[].obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    WidgetsBinding.instance.addObserver(this);
    menuOptions.assignAll(await fetchMenuOptions());
    await getAllListingAds();
    isLoad.value = false;
    print(Get.find<GetStorageService>().expiration);
    findCon();
  }

  void findCon() {
    Get.lazyPut<ListingAdsController>(
      () => ListingAdsController(),
    );
    Get.lazyPut<EventAdsController>(
      () => EventAdsController(),
    );
  }

  Future<void> shareImage(String url) async {
    try {
      DialogHelper.showLoading();
      final dio = Dio();
      final response = await dio.get(url, options: Options(responseType: ResponseType.bytes));
      final bytes = response.data;

      // Save image to app directory
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/myItem.png');
      file.writeAsBytesSync(bytes);

      // Share image using share package
      await Share.shareFiles([file.path]);
      DialogHelper.hideDialog();
    } catch (e) {
      DialogHelper.hideDialog();
      debugPrint('Error sharing image: $e');
    }
  }

  Future<List<String>> fetchMenuOptions() async {
    try {
      final response = await ApiRepo.getSortByList(deviceid: Get.find<GetStorageService>().deviceId);
      return (response.data as List<dynamic>).cast<String>();
    } catch (e) {
      return ['Default'];
    }
  }

  Future<void> getAllListingAds() async {
    try {
      final response = await ApiRepo.getAllListingAds(sortBy: selectedOption.value, deviceid: Get.find<GetStorageService>().deviceId);
      List<AllItem> stateList = (response.data as List<dynamic>).map((json) => AllItem.fromJson(json)).toList();
      allListingAds.value = stateList;
    } catch (e) {
      print(e);
    }
  }

  ///Bottom Sheet
  void bottomSheet(BuildContext context) {
    findCon();
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SingleChildScrollView(
            child: Container(
              color: Colors.white,
              constraints: BoxConstraints(maxHeight: 100.h * 1.9),
              child: DefaultTabController(
                length: 2,
                child: Scaffold(
                  body: Padding(
                    padding: EdgeInsets.all(16.ksp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(
                          height: 40.kh,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.kh),
                            color: ColorUtil.lightGrey,
                          ),
                          width: 300.kw,
                          child: TabBar(
                            tabs: tabs,
                            isScrollable: false,
                            indicator: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1.kw,
                                  blurRadius: 7.kw,
                                  offset: Offset(0, 3), // changes position of shadow
                                ),
                              ],
                              borderRadius: BorderRadius.circular(5.kh),
                            ),
                            labelStyle: TextStyleUtil.txt11_6(fontWeight: FontWeight.w700, color: ColorUtil.kdark),
                            unselectedLabelStyle: TextStyleUtil.txt11_6(color: ColorUtil.kdark),
                            labelColor: ColorUtil.kdark,
                            unselectedLabelColor: ColorUtil.kdark,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Expanded(
                          child: TabBarView(
                            children: [
                              ListingAdsView(),
                              EventAdsView(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        isScrollControlled: true);
  }

  getImages() async {
    try {
      Get.back();
      List<AllItem> mList = <AllItem>[];
      mList.addAll(allListingAds.value);
      allListingAds.value.clear();
      for (var mData in mList) {
        final response = await ApiRepo.buildListingAdImages(templateName: mData.name.toString(), deviceid: Get.find<GetStorageService>().deviceId);
        mData.image ??= []; // Initialize mData.image to an empty list if it's null
        for (var item in response.data) {
          mData.image!.add(item.toString());
        }
        isLoad.value = true;
        allListingAds.value.add(mData);
        isLoad.value = false;
      }
    } catch (e) {
      print(e);
    }
  }

  getImagesEvent(Map<String, String> map) async {
    try {
      Get.back();
      List<AllItem> mList = <AllItem>[];
      mList.addAll(allListingAds.value);
      allListingAds.value.clear();
      for (var mData in mList) {
        final response = await ApiRepo.buildEventAdImages(body: map, templateName: mData.name.toString(), deviceid: Get.find<GetStorageService>().deviceId);
        mData.image ??= []; // Initialize mData.image to an empty list if it's null
        for (var item in response.data) {
          mData.image!.add(item.toString());
        }
        isLoad.value = true;
        allListingAds.value.add(mData);
        isLoad.value = false;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      String dateString = Get.find<GetStorageService>().expiration;
      DateTime expiryDate = DateTime.parse(dateString);
      DateTime currentDateMinus2Days = DateTime.now().subtract(const Duration(days: 2));
      if (expiryDate.isBefore(currentDateMinus2Days)) {
        logout();
      }
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void logout() {

    Get.offAllNamed(Routes.LOGIN);
  }
}
