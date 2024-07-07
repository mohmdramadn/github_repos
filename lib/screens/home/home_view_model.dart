import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_repos/contract/remote/i_search_repository.dart';
import 'package:github_repos/models/search_result.dart';
import 'package:github_repos/services/message_service.dart';
import 'package:injectable/injectable.dart';

import '../../main.dart';

@injectable
class HomeViewModel extends ChangeNotifier {
  final ISearchRepository _searchRepository;

  HomeViewModel({ISearchRepository? searchRepository})
      : _searchRepository = searchRepository ?? getIt<ISearchRepository>();

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  void setIsLoading(value) {
    _isLoading = value;
    notifyListeners();
  }

  bool _isShowSearchField = false;
  bool get isShowSearchField => _isShowSearchField;
  void setIsShowSearchField() {
    _isShowSearchField = !_isShowSearchField;
    notifyListeners();
  }

  bool _isShowFilters = false;
  bool get isShowFilters => _isShowFilters;
  void setIsShowFilters() {
    _isShowFilters = !_isShowFilters;
    notifyListeners();
  }

  TextEditingController searchController = TextEditingController();

  SearchResult? _searchResult;
  SearchResult? get searchResult => _searchResult;

  Future<void> searchGithubRepos() async {
    var searchQueries = {'q': searchController.text, 'sort': _selectedFilter};
    setIsLoading(true);
    var searchResponse =
        await _searchRepository.searchGithubRepositories(searchQueries);
    setIsLoading(false);

    if (searchResponse.isError) {
      return MessageService().showErrorSnackBar('',
          searchResponse.asError?.error.toString() ?? 'Something went wrong');
    }

    _searchResult = searchResponse.asValue!.value;
    notifyListeners();
  }

  final List<String> filters = ['best match','stars','forks','help-wanted-issues','updated'];

  late String _selectedFilter = 'Best match';
  String get selectedFilter => _selectedFilter;
  void setSelectedFilter(value){
    _selectedFilter = value;
    notifyListeners();
    if(searchController.text != '') searchGithubRepos();
  }
}
