import 'package:flutter/material.dart';

class AppNameWidget extends StatelessWidget {
  final Color? greenTitleColor;
  final double textSize;
  const AppNameWidget({super.key, this.greenTitleColor, this.textSize = 30});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      textAlign: TextAlign.center,
      TextSpan(
        style: TextStyle(fontSize: textSize),
        children: [
          TextSpan(
            text: 'Loja ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: greenTitleColor ?? Colors.green,
            ),
          ),
          TextSpan(
            text: 'App',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
          ),
        ],
      ),
    );
  }
}
