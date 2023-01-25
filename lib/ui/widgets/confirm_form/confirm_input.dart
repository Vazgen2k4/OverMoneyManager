import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:over_money_manager/domain/logic/auth/auth_bloc.dart';
import 'package:over_money_manager/domain/controllers/phone_controller.dart';
import 'package:over_money_manager/ui/router/app_routes.dart';
import 'package:over_money_manager/ui/theme/app_colors.dart';
import 'package:provider/provider.dart';

part 'confirm_input_data.dart';

class ConfirmFormInput extends StatelessWidget {
  final BorderRadius radius;
  final TextEditingController controller;
  final bool isLast;
  final bool isFirst;

  const ConfirmFormInput({
    Key? key,
    required this.radius,
    required this.controller,
    this.isLast = false,
    this.isFirst = false,
  }) : super(key: key);

  void onChange(BuildContext context, String value) {
    if (value.isEmpty && !isFirst) {
      FocusScope.of(context).previousFocus();
      return;
    }

    if (!isLast) {
      FocusScope.of(context).nextFocus();
      return;
    }

    FocusScope.of(context).unfocus();

    if (PhoneController.smsCode.length == 6) {
      final authModel = context.read<AuthBloc>();
      authModel.add(
        AuthVerefirePhone(
          code: PhoneController.smsCode,
          onVerefire: () {
            Navigator.of(context)
                .pushNamedAndRemoveUntil(AppRoutes.home, (route) => false);
          },
          onFailed: () {},
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleLarge,
        onChanged: (value) => onChange(context, value),
        showCursor: false,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        decoration: InputDecoration(
          hintText: '0',
          contentPadding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 11,
          ),
          constraints: const BoxConstraints.expand(
            width: 33,
            height: 45,
          ),
          filled: true,
          fillColor: AppColors.elements,
          border: OutlineInputBorder(
            gapPadding: 0,
            borderRadius: radius,
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            gapPadding: 0,
            borderRadius: radius,
            borderSide: const BorderSide(color: AppColors.text, width: 3),
          ),
        ),
      ),
    );
  }
}
