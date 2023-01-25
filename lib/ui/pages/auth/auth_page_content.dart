part of 'auth_page_pakeges.dart';


class AuthPageContent extends StatelessWidget {
  const AuthPageContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _localization = S.of(context);

    return LimitContainer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          const Hero(
            tag: AppHeroTags.authLogin,
            child: Material(child: AuthForm()),
          ),
          const SizedBox(height: 24),
          TextButton(
            onPressed: () {
              // FirebaseApi.getUsers();
            },
            onLongPress: () {
              context.read<AuthBloc>().add(const AuthLogOutEvent());
            },
            child: Text(
              _localization.google_button,
            ),
          ),
          const SizedBox(height: 72),
        ],
      ),
    );
  }
}
