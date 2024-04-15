import 'package:empat_flutter_week_7/state/theme_model.dart';
import 'package:empat_flutter_week_7/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class CustomImageShimmerWidget extends StatelessWidget {
  final double height;
  final double radius;

  const CustomImageShimmerWidget({
    super.key,
    required this.height,
    required this.radius,
  });

  @override
  Widget build(BuildContext context) {
     return Consumer<ThemeModel>(
       builder:(context, themeModel, child) => Shimmer.fromColors(
        baseColor: themeModel.isDark ?const Color.fromARGB(255, 45, 45, 45) : ThemeDesignData.baseShimmerColor,
        highlightColor: themeModel.isDark ? const Color.fromARGB(255, 52, 52, 52) : ThemeDesignData.highlightShimmerColor,
        direction: ShimmerDirection.ltr,
        period: const Duration(milliseconds: 1000),
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Container(
            width: double.infinity,
            height: height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius),
              color: Colors.white,
            ),
          ),
        ),
           ),
     );
  }
}
