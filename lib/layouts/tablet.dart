import 'package:flutter/material.dart';
import 'package:iot/pages/ui.dart';

class TabletLayout extends StatelessWidget {
  const TabletLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: UiPage(),
        )
      ],
    );
  }
}