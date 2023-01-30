import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geo_tracker/application.dart';

void main() async {
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(const Application());
}
