import 'package:auto_route/auto_route.dart';
import 'package:banking_mobile_app/app/view/view_auth/view_login/login_view.dart';
import 'package:banking_mobile_app/app/view/view_auth/view_signup/signup_view.dart';
import 'package:banking_mobile_app/app/view/view_bottom_nav_bar/bottom_nav_bar_view.dart';
import 'package:banking_mobile_app/app/view/view_home/home_view.dart';
import 'package:banking_mobile_app/app/view/view_lets_in/lets_in_view.dart';
import 'package:banking_mobile_app/app/view/view_onboarding/onboarding_view.dart';
import 'package:banking_mobile_app/app/view/view_splash/splash_view.dart';
import 'package:banking_mobile_app/app/view/view_transfer_money/add_new_transfer_view.dart';
import 'package:banking_mobile_app/app/view/view_transfer_money/transfer_list_view.dart';
import 'package:banking_mobile_app/app/view/view_transfer_money/transfer_money_view.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'View,Route',
)
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.custom();

  @override
  final List<AutoRoute> routes = [
    // AutoRoute(
    //   page: BottomNavigationRoute.page,
    //   children: [
    //     AutoRoute(page: HomeRoute.page),
    //     AutoRoute(page: HomeRoute.page),
    //     AutoRoute(page: HomeRoute.page),
    //     AutoRoute(page: HomeRoute.page),
    //   ],
    // ),
    AutoRoute(
      page: SplashRoute.page,
    ),
    AutoRoute(
      page: LetsInRoute.page,
    ),
    AutoRoute(
      page: SignUpRoute.page,
    ),
    AutoRoute(
      page: LoginRoute.page,
    ),
    AutoRoute(
      page: OnboardingRoute.page,
    ),
    AutoRoute(
      initial: true,
      page: HomeRoute.page,
    ),
    AutoRoute(page: TransferMoneyRoute.page),
    AutoRoute(page: TransferListRoute.page),
    AutoRoute(
      page: AddNewTransferRoute.page,
    ),
  ];
}
