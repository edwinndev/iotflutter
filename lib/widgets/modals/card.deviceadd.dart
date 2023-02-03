import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:iot/controllers/device.controller.dart';
import 'package:iot/models/alert.type.dart';
import 'package:iot/models/device.info.dart';
import 'package:iot/models/device.type.dart';
import 'package:iot/widgets/modals/alert.dart';
import 'package:iot/widgets/input.dart';
import 'package:iot/widgets/mqtt.dart';

final TextEditingController _nameController = TextEditingController();
final TextEditingController _topicController = TextEditingController();
int _qos = 0;
DeviceType _type = DeviceType.gauge;


Future<void> showAddNewDeviceForm(BuildContext ctx) async {
  return showDialog(
    context: ctx,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        title: const Text('Agregar nuevo dispositivo'),
        content: _form(),
        actions: [
          TextButton(
            child: const Text('CANCELAR'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('AGREGAR'),
            onPressed: () {
              DeviceController controller = Get.find<DeviceController>(tag: 'device');
              final bool inserted = controller.add(
                DeviceInfo(
                  id    : _nameController.text.trim(),
                  name  : _nameController.text,
                  topic : _topicController.text,
                  qos   : _qos,
                  type  : _type
                )
              );
              if(inserted) {
                Navigator.of(context).pop();
                showAlertMessage(
                  context: context,
                  message: 'Dispositivo registrado'
                );
                _clear();
              } else {
                showAlertMessage(
                  context: context,
                  message: 'El dispositivo ya existe',
                  type: AlertType.warning
                );
              }
            }
          ),
        ],
      );
    }
  );
}

Column _form() {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      InputText(
        controller: _nameController,
        label: 'Nombre de dispositivo'
      ),
      const SizedBox(height: 10.0),
      InputText(
        controller: _topicController,
        label: 'Topic'
      ),
      const SizedBox(height: 10.0),
      InputDropdown<int>(
        label: 'QoS',
        items: qosMenuItems(),
        onChanged: (value) {
          _qos = value ?? 2;
        },
      ),
      const SizedBox(height: 10.0),
      InputDropdown<DeviceType>(
        label: 'Tipo',
        items: _devicesMenu(),
        onChanged: (type) {
          _type = type ?? DeviceType.gauge;
        },
      )
    ],
  );
}

List<DropdownMenuItem<DeviceType>> _devicesMenu() {
  List<DeviceType> deviceTypes = DeviceType.values;
  return List.generate(
    deviceTypes.length,
    (index) => DropdownMenuItem(value: deviceTypes[index], child: Text(deviceTypes[index].name.toUpperCase())),
  );
}

void _clear() {
  _nameController.clear();
  _topicController.clear();
  _qos = 0;
  _type = DeviceType.lightbulb;
}
