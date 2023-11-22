part of 'onboarding_bloc.dart';

sealed class OnboardingEvent extends Equatable {
  const OnboardingEvent();

  @override
  List<Object> get props => [];
}

final class IndicatorIncrementEvent extends OnboardingEvent {
  const IndicatorIncrementEvent({required this.page, required this.context, required this.pageController});
  final int page;
  final BuildContext context;
  final PageController pageController;
}
