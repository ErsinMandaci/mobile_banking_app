/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/apple.png
  AssetGenImage get apple => const AssetGenImage('assets/icons/apple.png');

  /// File path: assets/icons/credit-card.png
  AssetGenImage get creditCard =>
      const AssetGenImage('assets/icons/credit-card.png');

  /// File path: assets/icons/google.png
  AssetGenImage get google => const AssetGenImage('assets/icons/google.png');

  /// File path: assets/icons/home.png
  AssetGenImage get home => const AssetGenImage('assets/icons/home.png');

  /// File path: assets/icons/loading.gif
  AssetGenImage get loadingGif =>
      const AssetGenImage('assets/icons/loading.gif');

  /// File path: assets/icons/loading.png
  AssetGenImage get loadingPng =>
      const AssetGenImage('assets/icons/loading.png');

  /// File path: assets/icons/scanner.png
  AssetGenImage get scanner => const AssetGenImage('assets/icons/scanner.png');

  /// File path: assets/icons/user.png
  AssetGenImage get user => const AssetGenImage('assets/icons/user.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [apple, creditCard, google, home, loadingGif, loadingPng, scanner, user];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/credi-cart.png
  AssetGenImage get crediCart =>
      const AssetGenImage('assets/images/credi-cart.png');

  /// File path: assets/images/lets_your.png
  AssetGenImage get letsYour =>
      const AssetGenImage('assets/images/lets_your.png');

  /// File path: assets/images/onboarding_one.png
  AssetGenImage get onboardingOne =>
      const AssetGenImage('assets/images/onboarding_one.png');

  /// File path: assets/images/onboarding_three.png
  AssetGenImage get onboardingThree =>
      const AssetGenImage('assets/images/onboarding_three.png');

  /// File path: assets/images/onboarding_two.png
  AssetGenImage get onboardingTwo =>
      const AssetGenImage('assets/images/onboarding_two.png');

  /// File path: assets/images/splash_logo.png
  AssetGenImage get splashLogo =>
      const AssetGenImage('assets/images/splash_logo.png');

  /// File path: assets/images/success_amount.png
  AssetGenImage get successAmount =>
      const AssetGenImage('assets/images/success_amount.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        crediCart,
        letsYour,
        onboardingOne,
        onboardingThree,
        onboardingTwo,
        splashLogo,
        successAmount
      ];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
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
