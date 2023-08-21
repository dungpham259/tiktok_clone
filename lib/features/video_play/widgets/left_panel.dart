import 'package:flutter/material.dart';
import 'package:tiktok/core/constants/app_sizes.dart';
import 'package:tiktok/core/constants/constants.dart';
import 'package:tiktok/core/constants/shortcuts.dart';

class LeftPanel extends StatelessWidget {
  const LeftPanel({
    Key? key,
    required this.name,
    required this.caption,
    required this.songName,
  }) : super(key: key);

  final String name;
  final String caption;
  final String songName;

  @override
  Widget build(BuildContext context) {
    final whiteColor = $constants.appColor.kWhite;
    return Padding(
      padding: const EdgeInsets.only(
        left: Sizes.p8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            name,
            style: context.textTheme.titleMedium!.copyWith(
              color: whiteColor,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          gapH12,
          Text(
            caption,
            style: TextStyle(color: whiteColor),
          ),
          gapH12,
          Row(
            children: <Widget>[
              Icon(
                Icons.music_note_sharp,
                color: whiteColor,
                size: 15,
              ),
              Flexible(
                child: Text(
                  songName,
                  style: TextStyle(color: whiteColor, height: 1.5),
                ),
              )
            ],
          ),
          gapH16,
        ],
      ),
    );
  }
}
