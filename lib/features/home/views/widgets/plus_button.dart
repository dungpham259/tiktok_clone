import 'package:flutter/material.dart';
import 'package:tiktok/core/constants/constants.dart';

class PlusButton extends StatelessWidget {
  const PlusButton({
    super.key,
    required this.currentIndex,
  });

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('object');
      },
      child: SizedBox(
        height: 28,
        width: 43,
        child: Stack(
          alignment: Alignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Container(
                      color: $constants.appColor.kBlueMain,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: $constants.appColor.kRedMain,
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: 36,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: currentIndex == 0 ? Colors.white : Colors.black,
              ),
            ),
            Icon(
              Icons.add,
              size: 28,
              color: currentIndex == 0 ? Colors.black : Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
