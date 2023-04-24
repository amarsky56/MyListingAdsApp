import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
import 'package:flutter/services.dart';
import 'app/services/storage.dart';
import 'app/services/strings.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initGetServices();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  );

  return runApp(
    GetMaterialApp(
      defaultTransition: Transition.fade,
      smartManagement: SmartManagement.full,
      debugShowCheckedModeBanner: false,
      title: Strings.ksAPP_NAME,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}

Future<void> initGetServices() async {
  await Get.putAsync<GetStorageService>(() => GetStorageService().initState());
}
