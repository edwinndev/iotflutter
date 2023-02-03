import 'package:flutter/material.dart';
import 'package:iot/models/device.info.dart';

abstract class Device {
  Widget create(DeviceInfo device);
}