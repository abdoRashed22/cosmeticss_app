import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({super.key, this.text = ''});
  final String text;
  @override
  Widget build(BuildContext context) {
    return FilledButton(child: Text(text), onPressed: () {});
  }
}
