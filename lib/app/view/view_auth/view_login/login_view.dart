import 'package:auto_route/auto_route.dart';
import 'package:banking_mobile_app/app/l10n/app_localizations.dart';
import 'package:banking_mobile_app/app/routes/app_router.dart';
import 'package:banking_mobile_app/app/view/view_auth/bloc/auth_bloc.dart';
import 'package:banking_mobile_app/app/view/view_auth/bloc/auth_state.dart';
import 'package:banking_mobile_app/app/view/view_auth/view_login/mixin/login_mixin.dart';
import 'package:banking_mobile_app/core/constants/color_constant.dart';
import 'package:banking_mobile_app/core/extension/context_extension.dart';
import 'package:banking_mobile_app/core/widgets/custom_app_bar.dart';
import 'package:banking_mobile_app/core/widgets/custom_elevated_button.dart';
import 'package:banking_mobile_app/core/widgets/custom_outlined_button.dart';
import 'package:banking_mobile_app/core/widgets/custom_text_field.dart';
import 'package:banking_mobile_app/core/widgets/custom_text_widget.dart';
import 'package:banking_mobile_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with LoginMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is Loading) {
            return const Center(child: CircularProgressIndicator());
          }

          return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: const CustomAppBar(),
            body: Padding(
              padding: context.paddingNormal,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextWidget(
                    text: L10n.of(context)!.loginToYour,
                    fontsize: context.textTheme.headlineLarge?.fontSize,
                  ),
                  CustomTextWidget(
                    text:L10n.of(context)!.accout,
                    fontsize: context.textTheme.headlineLarge?.fontSize,
                  ),
                  SizedBox(
                    height: context.height * 0.05,
                  ),
                  Form(
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: emailController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return L10n.of(context)!.email;
                            }
                            return null;
                          },
                          prefixIcon: const Icon(
                            Icons.mail,
                          ),
                          hintText: L10n.of(context)!.email,
                        ),
                        SizedBox(
                          height: context.height * 0.02,
                        ),
                        CustomTextField(
                          obscureText: true,
                          controller: passwordController,
                          prefixIcon: const Icon(
                            Icons.lock,
                          ),
                          hintText: L10n.of(context)!.password,
                        ),
                        SizedBox(
                          height: context.height * 0.05,
                        ),
                        CustomElevatedButton(
                          onPressed: () {
                            context.read<AuthBloc>().add(
                                  SignInEvent(
                                    email: emailController.text,
                                    password: passwordController.text,
                                    context: context,
                                  ),
                                );
                            if (state is Error) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(L10n.of(context)!.error),
                                ),
                              );
                            }
                          },
                          text: L10n.of(context)!.signIn,
                        ),
                        SizedBox(
                          height: context.height * 0.15,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Divider(
                                color: const Color.fromARGB(145, 158, 158, 158),
                                thickness: 1,
                                indent: context.width * 0.04,
                                endIndent: context.width * 0.04,
                              ),
                            ),
                            Text(L10n.of(context)!.orContinueWith),
                            Expanded(
                              child: Divider(
                                color: const Color.fromARGB(145, 158, 158, 158),
                                thickness: 1,
                                indent: context.width * 0.04,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: context.height * 0.05,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomOutlinedButton(
                              icon: Image.asset(
                                Assets.icons.google.path,
                                width: 25,
                              ),
                              width: context.width * 0.2,
                              height: context.height * 0.07,
                              onPressed: () {},
                            ),
                            CustomOutlinedButton(
                              icon: Image.asset(
                                Assets.icons.apple.path,
                                color: Colors.white,
                                width: 25,
                              ),
                              width: context.width * 0.2,
                              height: context.height * 0.07,
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: context.onlyTopPaddingMedium,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomTextWidget(
                          text: L10n.of(context)!.dontHaveAccount,
                          fontWeight: FontWeight.normal,
                          fontsize: 16,
                          textAlign: TextAlign.center,
                        ),
                        Padding(
                          padding: context.onlyRightPaddingMedium,
                          child: TextButton(
                            onPressed: () =>
                                context.router.push(const SignUpRoute()),
                            child: CustomTextWidget(
                              text: L10n.of(context)!.signUp,
                              fontWeight: FontWeight.normal,
                              color: DarkColorConstants.elevatedButtonColor,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
