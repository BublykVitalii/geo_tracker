import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injectable.init.config.dart';

@InjectableInit(asExtension: false)
Future<void> configureDependencies(GetIt getIt) async => init(getIt);
