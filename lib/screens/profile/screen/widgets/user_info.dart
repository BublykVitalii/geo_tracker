import 'package:flutter/material.dart';

// ---Parameters---
const double _indent = 10.0;
const double _fontSize = 24.0;

class UserInfo extends StatelessWidget {
  final String name;
  final String email;
  const UserInfo({
    super.key,
    required this.name,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          name,
          style: const TextStyle(fontSize: _fontSize),
        ),
        const SizedBox(height: _indent),
        Text(
          email,
          style: const TextStyle(fontSize: _fontSize),
        ),
      ],
    );
  }
}
