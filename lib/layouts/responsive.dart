import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget small;
  final Widget phone;
  final Widget tablet;
  final Widget largeTablet;
  final Widget desktop;

  const ResponsiveLayout({
    super.key, 
    required this.small,
    required this.phone,
    required this.tablet,
    required this.largeTablet,
    required this.desktop
  });

  static const double smallLimit = 250.0;
  static const double phoneLimit = 512.0;
  static const double tabletLimit = 920.0;
  static const double largeTabletLimit = 1400.0;

  static bool isSmall(BuildContext context)       => width(context) <= smallLimit;
  static bool isPhone(BuildContext context)       => width(context) > smallLimit && width(context) <= phoneLimit;
  static bool isTablet(BuildContext context)      => width(context) > phoneLimit && width(context) <= tabletLimit;
  static bool isLargeTablet(BuildContext context) => width(context) > tabletLimit && width(context) <= largeTabletLimit;
  static bool isDesktop(BuildContext context)     => width(context) > largeTabletLimit;

  static double width(BuildContext context) => MediaQuery.of(context).size.width;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth <= smallLimit)       return small;
        if (constraints.maxWidth <= phoneLimit)       return phone;
        if (constraints.maxWidth <= tabletLimit)      return tablet;
        if (constraints.maxWidth <= largeTabletLimit) return largeTablet;
        return desktop;
      },
    );
  }
}