import 'package:flutter/material.dart';
import 'package:iot/models/device.info.dart';
import 'package:iot/utils/constants.dart';
import 'package:iot/widgets/devices/device.dart';

class ThermostatDevice implements Device {
  
  @override
  Widget create(DeviceInfo device) {
    return __s();
  } 
}

Widget __s() {
  const double width = 25.0;
  return Stack(
    children: [
      Container(
        width: width+5.0,
        color: Colors.indigo,
      ),
      Container(
        width: width,
        decoration: BoxDecoration(
          color: ColorUtil.dark,
          borderRadius: BorderRadius.circular(width/2)
        ),
      ),
      Positioned(
        bottom: 0.0,
        child: Container(
          width: width,
          height: 15.7,
          decoration: BoxDecoration(
            color: ColorUtil.red,
            borderRadius: BorderRadius.circular(width/2)
          )
        ),
      ),
    ],
  );
}