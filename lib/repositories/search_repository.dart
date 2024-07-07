import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:github_repos/models/search_result.dart';
import 'package:injectable/injectable.dart';

// ignore: depend_on_referenced_packages
import 'package:async/async.dart';

import '../constants/constant_strings.dart';
import '../contract/remote/i_search_repository.dart';
import '../contract/services/i_request_service.dart';

@Injectable(as: ISearchRepository)
class SearchRepository implements ISearchRepository {
  final IRequestService requestService;

  SearchRepository({required this.requestService});

  @override
  Future<Result<SearchResult>> searchGithubRepositories(
      Map<String,dynamic>? searchParameter) async {
    try {
      var response = await requestService.getRequest(
          url: Constant.urls.searchUrl,
          queryParameters: searchParameter);
      if (response.statusCode == HttpStatus.ok) {
        SearchResult searchResult = SearchResult.fromJson(response.data);
        return Result.value(searchResult);
      }
      return Result.error(response.data);
    } on DioException catch (error) {
      return Result.error(error.message.toString());
    } catch (e) {
      log('ERROR >> $e');
      return Result.error('Something went wrong');
    }
  }
}
