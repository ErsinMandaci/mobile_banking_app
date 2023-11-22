import 'package:auto_route/auto_route.dart';
import 'package:banking_mobile_app/app/routes/app_router.dart';
import 'package:banking_mobile_app/app/view/view_auth/bloc/auth_bloc.dart';
import 'package:banking_mobile_app/app/view/view_auth/bloc/auth_state.dart';
import 'package:banking_mobile_app/app/view/view_auth/view_signup/mixin/signup_mixin.dart';
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
class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> with SignUpMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const CustomAppBar(),
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return Padding(
            padding: context.paddingNormal,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextWidget(
                  text: 'Create your',
                  fontsize: context.textTheme.headlineLarge?.fontSize,
                ),
                CustomTextWidget(
                  text: 'Account',
                  fontsize: context.textTheme.headlineLarge?.fontSize,
                ),
                SizedBox(
                  height: context.height * 0.05,
                ),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      //    const _NameTextField(),
                      SizedBox(
                        height: context.height * 0.02,
                      ),
                      _EmailTextField(emailController: emailController),
                      SizedBox(
                        height: context.height * 0.02,
                      ),
                      _PasswordTextField(
                        passwordController: passwordController,
                      ),
                      SizedBox(
                        height: context.height * 0.05,
                      ),
                      CustomElevatedButton(
                        onPressed: () {
                          context.read<AuthBloc>().add(
                                SignUpEvent(
                                  email: emailController.text,
                                  password: passwordController.text,
                                  context: context,
                                ),
                              );
                        },
                        text: 'Sign up',
                      ),
                      SizedBox(
                        height: context.height * 0.1,
                      ),
                      const _ContinueText(),
                      SizedBox(
                        height: context.height * 0.05,
                      ),
                      const _LoginSocialButton(),
                    ],
                  ),
                ),
                const _AlreadyHaveAccountText(),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _AlreadyHaveAccountText extends StatelessWidget {
  const _AlreadyHaveAccountText();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.onlyTopPaddingMedium,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CustomTextWidget(
            text: 'Already have an account?',
            fontWeight: FontWeight.normal,
            fontsize: 16,
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: context.onlyRightPaddingMedium,
            child: TextButton(
              onPressed: () => context.router.push(const LoginRoute()),
              child: const CustomTextWidget(
                text: 'Sign in',
                fontWeight: FontWeight.normal,
                color: DarkColorConstants.elevatedButtonColor,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PasswordTextField extends StatelessWidget {
  const _PasswordTextField({
    required this.passwordController,
  });

  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      obscureText: true,
      controller: passwordController,
      prefixIcon: const Icon(
        Icons.lock,
      ),
      hintText: 'password',
    );
  }
}

class _EmailTextField extends StatelessWidget {
  const _EmailTextField({
    required this.emailController,
  });

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: emailController,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Emai';
        }
        return null;
      },
      prefixIcon: const Icon(
        Icons.mail,
      ),
      hintText: 'Email',
    );
  }
}

class _NameTextField extends StatelessWidget {
  const _NameTextField();

  @override
  Widget build(BuildContext context) {
    return const CustomTextField(
      prefixIcon: Icon(
        Icons.mail,
      ),
      hintText: 'Name',
    );
  }
}

class _ContinueText extends StatelessWidget {
  const _ContinueText();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: const Color.fromARGB(145, 158, 158, 158),
            thickness: 1,
            indent: context.width * 0.04,
            endIndent: context.width * 0.04,
          ),
        ),
        const Text('or continue with'),
        Expanded(
          child: Divider(
            color: const Color.fromARGB(145, 158, 158, 158),
            thickness: 1,
            indent: context.width * 0.04,
          ),
        ),
      ],
    );
  }
}

class _LoginSocialButton extends StatelessWidget {
  const _LoginSocialButton();

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
