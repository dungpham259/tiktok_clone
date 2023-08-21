/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsAnimationsGen {
  const $AssetsAnimationsGen();

  /// File path: assets/animations/progress_loading.json
  String get progressLoading => 'assets/animations/progress_loading.json';

  /// List of all assets
  List<String> get values => [progressLoading];
}

class $AssetsEnvGen {
  const $AssetsEnvGen();

  /// File path: assets/env/.env.dev
  String get envDev => 'assets/env/.env.dev';

  /// File path: assets/env/.env.prod
  String get envProd => 'assets/env/.env.prod';

  /// List of all assets
  List<String> get values => [envDev, envProd];
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  $AssetsIconsPngGen get png => const $AssetsIconsPngGen();
  $AssetsIconsSvgGen get svg => const $AssetsIconsSvgGen();
}

class $AssetsLogoGen {
  const $AssetsLogoGen();

  /// File path: assets/logo/adaptive_icon_foreground.png
  AssetGenImage get adaptiveIconForeground =>
      const AssetGenImage('assets/logo/adaptive_icon_foreground.png');

  /// File path: assets/logo/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/logo/logo.png');

  /// List of all assets
  List<AssetGenImage> get values => [adaptiveIconForeground, logo];
}

class $AssetsIconsPngGen {
  const $AssetsIconsPngGen();

  /// File path: assets/icons/png/footstep.png
  AssetGenImage get footstep =>
      const AssetGenImage('assets/icons/png/footstep.png');

  /// List of all assets
  List<AssetGenImage> get values => [footstep];
}

class $AssetsIconsSvgGen {
  const $AssetsIconsSvgGen();

  /// File path: assets/icons/svg/account_active_bottom_bar.svg
  SvgGenImage get accountActiveBottomBar =>
      const SvgGenImage('assets/icons/svg/account_active_bottom_bar.svg');

  /// File path: assets/icons/svg/account_bottom_bar.svg
  SvgGenImage get accountBottomBar =>
      const SvgGenImage('assets/icons/svg/account_bottom_bar.svg');

  /// File path: assets/icons/svg/comment.svg
  SvgGenImage get comment => const SvgGenImage('assets/icons/svg/comment.svg');

  /// File path: assets/icons/svg/disc.svg
  SvgGenImage get disc => const SvgGenImage('assets/icons/svg/disc.svg');

  /// File path: assets/icons/svg/heart .svg
  SvgGenImage get heart => const SvgGenImage('assets/icons/svg/heart .svg');

  /// File path: assets/icons/svg/home_active_bottom_bar.svg
  SvgGenImage get homeActiveBottomBar =>
      const SvgGenImage('assets/icons/svg/home_active_bottom_bar.svg');

  /// File path: assets/icons/svg/home_bottom_bar.svg
  SvgGenImage get homeBottomBar =>
      const SvgGenImage('assets/icons/svg/home_bottom_bar.svg');

  /// File path: assets/icons/svg/message_active_bottom_bar.svg
  SvgGenImage get messageActiveBottomBar =>
      const SvgGenImage('assets/icons/svg/message_active_bottom_bar.svg');

  /// File path: assets/icons/svg/message_bottom_bar.svg
  SvgGenImage get messageBottomBar =>
      const SvgGenImage('assets/icons/svg/message_bottom_bar.svg');

  /// File path: assets/icons/svg/search_active_bottom_bar.svg
  SvgGenImage get searchActiveBottomBar =>
      const SvgGenImage('assets/icons/svg/search_active_bottom_bar.svg');

  /// File path: assets/icons/svg/search_bottom_bar.svg
  SvgGenImage get searchBottomBar =>
      const SvgGenImage('assets/icons/svg/search_bottom_bar.svg');

  /// File path: assets/icons/svg/share.svg
  SvgGenImage get share => const SvgGenImage('assets/icons/svg/share.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        accountActiveBottomBar,
        accountBottomBar,
        comment,
        disc,
        heart,
        homeActiveBottomBar,
        homeBottomBar,
        messageActiveBottomBar,
        messageBottomBar,
        searchActiveBottomBar,
        searchBottomBar,
        share
      ];
}

class Assets {
  Assets._();

  static const $AssetsAnimationsGen animations = $AssetsAnimationsGen();
  static const $AssetsEnvGen env = $AssetsEnvGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsLogoGen logo = $AssetsLogoGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter,
      color: color,
      colorBlendMode: colorBlendMode,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
