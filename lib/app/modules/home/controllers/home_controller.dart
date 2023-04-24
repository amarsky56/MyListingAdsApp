import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:myrealty/app/services/colors.dart';
import 'package:myrealty/app/services/responsive_size.dart';
import 'package:myrealty/app/services/textstyles.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import '../../../components/custom_textfiled_title.dart';
import '../../../services/dialog_helper.dart';
import '../../../services/strings.dart';

class HomeController extends GetxController {
  RxBool downloading = false.obs;
  RxBool copying = false.obs;
  late String destinationPath;
  var selectedValue = "Recently Added".obs;
  final List<Widget> tabs = [
    const Tab(text: 'Listing Ads'),
    const Tab(text: 'Event Ads'),
  ];

  var eMLSListingID = TextEditingController();
  RxBool iseMLSListingID = false.obs;

  var eTitle = TextEditingController();
  RxBool isTitle = false.obs;

  var eSubtitle = TextEditingController();
  RxBool isSubtitle = false.obs;

  RxBool checked = false.obs;

  @override
  void onInit() {
    super.onInit();
    // _initDestinationPath();
  }

  void _initDestinationPath() async {
    final directory = await getExternalStorageDirectory();
    destinationPath = '${directory!.path}/images';
    if (!await Directory(destinationPath).exists()) {
      await Directory(destinationPath).create(recursive: true);
    }
  }

  downloadImage(String url) async {
    downloading.value = true;
    try {
      final response = await http.get(Uri.parse(url));
      final documentDirectory = await getApplicationDocumentsDirectory();
      final file = File('${documentDirectory.path}/my_image.jpg');
      file.writeAsBytesSync(response.bodyBytes);
      downloading.value = false;
      var imagePath = file.path;
      DialogHelper.showMySnackbar("Info!", 'Image downloaded successfully!');
    } catch (e) {
      downloading.value = false;
    }
  }

  copyImageFromUrl(String imageUrl) async {
    copying.value = true;

    try {
      final response = await http.get(Uri.parse(imageUrl));
      final bytes = response.bodyBytes;
      final fileName = Uri.parse(imageUrl).pathSegments.last;
      final file = File('$destinationPath/$fileName');
      await file.writeAsBytes(bytes);
      copying.value = false;
      DialogHelper.showMySnackbar("Info!", 'Image copied successfully!');
    } catch (e) {
      copying.value = false;

      print(e);
    }
  }

  void bottomSheet() {
    Get.bottomSheet(Container(
      color: Colors.white,
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.all(16.ksp),
            child: Column(
              children: [
                SizedBox(
                  height: 40.kh,
                ),
                Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.kh), color: ColorUtil.lightGrey),
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
                Expanded(
                  child: TabBarView(
                    children: [
                      Center(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 14.kh,
                            ),
                            CustomTextFiledTitle(
                              title: Strings.MLSListingID,
                              hint: '',
                              inputType: TextInputType.name,
                              controller: eMLSListingID,
                              validator: (value) {
                                iseMLSListingID.value = false;
                                if (value!.isEmpty) {
                                  return Strings.PleaseEnterValid + Strings.MLSListingID;
                                }
                                iseMLSListingID.value = true;
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 14.kh,
                            ),
                            CustomTextFiledTitle(
                              title: Strings.title,
                              hint: 'select/edit your title',
                              inputType: TextInputType.name,
                              controller: eTitle,
                              validator: (value) {
                                isTitle.value = false;
                                if (value!.isEmpty) {
                                  return Strings.PleaseEnterValid + Strings.title;
                                }
                                isTitle.value = true;
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 14.kh,
                            ),
                            CustomTextFiledTitle(
                              title: Strings.Subtitle,
                              hint: '',
                              inputType: TextInputType.name,
                              controller: eSubtitle,
                              validator: (value) {
                                isSubtitle.value = false;
                                if (value!.isEmpty) {
                                  return Strings.PleaseEnterValid + Strings.Subtitle;
                                }
                                isSubtitle.value = true;
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 14.kh,
                            ),
                            Obx(
                              () => InkWell(
                                onTap: () {
                                  checked.value = !checked.value;
                                },
                                child: Row(
                                  children: [
                                    Checkbox(
                                      value: checked.value,
                                      onChanged: (bool? value) {
                                        checked.value = value!;
                                      },
                                    ),
                                    Text(Strings.ShowPrice),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Center(child: Text('Tab 2 ')),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
