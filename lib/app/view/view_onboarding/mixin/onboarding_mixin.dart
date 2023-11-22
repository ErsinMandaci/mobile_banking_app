import 'package:banking_mobile_app/gen/assets.gen.dart';
import 'package:banking_mobile_app/app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

mixin OnboardingMixin {
  List<Map<String, String>> onboardingPages(BuildContext context) {
    return [
      {
        'image': Assets.images.onboardingOne.path,
        'title': L10n.of(context)?.onboardingFirstTitle ?? '',
      },
      {
        'image': Assets.images.onboardingTwo.path,
        'title': L10n.of(context)?.onboardingSecondTitle ?? '',
      },
      {
        'image': Assets.images.onboardingThree.path,
        'title': L10n.of(context)?.onboardingThirdTitle ?? '',
      },
    ];
  }
}
