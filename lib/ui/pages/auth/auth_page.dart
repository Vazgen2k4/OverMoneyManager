part of 'auth_page_pakeges.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    final _localization = S.of(context);

    return Scaffold(
      appBar: CustomAppBar(
        height: 72,
        leading: SvgPicture.asset(AppIcons.logo),
        title: Hero(
          tag: AppHeroTags.authTitle,
          child: Text(
            _localization.auth_title,
            style: _textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is! AuthLoaded) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return const AuthPageContent();
        },
      ),
    );
  }
}
