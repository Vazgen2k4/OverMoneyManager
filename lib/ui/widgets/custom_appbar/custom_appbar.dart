import 'package:flutter/material.dart';
import 'package:over_money_manager/ui/widgets/limit_container/limit_container.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double maxWidth;
  final double height;
  final Widget? title;
  final Widget? leading;
  final Widget? actions;

  const CustomAppBar({
    Key? key,
    this.height = kToolbarHeight,
    this.maxWidth = 1200,
    this.title,
    this.leading,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LimitContainer(
        maxWidth: maxWidth,
        child: Row(
          children: <Widget>[
            Expanded(
              child: leading ?? const SizedBox(),
            ),
            Expanded(
              flex: 3,
              child: title ?? const SizedBox(),
            ),
            Expanded(
              child: actions ?? const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
