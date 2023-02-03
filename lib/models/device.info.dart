import 'package:iot/models/device.type.dart';

class DeviceInfo {
  final String id;
  final String name;
  final String topic;
  final DeviceType type;
  final int qos;

  DeviceInfo({
    required this.id,
    required this.name,
    required this.topic,
    this.type = DeviceType.lightbulb,
    this.qos = 0,
  });
}