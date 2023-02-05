import 'package:flutter/material.dart';

class UserPhoto extends StatelessWidget {
  final String photo;
  const UserPhoto({
    super.key,
    required this.photo,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.network(
        photo,
        scale: 0.4,
      ),
    );
  }
}
