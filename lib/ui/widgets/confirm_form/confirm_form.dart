
import 'package:flutter/material.dart';
import 'package:over_money_manager/domain/controllers/phone_controller.dart';
import 'package:over_money_manager/ui/theme/app_colors.dart';
import 'package:over_money_manager/ui/widgets/confirm_form/confirm_input.dart';

class ConfirmForm extends StatelessWidget {
  const ConfirmForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formRadiusParameters = <ConfirmInputData>[
      const ConfirmInputData(bottomLeft: 19),
      const ConfirmInputData(),
      const ConfirmInputData(topRight: 19),
      const ConfirmInputData(topLeft: 19),
      const ConfirmInputData(),
      const ConfirmInputData(bottomRight: 19),
    ];

    final inputs = formRadiusParameters.map<BorderRadius>((inputData) {
      return BorderRadius.only(
        bottomLeft: Radius.circular(inputData.bottomLeft),
        bottomRight: Radius.circular(inputData.bottomRight),
        topLeft: Radius.circular(inputData.topLeft),
        topRight: Radius.circular(inputData.topRight),
      );
    }).toList();

    return Material(
      color: Colors.transparent,
      child: Form(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List<Widget>.generate(inputs.length, (index) {
            return ConfirmFormInput(
              controller: PhoneController.codeControllers[index],
              radius: inputs[index],
              isFirst: index == 0,
              isLast: index == inputs.length - 1,
            );
          })
            ..insert(
              3,
              Container(
                width: 4,
                height: 7,
                color: AppColors.text,
                margin: const EdgeInsets.all(5.0),
              ),
            ),
        ),
      ),
    );
  }
}
