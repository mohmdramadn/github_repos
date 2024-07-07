import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../constants/constant_strings.dart';
import '../contract/services/i_request_service.dart';

@Singleton(as: IRequestService)
class RequestService implements IRequestService {
  late Dio client;
  final prettyDioLogger = PrettyDioLogger(
    request: true,
    requestHeader: true,
    requestBody: true,
    responseBody: true,
    responseHeader: false,
    compact: false,
  );

  RequestService() {
    client = Dio(
      BaseOptions(
        baseUrl: 'https://api.github.com',
        headers: {
          'Accept': 'application/vnd.github+json',
          'Authorization': 'Bearer $kGithubToken',
          'X-GitHub-Api-Version': '2022-11-28'
        },
      ),
    );
    client.interceptors.add(prettyDioLogger);
  }

  @override
  Future<Response> getRequest(
      {required String url, Map<String, dynamic>? queryParameters}) {
    var response = client.get(url, queryParameters: queryParameters);
    return response;
  }
}
