import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:over_money_manager/domain/controllers/phone_controller.dart';
import 'package:over_money_manager/generated/l10n.dart';
import 'package:over_money_manager/ui/theme/app_colors.dart';
import 'package:over_money_manager/ui/templates/form_button_template_ui.dart';

class AuthNameInputWidget extends StatelessWidget {
  final OutlineInputBorder inputBorder;
  const AuthNameInputWidget({
    Key? key,
    required this.inputBorder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _localization = S.of(context);
    final _theme = Theme.of(context);
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FormButtonTemplateUI(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(7),
            bottomRight: Radius.circular(7),
            bottomLeft: Radius.circular(19),
          ),
          children: [
            Text(
              _localization.input_name,
              style: _theme.textTheme.titleLarge,
            ),
          ],
        ),
        const SizedBox(width: 10),
        TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Это поле обязательно!!!';
            }

            if (value.length < 3) {
              return 'Меньше 3х букв, серьезно?';
            }

            if (value.replaceAll(RegExp(r'\D'), '').isNotEmpty) {
              return 'Йоу, без цифр)';
            }
            return null;
          },
          controller: PhoneController.nameController,
          cursorColor: AppColors.text,
          cursorWidth: 1,
          style: _theme.textTheme.titleLarge,
          keyboardType: TextInputType.name,
          inputFormatters: <TextInputFormatter>[
            LengthLimitingTextInputFormatter(19),
          ],
          decoration: InputDecoration(
            errorMaxLines: 2,
            errorStyle: const TextStyle(
              fontSize: 10,
              color: AppColors.text,
            ),
            hintText: _localization.input_name,
            isDense: true,
            constraints: const BoxConstraints(maxWidth: 150),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 6,
              horizontal: 12,
            ),
            prefixIconConstraints: const BoxConstraints(
              maxHeight: 15,
              minWidth: 30,
            ),
            prefixIcon: const Icon(
              Icons.account_circle_rounded,
              color: AppColors.text,
              size: 16,
            ),
            hintMaxLines: 1,
            filled: true,
            fillColor: AppColors.elements,
            border: inputBorder,
            errorBorder: inputBorder,
            enabledBorder: inputBorder,
            focusedErrorBorder: inputBorder,
            disabledBorder: inputBorder,
            focusedBorder: inputBorder.copyWith(
              borderSide: const BorderSide(color: AppColors.text),
            ),
          ),
        ),
      ],
    );
  }
}
