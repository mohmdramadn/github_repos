import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
// ignore: depend_on_referenced_packages
import 'package:async/async.dart';

import '../contract/remote/i_search_repository.dart';
import '../contract/services/i_request_service.dart';

@Injectable(as: ISearchRepository)
class SearchRepository implements ISearchRepository {
  final IRequestService requestService;

  SearchRepository({required this.requestService});
}
