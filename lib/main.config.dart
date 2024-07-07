// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'contract/remote/i_repo_details_repository.dart' as _i13;
import 'contract/remote/i_search_repository.dart' as _i9;
import 'contract/services/i_connection_service.dart' as _i4;
import 'contract/services/i_message_service.dart' as _i6;
import 'contract/services/i_request_service.dart' as _i10;
import 'repositories/repo_details_repository.dart' as _i15;
import 'repositories/search_repository.dart' as _i14;
import 'screens/home/home_view_model.dart' as _i8;
import 'screens/repo_details/repo_details_view_model.dart' as _i12;
import 'services/connection_service.dart' as _i5;
import 'services/favorites_service.dart' as _i3;
import 'services/message_service.dart' as _i7;
import 'services/request_service.dart' as _i11;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.singleton<_i3.FavoritesDataService>(() => _i3.FavoritesDataService());
  gh.singleton<_i4.IConnectionService>(() => _i5.ConnectionService());
  gh.singleton<_i6.IMessageService>(() => _i7.MessageService());
  gh.factory<_i8.HomeViewModel>(
      () => _i8.HomeViewModel(searchRepository: gh<_i9.ISearchRepository>()));
  gh.singleton<_i10.IRequestService>(() => _i11.RequestService());
  gh.factory<_i12.RepoDetailsViewModel>(
      () => _i12.RepoDetailsViewModel(gh<_i13.IRepoDetailsRepository>()));
  gh.factory<_i9.ISearchRepository>(
      () => _i14.SearchRepository(requestService: gh<_i10.IRequestService>()));
  gh.factory<_i13.IRepoDetailsRepository>(
      () => _i15.RepoDetailsRepository(gh<_i10.IRequestService>()));
  return getIt;
}
