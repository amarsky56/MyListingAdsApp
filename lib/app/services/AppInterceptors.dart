import 'dart:async';
import 'package:dio/dio.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:myrealty/app/services/storage.dart';
import 'api_service.dart';
import 'dialog_helper.dart';

class AppInterceptors extends Interceptor {
  bool isOverlayLoader;
  bool showSnakbar;

  AppInterceptors({this.isOverlayLoader = true, this.showSnakbar = true});

  @override
  FutureOr<dynamic> onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers = {"Authorization": "Bearer "+Get.find<GetStorageService>().authToken};
    isOverlayLoader ? DialogHelper.showLoading() : null;
    super.onRequest(options, handler);
  }

  @override
  FutureOr<dynamic> onResponse(Response response, ResponseInterceptorHandler handler) {
    // TODO: implement onResponse
    super.onResponse(response, handler);
    isOverlayLoader ? DialogHelper.hideDialog() : null;
  }

  @override
  Future<dynamic> onError(DioError dioError, ErrorInterceptorHandler handler) async {
    // TODO: implement onError
    super.onError(dioError, handler);
    /* if (await refreshToken()) {
      return handler.resolve(await retry(dioError.requestOptions));
    }*/
    try {
      final errorMessage = DioExceptions.fromDioError(dioError).toString();
      isOverlayLoader ? DialogHelper.hideDialog() : null;
      showSnakbar == true ? DialogHelper.showMySnackbar("Notification", errorMessage) : null;


    } catch (e) {
      isOverlayLoader ? DialogHelper.hideDialog() : null;
      print(e);
    }

    /* if ((dioError.response?.statusCode == 401 && dioError.response?.data['message'] == "invalid token")) {
      if (await refreshToken()) {
        return handler.resolve(await retry(dioError.requestOptions));
      }
    }*/

    return handler.next;
  }

  Future<Response<dynamic>> retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return Dio().request<dynamic>(requestOptions.path, data: requestOptions.data, queryParameters: requestOptions.queryParameters, options: options);
  }

/*  Future<bool> refreshToken() async {
    try {
      Get.find<GetStorageService>().token = (await FirebaseAuth.instance.currentUser?.getIdToken(true))!;
      print(Get.find<GetStorageService>().token);
      return true;
    } catch (e) {
      Get.find<MorePageController>().userLogout();
      return false;
    }

    */ /*  final response = await Dio().post('/auth/refresh', data: {'refreshToken': "refreshToken"});
    if (response.statusCode == 201) {
      var accessToken = response.data;
      return true;
    } else {
      // refresh token is wrong
      print("Logout");
      return false;
    }*/ /*
  }*/
}
