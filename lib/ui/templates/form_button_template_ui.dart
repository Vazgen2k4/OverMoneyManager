import 'package:flutter/material.dart';
import 'package:over_money_manager/ui/theme/app_colors.dart';

class FormButtonTemplateUI extends StatelessWidget {
  final VoidCallback? onTap;
  final List<Widget> children;
  final BorderRadiusGeometry borderRadius;
  final double maxWidth;

  const FormButtonTemplateUI({
    Key? key,
    this.onTap,
    this.children = const <Widget>[],
    this.borderRadius = BorderRadius.zero,
    this.maxWidth = double.infinity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 34,
      child: ElevatedButton(
        onPressed: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: children,
        ),
        style: ButtonStyle(
          maximumSize: MaterialStatePropertyAll(Size.fromWidth(maxWidth)),
          padding: const MaterialStatePropertyAll(
            EdgeInsets.symmetric(
              vertical: 0,
              horizontal: 8,
            ),
          ),
          backgroundColor: const MaterialStatePropertyAll(AppColors.elements),
          elevation: const MaterialStatePropertyAll(0),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: borderRadius,
            ),
          ),
        ),
      ),
    );
  }
}
