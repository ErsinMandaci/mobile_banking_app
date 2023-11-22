import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:banking_mobile_app/app/routes/app_router.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

final class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc() : super(const OnboardingInitial(page: 0)) {
    on<IndicatorIncrementEvent>(_onIndicatorIncrementEvent);
  }

  FutureOr<void> _onIndicatorIncrementEvent(IndicatorIncrementEvent event, Emitter<OnboardingState> emit) {
    final newPageValue = event.page + 1;

    if (newPageValue < 3) {
      event.pageController.animateToPage(
        newPageValue,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      event.context.router.push(const LetsInRoute());
      emit(OnboardingInitial(page: event.page));
    }
  }
}
