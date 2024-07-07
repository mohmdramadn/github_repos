// ignore: depend_on_referenced_packages
import 'package:async/async.dart';

import '../../models/search_result.dart';

abstract class ISearchRepository {
  Future<Result<SearchResult>> searchGithubRepositories(
      Map<String,dynamic>? searchParameter);
}