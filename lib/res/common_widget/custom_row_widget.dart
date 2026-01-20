import 'package:flutter/material.dart';

class CustomRowWidget extends StatelessWidget {
  final String title;
  final String value;
  final TextStyle? style;
  CustomRowWidget({
    super.key,
    required this.title,
    required this.value,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: style,
        ),

        Text(
          value,
          style: style,
        )
      ],
    );
  }
}
