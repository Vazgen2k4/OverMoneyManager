import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:over_money_manager/domain/controllers/phone_controller.dart';
import 'package:over_money_manager/ui/theme/app_colors.dart';
import 'package:over_money_manager/ui/templates/form_button_template_ui.dart';

class PhoneInputWidget extends StatefulWidget {
  final TextEditingController controler;

  const PhoneInputWidget({
    Key? key,
    required this.inputBorder,
    required this.controler,
  }) : super(key: key);

  final OutlineInputBorder inputBorder;

  @override
  State<PhoneInputWidget> createState() => _PhoneInputWidgetState();
}

class _PhoneInputWidgetState extends State<PhoneInputWidget> {
  String codeStr = '';

  @override
  void initState() {
    const _code = '420';
    const _lang = 'CZ';

    PhoneController.countryCode = _code;

    codeStr = '+$_code $_lang';

    super.initState();
  }

  void pickCountry() {
    showCountryPicker(
      exclude: ['ru', 'en'],
      context: context,
      showPhoneCode: true,
      onSelect: (Country country) {
        final _code = country.phoneCode;
        final _lang = country.countryCode;
        PhoneController.countryCode = _code;
        codeStr = '+$_code ${_lang.toUpperCase()}';
        setState(() {});
      },
      countryListTheme: CountryListThemeData(
        borderRadius: BorderRadius.circular(19),
        backgroundColor: AppColors.background,
        bottomSheetHeight: 450,
        inputDecoration: const InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 8,
          ),
          border: OutlineInputBorder(
            gapPadding: 6,
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FormButtonTemplateUI(
          onTap: pickCountry,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(7),
            bottomRight: Radius.circular(7),
            bottomLeft: Radius.circular(19),
          ),
          children: [
            const Icon(
              Icons.keyboard_arrow_down,
              color: AppColors.text,
              size: 20,
            ),
            Text(
              codeStr,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
        const SizedBox(width: 10),
        TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'У тебя есть номер?';
            }

            if (value.length != 11) {
              return 'Заполни нормально..';
            }
            return null;
          },
          controller: widget.controler,
          cursorColor: AppColors.text,
          cursorWidth: 1,
          textAlign: TextAlign.left,
          style: Theme.of(context).textTheme.titleLarge,
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(11),
            MaskTextInputFormatter(mask: '### ### ###'),
          ],
          decoration: InputDecoration(
            errorMaxLines: 2,
            errorStyle: const TextStyle(
              fontSize: 10,
              color: AppColors.text,
            ),
            hintText: '999 999 999',
            isDense: true,
            constraints: const BoxConstraints(maxWidth: 119),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 6,
              horizontal: 12,
            ),
            hintMaxLines: 1,
            filled: true,
            fillColor: AppColors.elements,
            border: widget.inputBorder,
            enabledBorder: widget.inputBorder,
            focusedErrorBorder: widget.inputBorder,
            disabledBorder: widget.inputBorder,
            errorBorder: widget.inputBorder,
            focusedBorder: widget.inputBorder.copyWith(
              borderSide: const BorderSide(color: AppColors.text),
            ),
          ),
        ),
      ],
    );
  }
}
