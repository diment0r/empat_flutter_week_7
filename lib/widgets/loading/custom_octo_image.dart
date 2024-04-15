import 'package:empat_flutter_week_7/widgets/loading/custom_image_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';

class CustomOctoImageWidget extends StatelessWidget {
  final double imageHeight;
  final double imageRadius;
  final String imageAsset;

  const CustomOctoImageWidget({
    super.key,
    required this.imageAsset,
    required this.imageHeight,
    required this.imageRadius,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(imageRadius)),
      child: OctoImage(
        fit: BoxFit.cover,
        image: NetworkImage(imageAsset),
        placeholderBuilder: (context) => CustomImageShimmerWidget(
          height: imageHeight,
          radius: imageRadius,
        ),
      ),
    );
  }
}
