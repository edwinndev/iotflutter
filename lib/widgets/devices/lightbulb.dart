import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:iot/controllers/device.card.controller.dart';
import 'package:iot/models/device.info.dart';
import 'package:iot/utils/constants.dart';
import 'package:iot/widgets/devices/device.dart';

class LightbulbDevice implements Device {
  
  @override
  Widget create(DeviceInfo device) {
    return GetBuilder<DeviceCardController>(
      id: device.id,
      init: DeviceCardController(),
      builder: (_) => Column(
        children: [
          Icon(
            Icons.lightbulb,
            size: 70.0,
            color: _.status ? ColorUtil.orange : ColorUtil.grey,
          ),
          Switch(
            value: _.status,
            onChanged: (newValue) {
              _.enable(newValue, device.id);
            }
          )
        ],
      ),
    );
  }
  
}