import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:banking_mobile_app/app/repository/auth_repository.dart';
import 'package:banking_mobile_app/app/routes/app_router.dart';
import 'package:banking_mobile_app/app/view/view_auth/bloc/auth_state.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'auth_event.dart';

final class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(UnAuthenticated()) {
    on<SignInEvent>(_signInEvent);
    on<SignUpEvent>(_signUpEvent);
    on<SignOutEvent>(_signOutEvent);
    on<CurrentUserEvent>(_currentUserEvent);
  }

  final AuthRepository _authRepository = AuthRepository();

  Future<FutureOr<void>> _signInEvent(
    SignInEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(Loading());
    try {
      await _authRepository.signWithEmailAndPassword(
        event.email,
        event.password,
      );

      await event.context.router.push(HomeRoute());
      emit(Authenticated());
    } catch (e) {
      emit(Error());
    }
  }

  Future<FutureOr<void>> _signUpEvent(
    SignUpEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(Loading());
    try {
      await _authRepository.createUserWithEmailAndPassword(
        event.email,
        event.password,
      );
      await event.context.router.push(const LoginRoute());
      emit(Authenticated());
    } catch (e) {
      emit(Error());
    }
  }

  Future<FutureOr<void>> _signOutEvent(
    SignOutEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      await _authRepository.signOut();
      await event.context.router.push(const LoginRoute());

      emit(UnAuthenticated());
    } catch (e) {
      emit(Error());
    }
  }

  Future<FutureOr<void>> _currentUserEvent(
    CurrentUserEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      final currentUser = await _authRepository.currentUser();
      if (currentUser.userId != null) {
        emit(Authenticated());
        return currentUser;
      } else {
        emit(UnAuthenticated());
      }
    } catch (e) {
      emit(Error());
    }
  }
}
