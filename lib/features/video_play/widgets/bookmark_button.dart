import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:tiktok/core/constants/app_sizes.dart';
import 'package:tiktok/core/utils/helper/format.dart';

class BookMarkButton extends StatefulWidget {
  const BookMarkButton({super.key});

  @override
  State<BookMarkButton> createState() => _BookMarkButtonState();
}

class _BookMarkButtonState extends State<BookMarkButton> {
  @override
  Widget build(BuildContext context) {
    return LikeButton(
      likeCountAnimationType: LikeCountAnimationType.none,
      circleColor: CircleColor(start: Colors.yellow, end: Colors.yellow),
      bubblesColor: BubblesColor(
        dotPrimaryColor: Colors.yellow,
        dotSecondaryColor: Colors.yellow,
      ),
      countPostion: CountPostion.bottom,
      size: Sizes.p36,
      likeBuilder: (bool isLiked) {
        return FittedBox(
          fit: BoxFit.cover,
          child: Icon(
            Icons.bookmark_sharp,
            color: isLiked ? Colors.yellow : Colors.white,
          ),
        );
      },
      likeCount: 670,
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
