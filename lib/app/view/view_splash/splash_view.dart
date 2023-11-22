import 'package:auto_route/auto_route.dart';
import 'package:banking_mobile_app/app/routes/app_router.dart';
import 'package:banking_mobile_app/app/view/view_auth/bloc/auth_bloc.dart';
import 'package:banking_mobile_app/app/view/view_auth/bloc/auth_state.dart';
import 'package:banking_mobile_app/core/constants/color_constant.dart';
import 'package:banking_mobile_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc()..add(const CurrentUserEvent()),
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is Authenticated) {
            Future.delayed(const Duration(seconds: 2), () {
              context.router.push(HomeRoute());
            });
          } else if (state is UnAuthenticated) {
            Future.delayed(const Duration(seconds: 2), () {
              context.router.push(const LoginRoute());
            });
          }

          return Scaffold(
            backgroundColor: DarkColorConstants.splashColor,
            body: Stack(
              children: [
                Align(
                  child: SizedBox(
                    width: 200,
                    height: 200,
                    child: Image.asset(
                      Assets.images.splashLogo.path,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 50),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Image.asset(
                      Assets.icons.loadingGif.path,
                      width: 50,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
