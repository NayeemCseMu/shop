import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LazyLoading extends StatelessWidget {
  const LazyLoading({
    this.height,
    this.width,
  });
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[200]!,
      highlightColor: Colors.grey[100]!,
      direction: ShimmerDirection.ltr,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[400],
        ),
      ),
    );
  }
}
