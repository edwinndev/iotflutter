import 'package:get/get.dart';
import 'package:iot/models/device.info.dart';
import 'package:iot/models/device.type.dart';

class DeviceController extends GetxController {
  final List<DeviceInfo> _list = [
    DeviceInfo(id : 'one', name: 'One', topic: '#', type: DeviceType.thermostat),
    //DeviceInfo(id : 'home', name: 'Home', topic: '#'),
    //DeviceInfo(id : 'car', name: 'Car', topic: '#master'),
    //DeviceInfo(id : 'gauge', name: 'Gauge', topic: '#master', type: DeviceType.gauge),
  ];

  List<DeviceInfo> get list => _list;

  bool add(DeviceInfo device) {
    for(var d in _list) {
      if (d.name == device.name) return false;
    }
    _list.add(device);
    update();
    return true;
  }

  bool remove(DeviceInfo device) {
    bool removed = _list.remove(device);
    update();
    return removed;
  }
}
