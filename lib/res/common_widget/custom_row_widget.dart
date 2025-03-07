// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:discount_me_app/res/app_const/import_list.dart';

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
