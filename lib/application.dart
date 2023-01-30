import 'package:flutter/material.dart';
import 'package:geo_tracker/screens/auth/screen/auth_screen.dart';

class Application extends StatefulWidget {
  const Application({
    Key? key,
  }) : super(key: key);

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget child = MaterialApp(
      onGenerateRoute: onGenerateRoute,
    );
    return child;
  }

  Route onGenerateRoute(RouteSettings? settings) {
    return AuthScreen.route;
  }
}
