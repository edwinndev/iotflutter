import 'package:flutter/material.dart';

import 'package:iot/models/device.info.dart';
import 'package:iot/widgets/input.dart';
import 'package:iot/widgets/mqtt.dart';

Future<void> showDeviceConfig(BuildContext ctx, DeviceInfo device) async {
  return showDialog<void>(
    context: ctx,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        title: const Text('Configuracion del dispositivo'),
        content: _form(device),
        actions: [
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

Column _form(DeviceInfo device) {
  TextEditingController nameController  = TextEditingController(text: device.name);
  TextEditingController topicController = TextEditingController(text: device.topic);
  
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      InputText(
        controller: nameController,
        label: 'Nombre de dispositivo'
      ),
      const SizedBox(height: 10.0),
      InputText(
        controller: topicController,
        label: 'Topic'
      ),
      const SizedBox(height: 10.0),
      InputDropdown<int>(
        label: 'QoS',
        items: qosMenuItems(),
        onChanged: (value) {},
      )
    ],
  );
}
