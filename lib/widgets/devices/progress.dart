import 'package:flutter/material.dart';
import 'package:iot/models/device.info.dart';
import 'package:iot/utils/constants.dart';
import 'package:iot/widgets/devices/device.dart';

class ProgressDevice implements Device {
  
  @override
  Widget create(DeviceInfo device) {
    return const CircularProgressIndicator(
      value: 10.0,
      semanticsLabel: 'SL',
      semanticsValue: 'SV',
      color: ColorUtil.orange,
      strokeWidth: 8.0,
    );
  }
  
}