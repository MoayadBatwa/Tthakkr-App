import 'package:flutter/material.dart';

class ReloadButtonWidget extends StatelessWidget {
  const ReloadButtonWidget({super.key, required this.function});
  final Function() function;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: OutlinedButton.icon(
        onPressed: function,
        label: Text('Try again'),
        icon: Icon(Icons.refresh),
      ),
    );
  }
}
