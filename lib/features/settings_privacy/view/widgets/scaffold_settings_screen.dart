import 'package:flutter/material.dart';
import 'package:tiktok/core/constants/constants.dart';

class ScaffoldSettingScreen extends StatelessWidget {
  const ScaffoldSettingScreen(
      {super.key,
      required this.title,
      required this.body,
      this.leading,
      this.actions,
      this.leadingWidth});
  final String? title;
  final Widget body;
  final Widget? leading;
  final List<Widget>? actions;
  final double? leadingWidth;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: $constants.appColor.kBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: $constants.appColor.kBackgroundColor,
        surfaceTintColor: Colors.transparent,
        title: title != null ? Text(title!) : null,
        leadingWidth: leadingWidth,
        leading: leading,
        actions: actions,
      ),
      body: body,
    );
  }
}
