import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geo_tracker/application.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(const Application());
}
