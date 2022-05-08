import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({Key? key, required this.onTap, required this.text})
      : super(key: key);
  final VoidCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onTap, child: Text(text));
  }
}
