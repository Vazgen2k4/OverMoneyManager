import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:over_money_manager/app_const.dart';
import 'package:over_money_manager/generated/l10n.dart';
import 'package:over_money_manager/resources/resources.dart';
import 'package:over_money_manager/ui/router/app_hero_tags.dart';
import 'package:over_money_manager/ui/theme/app_colors.dart';
import 'package:over_money_manager/ui/widgets/confirm_form/confirm_form.dart';
import 'package:over_money_manager/ui/widgets/custom_appbar/custom_appbar.dart';
import 'package:over_money_manager/ui/widgets/limit_container/limit_container.dart';

class ConfirmPage extends StatelessWidget {
  const ConfirmPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _localization = S.of(context);
    final _textStyle = Theme.of(context).textTheme;
    const _borderRadiusBig = Radius.circular(AppConstants.borderRadiusBig);
    const _borderRadius = Radius.circular(AppConstants.borderRadius);

    return Scaffold(
      appBar: CustomAppBar(
        height: 72,
        leading: SvgPicture.asset(AppIcons.logo),
        title: Hero(
          tag: AppHeroTags.authTitle,
          child: Text(
            _localization.confirm_title,
            style: _textStyle.titleMedium,
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: LimitContainer(
        child: Center(
          child: Hero(
            tag: AppHeroTags.authLogin,
            child: Container(
              width: 320,
              padding: const EdgeInsets.fromLTRB(24, 12, 24, 22),
              decoration: const BoxDecoration(
                color: AppColors.akcent,
                borderRadius: BorderRadius.only(
                  topLeft: _borderRadiusBig,
                  topRight: _borderRadius,
                  bottomLeft: _borderRadius,
                  bottomRight: _borderRadiusBig,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    _localization.confirm_form_title,
                    style: _textStyle.titleSmall,
                  ),
                  const SizedBox(height: 16),
                  const ConfirmForm(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
