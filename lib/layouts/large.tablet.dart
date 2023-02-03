import 'package:flutter/material.dart';
import 'package:iot/pages/ui.dart';

class LargeTabletLayout extends StatelessWidget {
  const LargeTabletLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: UiPage()
        ),
        Expanded(
          child: Container(
            color: Colors.deepOrange
          )
        ),
      ],
    );
  }
}