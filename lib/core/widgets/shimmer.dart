import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:store/core/extensions/navigator_extension.dart';

class LoadingShimmer extends StatelessWidget {
  const LoadingShimmer({
    super.key,
    this.height,
    this.width,
    this.borderRadius,
  });
  final double? height;
  final double? width;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor:  Color(0xFFC2C2C2),
      //Colors.grey.shade100,
      highlightColor:Colors.white,
      //Colors.grey.shade600
      child: Container(
        height: height,
        width: width,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: context.color.shimmer,
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius ?? 14),
          ),
        ),
      ),
    );
  }
}
