import 'package:auto_route/auto_route.dart';
import 'package:banking_mobile_app/app/view/view_onboarding/bloc/onboarding_bloc.dart';
import 'package:banking_mobile_app/app/view/view_onboarding/mixin/onboarding_mixin.dart';
import 'package:banking_mobile_app/core/extension/context_extension.dart';
import 'package:banking_mobile_app/core/widgets/custom_elevated_button.dart';
import 'package:banking_mobile_app/core/widgets/custom_text_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class OnboardingView extends StatelessWidget with OnboardingMixin {
   OnboardingView({super.key});

  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingBloc(),
      child: BlocBuilder<OnboardingBloc, OnboardingState>(
        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(20),
              child: PageView.builder(
                controller: _pageController,
                itemCount: onboardingPages(context).length,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: context.height * 0.1,
                      ),
                      Center(
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 400),
                          height: context.height * 0.4,
                          width: context.width * 0.7,
                          child: Image.asset(
                            onboardingPages(context)[index]['image']!,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      CustomTextWidget(
                        text: onboardingPages(context)[index]['title']!,
                        fontWeight: FontWeight.bold,
                        fontsize: context.textTheme.headlineMedium?.fontSize,
                      ),
                      CustomElevatedButton(
                        text: 'Next',
                        onPressed: () => context.read<OnboardingBloc>().add(
                              IndicatorIncrementEvent(
                                context: context,
                                page: index,
                                pageController: _pageController,
                              ),
                            ),
                      ),
                    ],
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
