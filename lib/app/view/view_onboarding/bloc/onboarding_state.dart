part of 'onboarding_bloc.dart';

sealed class OnboardingState extends Equatable {
  const OnboardingState({required this.page});
  final int page;

  @override
  List<Object> get props => [page];
}

final class OnboardingInitial extends OnboardingState {
  const OnboardingInitial({required super.page});

  @override
  List<Object> get props => [page];
}
