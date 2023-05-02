import 'package:dio/dio.dart';

import 'Endpoints.dart';
import 'api_service.dart';

class ApiRepo {
  static Future<Response> sendVerificationsms({required dynamic body}) async =>
      await DioClient(Dio(), showSnakbar: true, isOverlayLoader: true).post(Endpoints.sendverificationsms, data: body);

  static Future<Response> loginWithSMS({required dynamic body, required String sms}) async =>
      await DioClient(Dio(), showSnakbar: true, isOverlayLoader: true).post(Endpoints.loginWithSMS + sms, data: body);

  static Future<Response> updateprofile({required dynamic body, required deviceid}) async =>
      await DioClient(Dio(), showSnakbar: true, isOverlayLoader: true).post(Endpoints.updateprofile + deviceid, data: body);

  static Future<Response> createlistingAd({required dynamic body, required deviceid}) async =>
      await DioClient(Dio(), showSnakbar: true, isOverlayLoader: true).post(Endpoints.createlistingAd + deviceid, data: body);

  static Future<Response> buildListingAdImages({required templateName, required deviceid}) async => await DioClient(Dio(), showSnakbar: true, isOverlayLoader: false).post(
        "${Endpoints.buildListingAdImages + templateName}&deviceId=" + deviceid,
      );

  static Future<Response> buildEventAdImages({required body,required templateName, required deviceid}) async => await DioClient(Dio(), showSnakbar: true, isOverlayLoader: false).post(
    "${Endpoints.buildEventAdImages + templateName}&deviceId=" + deviceid,data: body
  );


  static Future<Response> getSortByList({required deviceid}) async =>
      await DioClient(Dio(), showSnakbar: true, isOverlayLoader: false).post(Endpoints.getSortByList + deviceid);

  static Future<Response> getLastSavedAd({required deviceid}) async =>
      await DioClient(Dio(), showSnakbar: true, isOverlayLoader: true).post(Endpoints.getLastSavedAd + deviceid);

  static Future<Response> getAllEventNames({required deviceid}) async =>
      await DioClient(Dio(), showSnakbar: true, isOverlayLoader: false).post(Endpoints.getAllEventNames + deviceid);

  static Future<Response> getprofile({required deviceid}) async =>
      await DioClient(Dio(), showSnakbar: true, isOverlayLoader: false).get(Endpoints.getprofile + deviceid);

  static Future<Response> getAllListingAds({required sortBy, required deviceid}) async =>
      await DioClient(Dio(), showSnakbar: true, isOverlayLoader: false).post("${Endpoints.getAllListingAds + sortBy}&deviceId=" + deviceid);

  static Future<Response> uploadPicture({required dynamic body, required deviceid}) async => await DioClient(
        Dio(),
        showSnakbar: true,
        isOverlayLoader: true,
      ).post(Endpoints.uploadPicture + deviceid, data: body, options: Options(headers: {'Content-Type': 'multipart/form-data'}));

  static Future<Response> uploadlistingAdImage({required dynamic body, required deviceid}) async => await DioClient(
        Dio(),
        showSnakbar: true,
        isOverlayLoader: true,
      ).post(Endpoints.uploadlistingAdImage + deviceid, data: body, options: Options(headers: {'Content-Type': 'multipart/form-data'}));
}
