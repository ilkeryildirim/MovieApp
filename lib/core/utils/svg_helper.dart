import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension SvgHelper on String {
  Widget toSvg({
    double? width,
    double? height,
    Color? color,
    BoxFit fit = BoxFit.contain,
    String? semanticsLabel,
  }) {
    return SvgPicture.asset(
      this,
      width: width?.w,
      height: height?.h,
      colorFilter: color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
      fit: fit,
      semanticsLabel: semanticsLabel,
    );
  }

  Widget toSvgIcon({
    double size = 24,
    Color? color,
    String? semanticsLabel,
  }) {
    return SvgPicture.asset(
      this,
      width: size.w,
      height: size.h,
      colorFilter: color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
      semanticsLabel: semanticsLabel,
    );
  }
}

class SvgIcon extends StatelessWidget {
  final String asset;
  final double? width;
  final double? height;
  final Color? color;
  final BoxFit fit;
  final String? semanticsLabel;

  const SvgIcon({
    super.key,
    required this.asset,
    this.width,
    this.height,
    this.color,
    this.fit = BoxFit.contain,
    this.semanticsLabel,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      asset,
      width: width?.w,
      height: height?.h,
      colorFilter: color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
      fit: fit,
      semanticsLabel: semanticsLabel,
    );
  }
} 