import 'package:get_storage/get_storage.dart';

import 'package:get/get.dart';

class GetStorageService extends GetxService {
  static final _runData = GetStorage('runData');

  bool get isLoggedIn => _runData.read('isLoggedIn') ?? false;

  set isLoggedIn(bool value) => _runData.write('isLoggedIn', value);

  String get authToken => _runData.read('authToken') ?? '';

  set authToken(String value) => _runData.write('authToken', value);

  String get uid => _runData.read('uid') ?? '';

  set uid(String value) => _runData.write('uid', value);

  Future<GetStorageService> initState() async {
    await GetStorage.init('runData');

    return this;
  }

  void logout() {
    _runData.erase();
  }
}
