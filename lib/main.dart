import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/services.dart';
import 'package:geo_tracker/application.dart';
import 'package:geo_tracker/firebase_options.dart';
import 'package:geo_tracker/infrastructure/injectable.init.dart';

import 'package:geo_tracker/screens/auth/domain/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  final getIt = GetIt.instance;
  await configureDependencies(getIt);

  final AuthService authService = getIt.get<AuthService>();
  final loggedIn = await authService.inLoggedIn();

  runApp(Application(isLoggedIn: loggedIn));
}
