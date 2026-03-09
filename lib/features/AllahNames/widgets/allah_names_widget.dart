import 'package:flutter/material.dart';
import 'package:tthakkr_app/core/constants/app_colors.dart';

class AllahNamesWidget extends StatelessWidget {
  const AllahNamesWidget({
    super.key,
    required this.allahName,
    required this.nameTranslation,
  });
  final String allahName;
  final String nameTranslation;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.card,
        border: Border.all(color: AppColors.goldBorder, width: 2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        title: Text.rich(
          style: TextStyle(fontSize: 20),
          textDirection: .rtl,
          TextSpan(
            children: [
              TextSpan(text: '$allahName\n'),
              TextSpan(text: nameTranslation),
            ],
          ),
        ),
        //subtitle: Text(state.athkarList[index].reference),
      ),
    );
  }
}
