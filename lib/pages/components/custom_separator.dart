import 'package:flutter/material.dart';

class CustomSeparator extends StatelessWidget {
  const CustomSeparator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Theme.of(context).colorScheme.primary,
        height: 1,
      ),
    );
  }
}
