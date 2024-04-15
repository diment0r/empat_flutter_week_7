import 'package:empat_flutter_week_7/state/user_model.dart';
import 'package:empat_flutter_week_7/widgets/loading/custom_octo_image.dart';
import 'package:flutter/material.dart';

class CustomUserListTileWidget extends StatelessWidget {
  final UserModel user;

  const CustomUserListTileWidget({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          SizedBox(
            height: 150,
            width: 150,
            child: CustomOctoImageWidget(
              imageRadius: 25,
              imageAsset: user.avatarAsset,
              imageHeight: 150,
            ),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${user.firstName} ${user.lastName}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                user.email,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
