
import 'package:flutter/material.dart';
import 'package:tthakkr_app/core/constants/app_colors.dart';
import 'package:tthakkr_app/core/constants/app_spacing.dart';
import 'package:tthakkr_app/core/styles/text_style.dart';

class InfoCard extends StatelessWidget {
  final String label;
  final String value;
  final String? subLabel;
  final Widget? footer;

  const InfoCard({
    super.key,
    required this.label,
    required this.value,
    this.subLabel,
    this.footer,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(AppRadius.sm),
        border: Border.all(color: AppColors.borderDefault),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label.toUpperCase(), style: AppTextStyles.labelCaps),
          const SizedBox(height: 8),
          Text(value, style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: AppColors.textPrimary,
          )),
          if (subLabel != null) ...[
            const SizedBox(height: 2),
            Text(subLabel!, style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.textSecondary,
              fontSize: 11,
            )),
          ],
          if (footer != null) ...[
            const SizedBox(height: 10),
            footer!,
          ],
        ],
      ),
    );
  }
}