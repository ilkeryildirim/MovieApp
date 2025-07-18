import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieWidget extends StatelessWidget {
  final String assetPath;
  final double? width;
  final double? height;
  final bool repeat;
  final bool reverse;
  final AnimationController? controller;
  final VoidCallback? onComplete;
  final BoxFit fit;

  const LottieWidget({
    super.key,
    required this.assetPath,
    this.width,
    this.height,
    this.repeat = true,
    this.reverse = false,
    this.controller,
    this.onComplete,
    this.fit = BoxFit.contain,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Lottie.asset(
        assetPath,
        controller: controller,
        repeat: repeat,
        reverse: reverse,
        fit: fit,
        onLoaded: (composition) {
          if (controller != null) {
            controller!.duration = composition.duration;
            if (onComplete != null) {
              controller!.addStatusListener((status) {
                if (status == AnimationStatus.completed) {
                  onComplete!();
                }
              });
            }
          }
        },
      ),
    );
  }
}

class AppLottieAssets {
  static const String loading = 'assets/lottie/loading.json';
  static const String success = 'assets/lottie/success.json';
  static const String error = 'assets/lottie/error.json';
  static const String empty = 'assets/lottie/empty.json';
}

// Predefined Lottie Widgets
class LoadingLottie extends StatelessWidget {
  final double size;

  const LoadingLottie({
    super.key,
    this.size = 60,
  });

  @override
  Widget build(BuildContext context) {
    return LottieWidget(
      assetPath: AppLottieAssets.loading,
      width: size,
      height: size,
      repeat: true,
    );
  }
}

class SuccessLottie extends StatelessWidget {
  final double size;
  final VoidCallback? onComplete;

  const SuccessLottie({
    super.key,
    this.size = 80,
    this.onComplete,
  });

  @override
  Widget build(BuildContext context) {
    return LottieWidget(
      assetPath: AppLottieAssets.success,
      width: size,
      height: size,
      repeat: false,
      onComplete: onComplete,
    );
  }
}

class ErrorLottie extends StatelessWidget {
  final double size;
  final VoidCallback? onComplete;

  const ErrorLottie({
    super.key,
    this.size = 80,
    this.onComplete,
  });

  @override
  Widget build(BuildContext context) {
    return LottieWidget(
      assetPath: AppLottieAssets.error,
      width: size,
      height: size,
      repeat: false,
      onComplete: onComplete,
    );
  }
}

class EmptyStateLottie extends StatelessWidget {
  final double size;

  const EmptyStateLottie({
    super.key,
    this.size = 120,
  });

  @override
  Widget build(BuildContext context) {
    return LottieWidget(
      assetPath: AppLottieAssets.empty,
      width: size,
      height: size,
      repeat: true,
    );
  }
} 