import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:over_money_manager/domain/logic/auth/auth_bloc.dart';
import 'package:over_money_manager/generated/l10n.dart';
import 'package:over_money_manager/ui/router/app_router.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:over_money_manager/ui/theme/app_colors.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc()..add(const AuthLoading()),
        )
      ],
      child: MaterialApp(
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: AppColors.background,
          useMaterial3: true,
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            shape: CircleBorder(),
          ),
          textTheme: const TextTheme(
            titleMedium: TextStyle(
              color: AppColors.text,
              fontSize: 20,
              height: 30 / 20,
              fontWeight: FontWeight.w700,
            ),
            titleSmall: TextStyle(
              fontSize: 17,
              color: AppColors.text,
              height: 20 / 17,
              fontWeight: FontWeight.w600,
            ),
            titleLarge: TextStyle(
              fontSize: 16,
              height: 20 / 14,
              fontWeight: FontWeight.w400,
              color: AppColors.text,
            ),
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ),
        initialRoute: AppRouter.initRoute,
        onGenerateRoute: AppRouter.generate,
      ),
    );
  }
}
