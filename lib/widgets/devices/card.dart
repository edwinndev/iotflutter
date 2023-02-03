import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:iot/controllers/device.controller.dart';
import 'package:iot/models/alert.type.dart';
import 'package:iot/models/device.info.dart';
import 'package:iot/utils/constants.dart';
import 'package:iot/widgets/modals/alert.dart';
import 'package:iot/widgets/devices/device.dart';
import 'package:iot/widgets/modals/dialog.device.dart';

class DeviceCard extends StatelessWidget {
  final DeviceInfo device;
  final Device child;

  const DeviceCard({
    super.key,
    required this.device,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(device.name),
              PopupMenuButton(
                tooltip: '',
                surfaceTintColor: Colors.transparent,
                padding: EdgeInsets.zero,
                position: PopupMenuPosition.over,
                icon: const Icon(Icons.settings),
                onSelected: (value) {
                  if(value == 'EDITAR') {
                    showDeviceConfig(context, device);
                  } else {
                    DeviceController deviceController = Get.find<DeviceController>(tag: 'device');
                    final bool deleted = deviceController.remove(device);
                    if (deleted) {
                      showAlertMessage(
                        context: context,
                        message: 'Despositivo ${device.name} eliminado',
                        type: AlertType.success
                      );
                    } else {
                      showAlertMessage(
                        context: context,
                        message: 'Error al eliminar el dispositivo',
                        type: AlertType.error
                      );
                    }
                  }
                },
                itemBuilder: (context) {
                  return <String>['EDITAR', 'ELIMINAR'].map((choice) {
                    return  PopupMenuItem<String>(
                      value: choice,
                      height: 35.0,
                      textStyle: const TextStyle(
                        fontSize: 13.0,
                        color: ColorUtil.dark
                      ),
                      child: Text(
                        choice,
                      )
                    );
                  }).toList();
                },
              ),
            ],
          ),
          Expanded(
            child: child.create(device),
          ),
          FittedBox(
            child: Text(device.topic),
          )
        ],
      ),
    );
  }
}