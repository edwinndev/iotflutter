import 'package:flutter/material.dart';
import 'package:iot/layouts/desktop.dart';
import 'package:iot/layouts/large.tablet.dart';
import 'package:iot/layouts/phone.dart';
import 'package:iot/layouts/responsive.dart';
import 'package:iot/layouts/tablet.dart';
import 'package:iot/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 100.0),
        child: (ResponsiveLayout.isDesktop(context) ? Container(height: 0.0) : AppBar()),
      ),
      body: ResponsiveLayout(
        small: Container(),
        phone: const PhoneLayout(),
        tablet: const TabletLayout(),
        largeTablet: const LargeTabletLayout(),
        desktop: const ComputerLayout()
      ),
      drawer: ResponsiveLayout.isDesktop(context) ? null : const DrawerWidget(),
    );
  }
}