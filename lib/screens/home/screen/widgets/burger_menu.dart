import 'package:flutter/material.dart';
import 'package:geo_tracker/screens/profile/screen/profile_screen.dart';

import 'package:get_it/get_it.dart';

import 'package:geo_tracker/screens/auth/domain/auth_service.dart';
import 'package:geo_tracker/screens/auth/screen/auth_screen.dart';
import 'package:geo_tracker/screens/auth/screen/widgets/image_logo_app.dart';

// ---Text---
const String _exit = 'exit';
const String _profile = 'profile';

// ---Parameters---
const double _indent20 = 20.0;
const double _indent40 = 40.0;

class BurgerMenu extends StatelessWidget {
  BurgerMenu({
    super.key,
  });

  final AuthService authService = GetIt.instance.get<AuthService>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const SizedBox(height: _indent40),
          const ImageLogoApp(),
          const SizedBox(height: _indent40),
          ListTile(
            title: Text(_profile.toUpperCase()),
            onTap: () {
              Navigator.pushReplacement(context, ProfileScreen.route);
            },
          ),
          const Spacer(),
          TextButton(
            onPressed: () {
              authService.logOut();
              Navigator.pushReplacement(context, AuthScreen.route);
            },
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(
                  const Size(double.maxFinite, _indent40)),
              backgroundColor: MaterialStateProperty.all(Colors.grey.shade200),
            ),
            child: Text(_exit.toUpperCase()),
          ),
          const SizedBox(height: _indent20),
        ],
      ),
    );
  }
}
