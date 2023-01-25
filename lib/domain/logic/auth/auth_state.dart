part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoaded extends AuthState {
  // final OverUser curentUser;
  final bool hasAuth;
  final bool isLoginEvent;
  final PhoneAuthCredential? autoCredential;

  const AuthLoaded({
    required this.hasAuth,
    required this.isLoginEvent,
    this.autoCredential,
    // required this.curentUser,
  });

  @override
  List<Object?> get props => [isLoginEvent, hasAuth, autoCredential];

  AuthLoaded copyWith({
    bool? hasAuth,
    bool? isLoginEvent,
    PhoneAuthCredential? autoCredential,
    // OverUser? curentUser,
    PhoneController? phoneController,
  }) {
    return AuthLoaded(
      hasAuth: hasAuth ?? this.hasAuth,
      autoCredential: autoCredential ?? this.autoCredential,
      // curentUser: curentUser ?? this.curentUser,
      isLoginEvent: isLoginEvent ?? this.isLoginEvent,
    );
  }
}
