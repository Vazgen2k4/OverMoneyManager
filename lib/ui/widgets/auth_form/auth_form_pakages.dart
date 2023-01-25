import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:over_money_manager/domain/logic/auth/auth_bloc.dart';
import 'package:over_money_manager/domain/controllers/phone_controller.dart';
import 'package:over_money_manager/generated/l10n.dart';
import 'package:over_money_manager/resources/resources.dart';
import 'package:over_money_manager/ui/router/app_routes.dart';
import 'package:over_money_manager/ui/widgets/phone_input_widget/phone_input_widget.dart';
import 'package:over_money_manager/ui/theme/app_colors.dart';
import 'package:over_money_manager/app_const.dart';
import 'package:over_money_manager/ui/widgets/app_snak_bars/app_snak_bars.dart';
import 'package:over_money_manager/ui/templates/form_button_template_ui.dart';
import 'package:over_money_manager/ui/widgets/auth_form/auth_form_head.dart';
import 'package:over_money_manager/ui/widgets/auth_form/auth_name_input_widget.dart';
import 'package:provider/provider.dart';

part 'auth_form.dart';
part 'auth_form_content.dart';