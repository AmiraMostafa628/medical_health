import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text( text,
      style: Theme.of(context).textTheme.displaySmall!.copyWith(
          fontWeight: FontWeight.w200
      ),
    );
  }
}
