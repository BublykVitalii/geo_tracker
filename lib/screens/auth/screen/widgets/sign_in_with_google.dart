// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:geo_tracker/infrastructure/theme/app_image.dart';

// ---Text---
const String _authWithGoogle = 'authorization with google';

// ---Parameters---
const double _logoSize = 40.0;
const double _indent10 = 10.0;

class SignInWithGoogle extends StatelessWidget {
  final VoidCallback? onPressed;

  const SignInWithGoogle({
    Key? key,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.grey.shade200),
      ),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: _logoSize,
              child: Image.asset(AppImages.logoGoogle),
            ),
            const SizedBox(width: _indent10),
            Text(_authWithGoogle.toUpperCase()),
          ],
        ),
      ),
    );
  }
}
