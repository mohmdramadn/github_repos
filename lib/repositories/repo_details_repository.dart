import 'package:dio/dio.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:github_repos/contract/services/i_request_service.dart';
import 'package:github_repos/models/branches.dart';
import 'package:injectable/injectable.dart';

import '../constants/constant_strings.dart';
import '../contract/remote/i_repo_details_repository.dart';
import '../main.dart';

// ignore: depend_on_referenced_packages
import 'package:async/async.dart';

@Injectable(as: IRepoDetailsRepository)
class RepoDetailsRepository implements IRepoDetailsRepository {
  final IRequestService _requestService;

  RepoDetailsRepository(IRequestService? requestService)
      : _requestService = requestService ?? getIt<IRequestService>();

  @override
  Future<Result<List<Branches>>> getBranches(
      {String? ownerName, String? repoName}) async {
    try {
      var response = await _requestService.getRequest(
          url: Constant.urls.branchesUrl(ownerName ?? '', repoName ?? ''));
      if (response.statusCode == HttpStatus.ok) {
        return Result.value(List<Branches>.from(
            response.data!.map((x) => Branches.fromJson(x))));
      }
      return Result.error(response.data);
    } on DioException catch (err) {
      return Result.error(err);
    } catch (e) {
      return Result.error(e);
    }
  }
}
