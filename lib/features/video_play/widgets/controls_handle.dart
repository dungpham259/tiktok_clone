import 'package:flutter/material.dart';
import 'package:tiktok/core/common_widgets/custom_container/avatar.dart';
import 'package:tiktok/core/constants/app_sizes.dart';
import 'package:tiktok/core/constants/shortcuts.dart';

class ControlsHandle extends StatelessWidget {
  const ControlsHandle({
    super.key,
    required this.avatarUrl,
  });
  final String avatarUrl;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 5,
      child: Column(
        children: [
          avatar(
            context,
            avtUrl: avatarUrl,
          ),
          gapH32,
          itemHandle(
            context,
            icon: Icons.favorite,
            value: '112.5k',
          ),
          itemHandle(
            context,
            icon: Icons.message,
            value: '544',
          ),
          itemHandle(
            context,
            icon: Icons.save,
            value: '3233',
          ),
          itemHandle(
            context,
            icon: Icons.share,
            value: '616',
          ),
        ],
      ),
    );
  }

  Widget avatar(BuildContext context, {required avtUrl}) {
    return Stack(
      alignment: Alignment.bottomCenter,
      clipBehavior: Clip.none,
      children: [
        Avatar(
          radius: 30,
          borderColor: Colors.white,
          borderWidth: 1,
          photoUrl:
              'https://www.facetofacemedical.com.au/wp-content/uploads/2021/12/Male-rejuvenation-01.jpg',
        ),
        Positioned(
          bottom: -12,
          child: Container(
            decoration:
                BoxDecoration(color: Colors.red, shape: BoxShape.circle),
            child: Padding(
              padding: const EdgeInsets.all(1.5),
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget itemHandle(
    BuildContext context, {
    required IconData icon,
    required String value,
    String? value2,
  }) {
    return Column(
      children: [
        InkWell(
          child: Icon(
            icon,
            size: 40,
            color: Colors.white,
          ),
        ),
        gapH4,
        Text(
          value,
          style: context.textTheme.bodyMedium!.copyWith(
            color: Colors.white,
          ),
        ),
        gapH16,
      ],
    );
  }
}
