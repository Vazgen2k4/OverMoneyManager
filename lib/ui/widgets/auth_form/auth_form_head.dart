import 'package:flutter/material.dart';
import 'package:over_money_manager/generated/l10n.dart';
import 'package:over_money_manager/ui/widgets/auth_form/auth_header_button.dart';

class AuthFormHead extends StatelessWidget {
  final bool isLogin;
  final VoidCallback onSwitch;
  const AuthFormHead({
    Key? key,
    required this.isLogin,
    required this.onSwitch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AuthHeadButton(
            isActive: isLogin,
            action: onSwitch,
            title: S.of(context).log_in,
          ),
          AuthHeadButton(
            isActive: !isLogin,
            isLeft: false,
            action: onSwitch,
            title: S.of(context).registr,
          ),
        ],
      ),
    );
  }
}
