import 'package:flutter/material.dart';


class TextRow extends StatelessWidget {
  final String actionText;
  final String label;
  final void Function() onPressed;

  const TextRow({
    Key? key,
    required this.actionText,
    required this.label,
    required this.onPressed
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(label),
        TextButton(
          child: Text(actionText),
          onPressed: onPressed,
        )
      ],
    );
  }
}
