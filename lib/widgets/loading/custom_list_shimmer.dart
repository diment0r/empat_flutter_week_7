import 'package:empat_flutter_week_7/state/theme_model.dart';
import 'package:empat_flutter_week_7/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class CustomListShimmerWidget extends StatelessWidget {
  const CustomListShimmerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(
      builder: (context, themeModel, child) => Shimmer.fromColors(
        baseColor: themeModel.isDark
            ? const Color.fromARGB(255, 45, 45, 45)
            : ThemeDesignData.baseShimmerColor,
        highlightColor: themeModel.isDark
            ? const Color.fromARGB(255, 52, 52, 52)
            : ThemeDesignData.highlightShimmerColor,
        direction: ShimmerDirection.ltr,
        period: const Duration(milliseconds: 1000),
        child: const SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: _ShimmerBody(),
        ),
      ),
    );
  }
}

class _ShimmerBody extends StatelessWidget {
  const _ShimmerBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemBuilder: (context, index) => IntrinsicHeight(
        child: Row(
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 20,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  height: 20,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      itemCount: 4,
    );
  }
}
