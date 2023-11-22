import 'package:auto_route/auto_route.dart';
import 'package:banking_mobile_app/app/routes/app_router.dart';
import 'package:banking_mobile_app/core/constants/color_constant.dart';
import 'package:flutter/material.dart';

@RoutePage()
class BottomNavigationView extends StatefulWidget {
  const BottomNavigationView({super.key});

  @override
  State<BottomNavigationView> createState() => _BottomNavigationViewState();
}

class _BottomNavigationViewState extends State<BottomNavigationView> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      lazyLoad: false,
      resizeToAvoidBottomInset: false,
      routes: [
        HomeRoute(),
        HomeRoute(),
        HomeRoute(),
        HomeRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          backgroundColor: DarkColorConstants.outlinedButtonColor,
          unselectedItemColor: Colors.grey,
          selectedIconTheme: const IconThemeData(color: DarkColorConstants.elevatedButtonColor),
          selectedItemColor: DarkColorConstants.elevatedButtonColor,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_filled,
                color: DarkColorConstants.elevatedButtonColor,
              ),
              label: 'Home',
            ),
          ],
        );
      },
    );
  }
}
