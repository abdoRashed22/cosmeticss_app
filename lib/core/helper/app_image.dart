import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppImage extends StatelessWidget {
  const AppImage({
    super.key,
    required this.image,
    this.width,
    this.height,
    this.color,
    this.fit,
  });
  final String image;
  final double? width, height;
  final Color? color;
  final BoxFit? fit;
  @override
  Widget build(BuildContext context) {
    if (image.toLowerCase().endsWith('.svg')) {
      return SvgPicture.asset(
        'assets/icons/$image',
        width: width,
        height: height,
        color: color,
        fit: fit ?? BoxFit.scaleDown,
      );
    } else if (image.toLowerCase().startsWith('http')) {
      return Image.network(
        image,
        width: width,
        height: height,
        color: color,
        fit: fit ?? BoxFit.scaleDown,
      );
    } else if (image.endsWith('json')) {
      return Image.asset(
        'assets/lotties/$image',
        width: width,
        height: height,
        color: color,
        fit: fit ?? BoxFit.scaleDown,
      );
    } else {
      return Image.asset(
        'assets/images/$image',
        width: width,
        height: height,
        color: color,
        fit: fit ?? BoxFit.scaleDown,
      );
    }
  }
}
