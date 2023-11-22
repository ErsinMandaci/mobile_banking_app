part of 'auth_bloc.dart';

abstract final class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

final class SignInEvent extends AuthEvent {
  const SignInEvent(
      {required this.email, required this.password, required this.context,});
  final String email;
  final String password;
  final BuildContext context;
  @override
  List<Object> get props => [email, password, context];
}

final class SignUpEvent extends AuthEvent {
  const SignUpEvent({
    required this.email,
    required this.password,
    required this.context,
  });
  final String email;
  final String password;
  final BuildContext context;

  @override
  List<Object> get props => [email, password, context];
}

final class SignOutEvent extends AuthEvent {
  const SignOutEvent({required this.context});

  final BuildContext context;
}

final class CurrentUserEvent extends AuthEvent {
  const CurrentUserEvent();

  @override
  List<Object> get props => [];
}
