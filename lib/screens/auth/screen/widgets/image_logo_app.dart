import 'package:flutter/material.dart';

import 'package:geo_tracker/infrastructure/theme/app_image.dart';

// ---Parameters---
const double _imageSize = 150.0;

class ImageLogoApp extends StatelessWidget {
  const ImageLogoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Image.asset(
        AppImages.logo,
        height: _imageSize,
        width: _imageSize,
      ),
    );
  }
}
