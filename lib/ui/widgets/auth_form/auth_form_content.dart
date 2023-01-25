part of 'auth_form_pakages.dart';


class AuthFormContent extends StatelessWidget {
  final bool isLoginState;
  final VoidCallback toSwitchState;
  final FormState? formState;
  const AuthFormContent({
    Key? key,
    required this.isLoginState,
    required this.toSwitchState,
    required this.formState,
  }) : super(key: key);

  void onAuth(BuildContext context, FormState? formState) {
    if (formState == null || !formState.validate()) return;
    final phoneNumber = PhoneController.phoneNumber;

    if (phoneNumber.length != AppConstants.phoneLength) return;
    final authModel = context.read<AuthBloc>();
    final _localization = S.of(context);

    authModel.add(
      AuthWithPhone(
        isLogin: isLoginState,
        phone: phoneNumber,
        onFailed: () {},
        onSend: () => Navigator.pushNamed(context, AppRoutes.confirm),
        onHaveProfileButRegistr: () {
          AppSnakBars.showError(
            message: _localization.has_account_error,
            context: context,
          );
        },
        onNeedRegister: () {
          AppSnakBars.showError(
            message: _localization.not_found_account,
            context: context,
          );
        },
      ),
    );
  }

  Widget _authButton(BuildContext context) {
    final _localization = S.of(context);
    final _buttonTitle =
        isLoginState ? _localization.continue_txt : _localization.confirm_txt;

    return Center(
      child: FormButtonTemplateUI(
        maxWidth: 161,
        onTap: () => onAuth(context, formState),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
          bottomRight: Radius.circular(19),
          bottomLeft: Radius.circular(21),
        ),
        children: [
          Text(
            _buttonTitle,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(width: 2),
          SvgPicture.asset(AppIcons.cursorClick, color: AppColors.text)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const phoneInputBorder = OutlineInputBorder(
      gapPadding: 6,
      borderSide: BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(7),
        topRight: Radius.circular(10),
        bottomRight: Radius.circular(19),
        bottomLeft: Radius.circular(7),
      ),
    );

    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      controller: ScrollController(),
      children: <Widget>[
        AuthFormHead(
          isLogin: isLoginState,
          onSwitch: toSwitchState,
        ),
        const SizedBox(height: 22),
        PhoneInputWidget(
          inputBorder: phoneInputBorder,
          controler: PhoneController.phoneController,
        ),
        const SizedBox(height: 10),
        if (!isLoginState) ...[
          const AuthNameInputWidget(inputBorder: phoneInputBorder),
          const SizedBox(height: 10),
        ],
        _authButton(context),
      ],
    );
  }
}
