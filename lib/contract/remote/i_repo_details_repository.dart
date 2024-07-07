import '../../models/branches.dart';
// ignore: depend_on_referenced_packages
import 'package:async/async.dart';

abstract class IRepoDetailsRepository {
  Future<Result<List<Branches>>> getBranches(
      {String? ownerName, String? repoName});
}