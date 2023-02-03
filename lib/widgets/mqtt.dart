import 'package:flutter/material.dart';
import 'package:iot/models/mqtt.util.dart';

List<DropdownMenuItem<int>> qosMenuItems() {
  List<MqttQos> qos = MqttQos.values;
  return List<DropdownMenuItem<int>>.generate(
    qos.length,
    (index) => DropdownMenuItem<int>(value: qos[index].qos, child: Text('${qos[index].qos}'))
  );
}