import 'package:equatable/equatable.dart';

abstract final class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class Loading extends AuthState {}

final class Authenticated extends AuthState {}

final class UnAuthenticated extends AuthState {}

final class Error extends AuthState {}
