import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;
  
  const LoadingWidget({
    super.key,
    this.width,
    this.height,
    this.borderRadius,
  });
  
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).colorScheme.surfaceContainerHighest,
      highlightColor: Theme.of(context).colorScheme.surface,
      child: Container(
        width: width ?? double.infinity,
        height: height ?? 20,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: borderRadius ?? BorderRadius.circular(8),
        ),
      ),
    );
  }
}

class LoadingListWidget extends StatelessWidget {
  final int itemCount;
  final double itemHeight;
  final EdgeInsets padding;
  
  const LoadingListWidget({
    super.key,
    this.itemCount = 5,
    this.itemHeight = 80,
    this.padding = const EdgeInsets.all(16),
  });
  
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: padding,
      itemCount: itemCount,
      separatorBuilder: (_, __) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        return _buildLoadingItem(context);
      },
    );
  }
  
  Widget _buildLoadingItem(BuildContext context) {
    return Container(
      height: itemHeight,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.shadow.withValues(alpha: 0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          LoadingWidget(
            width: itemHeight - 24,
            height: itemHeight - 24,
            borderRadius: BorderRadius.circular(8),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LoadingWidget(height: 16, width: double.infinity),
                const SizedBox(height: 8),
                LoadingWidget(height: 14, width: 150),
              ],
            ),
          ),
        ],
      ),
    );
  }
} 