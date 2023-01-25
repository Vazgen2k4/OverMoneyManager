import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:over_money_manager/domain/api/firebase_api.dart';
import 'package:over_money_manager/domain/controllers/phone_controller.dart';
import 'package:over_money_manager/domain/models/over_user/over_user.dart';
import 'package:over_money_manager/app_const.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final auth = FirebaseAuth.instance;

  AuthBloc() : super(AuthInitial()) {
    on<AuthLoading>(_load);
    on<AuthWithPhone>(_authWithPhone);
    on<AuthVerefirePhone>(_authVerefirePhone);
    on<AuthLogOutEvent>((_, emit) => _logOut(emit));
  }

  Future<void> _load(
    AuthLoading event,
    Emitter<AuthState> emit,
  ) async {
    final hasAuth = FirebaseAuth.instance.currentUser != null;

    AppConstants.borderPrint(
      'Авторизация ${hasAuth ? 'Есть БраТишкА)))' : 'Её нетУ Брат'}',
    );
    emit(
      AuthLoaded(
        hasAuth: hasAuth,
        isLoginEvent: true,
      ),
    );
  }

  Future<void> _authWithPhone(
    AuthWithPhone event,
    Emitter<AuthState> emit,
  ) async {
    if (this.state is! AuthLoaded) return;
    final state = this.state as AuthLoaded;

    try {
      final haveProfile = await FirebaseApi.haveAccountWithPhone(event.phone);

      if (!haveProfile && event.isLogin) {
        event.onNeedRegister();
        return;
      }

      if (haveProfile && !event.isLogin) {
        event.onHaveProfileButRegistr();
        return;
      }

      await auth.verifyPhoneNumber(
        phoneNumber: event.phone,
        timeout: const Duration(minutes: 1),
        verificationCompleted: (credential) {
          emit(
            state.copyWith(
              autoCredential: credential,
              isLoginEvent: event.isLogin,
            ),
          );
          event.onSend();
        },
        verificationFailed: (e) {
          event.onFailed();
          AppConstants.borderPrint(e);
        },
        codeSent: (String verificationID, int? resendToken) {
          PhoneController.verificationId = verificationID;
          event.onSend();
        },
        codeAutoRetrievalTimeout: (String verificationID) {},
      );

      emit(state.copyWith(isLoginEvent: event.isLogin));
    } catch (e) {
      _logOut(emit);
    }
  }

  Future<void> _authVerefirePhone(
    AuthVerefirePhone event,
    Emitter<AuthState> emit,
  ) async {
    if (this.state is! AuthLoaded) return;
    final state = this.state as AuthLoaded;
    try {
      final credentialWithSms = PhoneAuthProvider.credential(
        smsCode: PhoneController.smsCode,
        verificationId: PhoneController.verificationId,
      );

      final credential = state.autoCredential ?? credentialWithSms;
      await auth.signInWithCredential(credential);

      if (!state.isLoginEvent) {
        final user = OverUser(
          name: PhoneController.nameController.value.text,
          phone: PhoneController.phoneNumber,
        );
        
        
        await FirebaseApi.setUser(user: user);
      }

      event.onVerefire();
    } catch (e) {
      event.onFailed();
      _logOut(emit);
    }
  }

  Future<void> _logOut(Emitter<AuthState> emit) async {
    if (state is! AuthLoaded) return;
    try {
      await auth.signOut();
      PhoneController.clear();
      
      const newState = AuthLoaded(
        hasAuth: false,
        isLoginEvent: true,
      );
      
      emit(newState);
    } catch (e) {
      if (kDebugMode) {
        print('Error [object] - log Out');
      }
    }
  }
}
