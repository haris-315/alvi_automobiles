part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthLoaded extends AuthState {
  final User user;

  AuthLoaded({required this.user});
}

final class AuthError extends AuthState {
  final NetworkError error;

  AuthError({required this.error});
}
