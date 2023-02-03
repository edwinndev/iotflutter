import 'package:flutter/material.dart';
import 'package:iot/pages/ui.dart';
import 'package:iot/widgets/drawer.dart';

class ComputerLayout extends StatelessWidget {
  const ComputerLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const DrawerWidget(),
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