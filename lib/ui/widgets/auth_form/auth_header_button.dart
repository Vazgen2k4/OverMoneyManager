import 'package:flutter/material.dart';
import 'package:over_money_manager/ui/theme/app_colors.dart';
import 'package:over_money_manager/app_const.dart';

class AuthHeadButton extends StatelessWidget {
  final String title;
  final VoidCallback? action;
  final bool isLeft;
  final bool isActive;

  const AuthHeadButton({
    Key? key,
    required this.title,
    this.action,
    this.isLeft = true,
    this.isActive = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context).textTheme;

    final _style = _theme.titleSmall?.copyWith(
      color: isActive ? AppColors.disabledText : AppColors.text,
    );

    final _backgroudColor = isActive ? Colors.transparent : AppColors.elements;

    final _borderRadius = isActive
        ? BorderRadius.zero
        : BorderRadius.only(
            bottomRight: isLeft ? const Radius.circular(19) : Radius.zero,
            bottomLeft: !isLeft ? const Radius.circular(19) : Radius.zero,
          );

    return Expanded(
      child: AnimatedContainer(
        duration: AppConstants.defaultTransition,
        decoration: BoxDecoration(
          color: _backgroudColor,
          borderRadius: _borderRadius,
        ),
        child: ElevatedButton(
          onPressed: isActive ? null : action,
          style: ButtonStyle(
            elevation: const MaterialStatePropertyAll(0),
            backgroundColor: const MaterialStatePropertyAll(Colors.transparent),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomRight: isLeft ? const Radius.circular(19) : Radius.zero,
                  bottomLeft: !isLeft ? const Radius.circular(19) : Radius.zero,
                ),
              ),
            ),
          ),
          child: Text(
            title,
            style: _style,
          ),
        ),
      ),
    );
  }
}
