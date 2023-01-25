part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class AuthLoading extends AuthEvent {
  const AuthLoading();
  @override
  List<Object> get props => [];
}

class AuthLogOutEvent extends AuthEvent {
  const AuthLogOutEvent();
  @override
  List<Object> get props => [];
}

class AuthWithPhone extends AuthEvent {
  final String phone;
  final bool isLogin;

  final VoidCallback onSend;
  final VoidCallback onFailed;
  final VoidCallback onNeedRegister;
  final VoidCallback onHaveProfileButRegistr;

  const AuthWithPhone({
    required this.isLogin,
    required this.phone,
    required this.onSend,
    required this.onFailed,
    required this.onNeedRegister,
    required this.onHaveProfileButRegistr,
  });

  @override
  List<Object?> get props {
    return [
      isLogin,
      phone,
      onSend,
      onFailed,
      onNeedRegister,
      onHaveProfileButRegistr,
    ];
  }
}

class AuthVerefirePhone extends AuthEvent {
  final String code;
  final bool isRegistr;
  final VoidCallback onVerefire;
  final VoidCallback onFailed;
  const AuthVerefirePhone({
    this.isRegistr = false,
    required this.code,
    required this.onVerefire,
    required this.onFailed,
  });

  @override
  List<Object> get props {
    return [
      code,
      onVerefire,
      onFailed,
      isRegistr,
    ];
  }
}

class AuthRegister extends AuthEvent {
  final String phone;
  final String name;
  final VoidCallback onVerefire;
  final VoidCallback onFailed;
  const AuthRegister({
    required this.phone,
    required this.name,
    required this.onVerefire,
    required this.onFailed,
  });

  @override
  List<Object> get props {
    return [
      name,
      phone,
      onVerefire,
      onFailed,
    ];
  }
}
