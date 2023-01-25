import 'package:flutter/material.dart';
import 'package:over_money_manager/generated/l10n.dart';
import 'package:over_money_manager/ui/theme/app_colors.dart';

abstract class AppSnakBars {
  static void showError({
    required BuildContext context,
    required String message,
  }) {
    final _snak = SnackBar(
      behavior: SnackBarBehavior.floating,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      backgroundColor: AppColors.error,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).exeption_title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 2),
          Text(
            message,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(_snak);
  }

  static void showCompleate(
    BuildContext context, {
    required String message,
    String? title,
  }) {
    final _snak = SnackBar(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      backgroundColor: AppColors.done,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Material(
            child: ListTile(
              leading: const Icon(
                Icons.done_outline_rounded,
                color: AppColors.text,
              ),
              title: Text(
                title ?? 'Done',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
          const SizedBox(height: 2),
          Text(
            message,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(_snak);
  }
}
