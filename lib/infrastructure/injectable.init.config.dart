// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:geo_tracker/screens/auth/api/http_auth_repository.dart' as _i8;
import 'package:geo_tracker/screens/auth/domain/auth_repository.dart' as _i7;
import 'package:geo_tracker/screens/auth/domain/auth_service.dart' as _i9;
import 'package:geo_tracker/screens/profile/api/firebase_user_repository.dart'
    as _i5;
import 'package:geo_tracker/screens/profile/domain/user_repository.dart' as _i4;
import 'package:geo_tracker/screens/profile/domain/user_service.dart' as _i6;
import 'package:geo_tracker/utils/store_interaction.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of main-scope dependencies inside of [GetIt]
_i1.GetIt init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.singleton<_i3.StoreInteraction>(_i3.StoreInteraction());
  gh.singleton<_i4.UserRepository>(_i5.FirebaseTodoRepository());
  gh.singleton<_i6.UserService>(_i6.UserService(gh<_i4.UserRepository>()));
  gh.singleton<_i7.AuthRepository>(
      _i8.HttpAuthRepository(gh<_i3.StoreInteraction>()));
  gh.singleton<_i9.AuthService>(_i9.AuthService(gh<_i7.AuthRepository>()));
  return getIt;
}
