import 'package:auto_route/auto_route.dart';
import 'package:banking_mobile_app/core/extension/context_extension.dart';
import 'package:banking_mobile_app/core/widgets/custom_app_bar.dart';
import 'package:banking_mobile_app/core/widgets/custom_elevated_button.dart';
import 'package:banking_mobile_app/core/widgets/custom_outlined_button.dart';
import 'package:banking_mobile_app/core/widgets/custom_text_widget.dart';
import 'package:banking_mobile_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';

@RoutePage()
class LetsInView extends StatelessWidget {
  const LetsInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Column(
        children: [
          const Spacer(),
          Center(
            child: SizedBox(
              width: context.width * 0.8,
              child: Image.asset(
                Assets.images.letsYour.path,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Center(
            child: CustomTextWidget(
              text: "Let's you in",
              fontsize: context.textTheme.headlineLarge?.fontSize,
            ),
          ),
          SizedBox(
            height: context.height * 0.05,
          ),
          CustomOutlinedButton(
            onPressed: () {},
            label: const Text('Continue with Google'),
          ),
          SizedBox(
            height: context.height * 0.03,
          ),
          CustomOutlinedButton(
            onPressed: () {},
            label: const Text('Continue with Apple'),
            icon: Image.asset(
              Assets.icons.apple.path,
              width: 25,
            ),
          ),
          SizedBox(
            height: context.height * 0.06,
          ),
          Row(
            children: [
              Expanded(
                child: Divider(
                  color: Colors.grey,
                  thickness: 1,
                  endIndent: context.width * 0.04,
                ),
              ),
              const Text('OR'),
              Expanded(
                child: Divider(
                  color: Colors.grey,
                  thickness: 1,
                  indent: context.width * 0.04,
                ),
              ),
            ],
          ),
          const Spacer(),
          Container(
            margin: EdgeInsets.only(bottom: context.height * 0.1),
            child: CustomElevatedButton(text: 'Sign in with password', onPressed: () {}),
          ),
        ],
      ),
    );
  }
}
