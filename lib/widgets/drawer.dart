import 'package:flutter/material.dart';
import 'package:iot/layouts/responsive.dart';
import 'package:iot/utils/constants.dart';
import 'package:iot/utils/routes.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  final List<ButtonNavigation> _options = [
    ButtonNavigation(label: Routes.home,          icon: Icons.home),
    ButtonNavigation(label: Routes.devices,       icon: Icons.devices),
    ButtonNavigation(label: Routes.topics,        icon: Icons.topic),
    ButtonNavigation(label: Routes.subscriptions, icon: Icons.subscript),
    ButtonNavigation(label: Routes.users,         icon: Icons.person),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          width: 200.0,
          child: Column(
            children: [
              ListTile(
                leading: const Text('Dashboard'),
                trailing: ResponsiveLayout.isDesktop(context) ? null : IconButton(
                  icon: const Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                  onPressed: () => Navigator.pop(context),
                )
              ),
              const SizedBox(height: 10.0),
              ...List.generate(
                _options.length, (index) => Column(
                  children: [
                    Container(
                      decoration: index == _currentIndex ? BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        color: ColorUtil.muted,
                      ) : null,
                      child: ListTile(
                        title: Text(_options[index].label.toUpperCase()),
                        leading: Icon(_options[index].icon),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)
                        ),
                        onTap: () {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 10.0)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ButtonNavigation {
  String label;
  IconData icon;

  ButtonNavigation({
    required this.label,
    required this.icon
  });
}