import 'package:dio/dio.dart';

import 'Endpoints.dart';
import 'api_service.dart';

class ApiRepo {
  static Future<Response> login({required dynamic body}) async => await DioClient(Dio(), showSnakbar: true, isOverlayLoader: true).post(Endpoints.login, data: body);
}
