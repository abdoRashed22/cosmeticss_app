import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

class AppImage extends StatelessWidget {
  const AppImage({
    super.key,
    required this.image,
    this.width,
    this.height,
    this.color,
    this.fit,
    this.borderRadius,
  });

  final String image;
  final double? width, height;
  final Color? color;
  final BoxFit? fit;
  final BorderRadius? borderRadius;

  static const _fallbackUrl =
      'https://png.pngtree.com/png-vector/20240818/ourmid/pngtree-geset-of-luxury-beauty-cosmetic-makeup-bdifferent-png-image_13532167.png';

  Widget _wrap(Widget child) {
    if (borderRadius != null) {
      return ClipRRect(borderRadius: borderRadius!, child: child);
    }
    return child;
  }

  @override
  Widget build(BuildContext context) {
    final src = image.trim();

    // ── 1. SVG asset (اسم الملف بس أو path كامل)
    if (src.toLowerCase().endsWith('.svg')) {
      final path = src.startsWith('assets/') ? src : 'assets/icons/$src';
      return _wrap(
        SvgPicture.asset(
          path,
          width: width,
          height: height,
          colorFilter: color != null
              ? ColorFilter.mode(color!, BlendMode.srcIn)
              : null,
          fit: fit ?? BoxFit.scaleDown,
        ),
      );
    }

    // ── 2. Lottie asset
    if (src.toLowerCase().endsWith('.json')) {
      final path = src.startsWith('assets/') ? src : 'assets/lotties/$src';
      return _wrap(
        Lottie.asset(
          path,
          width: width,
          height: height,
          fit: fit ?? BoxFit.scaleDown,
        ),
      );
    }

    // ── 3. Network image (من الـ API)
    if (src.startsWith('http://') || src.startsWith('https://')) {
      return _wrap(
        Image.network(
          src,
          width: width,
          height: height,
          color: color,
          fit: fit ?? BoxFit.cover,
          // loading placeholder
          loadingBuilder: (context, child, progress) {
            if (progress == null) return child;
            return SizedBox(
              width: width,
              height: height,
              child: const Center(
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            );
          },
          // fallback لو الصورة فشلت
          errorBuilder: (context, error, stackTrace) => Image.network(
            _fallbackUrl,
            width: width,
            height: height,
            fit: fit ?? BoxFit.cover,
            errorBuilder: (_, __, ___) => _placeholder(),
          ),
        ),
      );
    }

    // ── 4. Local asset image
    final path = src.startsWith('assets/') ? src : 'assets/images/$src';
    return _wrap(
      Image.asset(
        path,
        width: width,
        height: height,
        color: color,
        fit: fit ?? BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => _placeholder(),
      ),
    );
  }

  Widget _placeholder() => Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      color: Colors.grey[200],
      borderRadius: borderRadius,
    ),
    child: const Icon(Icons.image_not_supported, color: Colors.grey),
  );
}
