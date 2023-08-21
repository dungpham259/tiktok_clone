import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:tiktok/core/constants/app_sizes.dart';
import 'package:tiktok/core/utils/helper/format.dart';
import 'package:tiktok/gen/assets.gen.dart';

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({super.key});

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  @override
  Widget build(BuildContext context) {
    return LikeButton(
      likeCountAnimationType: LikeCountAnimationType.none,
      circleColor: CircleColor(start: Colors.red, end: Colors.red),
      bubblesColor: BubblesColor(
        dotPrimaryColor: Colors.red,
        dotSecondaryColor: Colors.red,
      ),
      countPostion: CountPostion.bottom,
      size: Sizes.p36,
      likeBuilder: (bool isLiked) {
        return FittedBox(
          fit: BoxFit.cover,
          child: isLiked
              ? Assets.icons.svg.heart.svg(
                  colorFilter: ColorFilter.mode(
                    Colors.red,
                    BlendMode.srcIn,
                  ),
                )
              : Assets.icons.svg.heart.svg(),
        );
      },
      likeCount: 12999,
      countBuilder: (count, bool isLiked, String text) {
        Widget result;
        text = Format.formatCountNumber(count ?? 0);
        result = Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 13,
          ),
        );
        return result;
      },
    );
  }
}
