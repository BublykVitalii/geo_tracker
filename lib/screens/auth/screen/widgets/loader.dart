import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  const Loader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.white,
      child: const CircularProgressIndicator(
        backgroundColor: Colors.white,
        color: Colors.blue,
      ),
    );
  }
}
