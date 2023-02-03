import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:iot/controllers/device.controller.dart';
import 'package:iot/models/device.info.dart';
import 'package:iot/layouts/responsive.dart';
import 'package:iot/utils/constants.dart';
import 'package:iot/widgets/modals/card.deviceadd.dart';
import 'package:iot/widgets/devices/device.factory.dart';
import 'package:iot/widgets/devices/card.dart';

class UiPage extends StatelessWidget {
  UiPage({super.key});

  final DeviceController _controller = Get.put(DeviceController(), tag: 'device');

  @override
  Widget build(BuildContext context) {
    double spacer = ResponsiveLayout.isDesktop(context) ? 30.0 : 10.0;
    return Scaffold(
      backgroundColor: Colors.indigo.shade50,
      body: Container(
        //color: Colors.indigo.shade50,
        margin: const EdgeInsets.only(top: 18, left: 24, right: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _header(context),
            _banner(),
            GetBuilder<DeviceController>(
              init: _controller,
              builder:(_) => _deviceList(context, spacer, _.list)
            )
          ],
        ),
      ),
    );
  }
}

Row _header(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      const Text(
        'Jicem Technology',
        style: TextStyle(
          fontSize: 18,
          color: ColorUtil.indigo,
          fontWeight: FontWeight.w400,
        ),
      ),
      IconButton(
        icon: const Icon(
          Icons.add,
          color: ColorUtil.indigo,
          size: 28,
        ),
        onPressed: (){
          showAddNewDeviceForm(context);
        }
      )
    ],
  );
}

Column _banner() {
  return Column(
    children: const [
      SizedBox(height: 30.0),
      Center(
        child: CircleAvatar()
      ),
      SizedBox(height: 15.0),
      Text(
        'Smart Home',
        style: TextStyle(
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(height: 15.0),
    ],
  );
}

Expanded _deviceList(BuildContext context, double spacer, List<DeviceInfo> devices) {
  return Expanded(
    child: GridView.builder(
      padding: const EdgeInsets.only(bottom: 15.0),
      itemCount: devices.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: ResponsiveLayout.isDesktop(context) ? 3 : 2,
        crossAxisSpacing: spacer,
        mainAxisSpacing: spacer,
        mainAxisExtent: 200.0
      ),
      itemBuilder: (context, index) {
        final DeviceInfo deviceInfo = devices[index];
        return DeviceCard(
          device: deviceInfo,
          child: DeviceFactory.get(deviceInfo.type),
        );
      }
    ),
  );
}