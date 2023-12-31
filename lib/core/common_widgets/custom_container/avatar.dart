import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  const Avatar({
    required this.radius,
    super.key,
    this.photoUrl,
    this.borderColor,
    this.borderWidth,
  });
  final String? photoUrl;
  final double radius;
  final Color? borderColor;
  final double? borderWidth;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: _borderDecoration(),
      child: Padding(
        padding: const EdgeInsets.all(1),
        child: CircleAvatar(
          radius: radius,
          backgroundColor: Colors.black12,
          backgroundImage: photoUrl != null
              ? NetworkImage(
                  photoUrl!,
                )
              : null,
          child: photoUrl == null ? Icon(Icons.camera_alt, size: radius) : null,
        ),
      ),
    );
  }

  Decoration _borderDecoration() {
    if (borderColor != null && borderWidth != null) {
      return BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor!,
          width: borderWidth!,
        ),
      );
    }
    return BoxDecoration();
  }
}
