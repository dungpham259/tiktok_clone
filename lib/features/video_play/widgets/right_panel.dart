import 'package:flutter/material.dart';
import 'package:tiktok/core/common_widgets/custom_container/avatar.dart';
import 'package:tiktok/core/constants/app_sizes.dart';
import 'package:tiktok/core/constants/shortcuts.dart';
import 'package:tiktok/features/video_play/widgets/bookmark_button.dart';
import 'package:tiktok/features/video_play/widgets/disc_wheel.dart';
import 'package:tiktok/features/video_play/widgets/favorite_button.dart';
import 'package:tiktok/gen/assets.gen.dart';
import 'package:video_player/video_player.dart';

class RightPanel extends StatelessWidget {
  const RightPanel({
    super.key,
    required this.avatarUrl,
    required this.videoController,
  });
  final String avatarUrl;
  final VideoPlayerController videoController;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: Sizes.p8,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          avatar(
            context,
            avtUrl: avatarUrl,
          ),
          gapH32,
          FavoriteButton(),
          gapH16,
          itemHandle(
            context,
            icon: Assets.icons.svg.comment.svg(),
            value: '544',
          ),
          BookMarkButton(),
          gapH16,
          itemHandle(
            context,
            icon: Assets.icons.svg.share.svg(),
            value: '616',
          ),
          DiscWheel(
            isAnimating: videoController.value.isPlaying,
          ),
          gapH16,
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
      ],
    );
  }

  Widget itemHandle(
    BuildContext context, {
    required Widget icon,
    required String value,
    String? value2,
    VoidCallback? onTap,
  }) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: SizedBox(
            height: Sizes.p36,
            child: icon,
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
