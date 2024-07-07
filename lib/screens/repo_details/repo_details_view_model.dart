import 'package:flutter/material.dart';
import 'package:github_repos/models/branches.dart';
import 'package:injectable/injectable.dart';

import '../../contract/remote/i_repo_details_repository.dart';
import '../../main.dart';
import '../../services/message_service.dart';

@injectable
class RepoDetailsViewModel extends ChangeNotifier {
  final IRepoDetailsRepository _repoDetailsRepository;

  RepoDetailsViewModel(IRepoDetailsRepository? repoDetailsRepository)
      : _repoDetailsRepository =
            repoDetailsRepository ?? getIt<IRepoDetailsRepository>();

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  void setIsLoading(value) {
    _isLoading = value;
    notifyListeners();
  }

  List<Branches>? _branches;
  List<Branches>? get branches => _branches;

  String? _ownerName;
  String? get ownerName => _ownerName;
  void setOwnerName(value){
    _ownerName = value;
    notifyListeners();
  }

String? _repoName;
String? get repoName => _repoName;
void setRepoName(value) {
  _repoName = value;
  notifyListeners();
}

  Future<void> getRepoDetails() async {
    setIsLoading(true);
    var branchResponse = await _repoDetailsRepository.getBranches(
        ownerName: ownerName, repoName: repoName);


    if (branchResponse.isError) {
      setIsLoading(false);
      return MessageService().showErrorSnackBar('',
          branchResponse.asError?.error.toString() ?? 'Something went wrong');
    }

    _branches = branchResponse.asValue!.value;
    setIsLoading(false);
    notifyListeners();
  }
}
