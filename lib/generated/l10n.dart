// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Over Money Manager`
  String get aplication_name {
    return Intl.message(
      'Over Money Manager',
      name: 'aplication_name',
      desc: '',
      args: [],
    );
  }

  /// `Authorization`
  String get auth_title {
    return Intl.message(
      'Authorization',
      name: 'auth_title',
      desc: '',
      args: [],
    );
  }

  /// `Log In`
  String get log_in {
    return Intl.message(
      'Log In',
      name: 'log_in',
      desc: '',
      args: [],
    );
  }

  /// `Registr`
  String get registr {
    return Intl.message(
      'Registr',
      name: 'registr',
      desc: '',
      args: [],
    );
  }

  /// `Сontinue`
  String get continue_txt {
    return Intl.message(
      'Сontinue',
      name: 'continue_txt',
      desc: '',
      args: [],
    );
  }

  /// `Сonfirm`
  String get confirm_txt {
    return Intl.message(
      'Сonfirm',
      name: 'confirm_txt',
      desc: '',
      args: [],
    );
  }

  /// `Name:`
  String get input_name {
    return Intl.message(
      'Name:',
      name: 'input_name',
      desc: '',
      args: [],
    );
  }

  /// `SMS sent`
  String get confirm_title {
    return Intl.message(
      'SMS sent',
      name: 'confirm_title',
      desc: '',
      args: [],
    );
  }

  /// `Verify phone number`
  String get confirm_form_title {
    return Intl.message(
      'Verify phone number',
      name: 'confirm_form_title',
      desc: '',
      args: [],
    );
  }

  /// `An error has occurred`
  String get exeption_title {
    return Intl.message(
      'An error has occurred',
      name: 'exeption_title',
      desc: '',
      args: [],
    );
  }

  /// `No account found with this phone number!!!`
  String get not_found_account {
    return Intl.message(
      'No account found with this phone number!!!',
      name: 'not_found_account',
      desc: '',
      args: [],
    );
  }

  /// `This account already exists`
  String get has_account_error {
    return Intl.message(
      'This account already exists',
      name: 'has_account_error',
      desc: '',
      args: [],
    );
  }

  /// `Log In with Googlululu`
  String get google_button {
    return Intl.message(
      'Log In with Googlululu',
      name: 'google_button',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
