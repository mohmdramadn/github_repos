import 'package:dio/dio.dart';

abstract class IRequestService {
  Future<Response> getRequest(
      {required String url, Map<String, dynamic>? queryParameters});
}