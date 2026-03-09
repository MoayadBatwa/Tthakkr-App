import 'package:flutter/material.dart';
import 'package:tthakkr_app/core/constants/app_colors.dart';

class LocationErrorWidget extends StatelessWidget {
  final String? error;
  final Function? callback;

  const LocationErrorWidget({super.key, this.error, this.callback});

  @override
  Widget build(BuildContext context) {
    final errorColor = AppColors.gold;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 32,
        children: [
          Icon(Icons.location_off, size: 150, color: errorColor),
          Text(
            error!,
            style: TextStyle(color: errorColor, fontWeight: FontWeight.bold),
          ),
          ElevatedButton(onPressed: callback!(), child: Text("Retry")),
        ],
      ),
    );
  }
}
