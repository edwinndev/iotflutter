import 'package:iot/models/device.type.dart';
import 'package:iot/widgets/devices/device.dart';
import 'package:iot/widgets/devices/gauge.dart';
import 'package:iot/widgets/devices/lightbulb.dart';
import 'package:iot/widgets/devices/progress.dart';
import 'package:iot/widgets/devices/slider.dart';
import 'package:iot/widgets/devices/thermostat.dart';

class DeviceFactory {
  static final Map<DeviceType, Device> _devices = {
    DeviceType.gauge      : Gauge(),
    DeviceType.lightbulb  : LightbulbDevice(),
    DeviceType.progress   : ProgressDevice(),
    DeviceType.slider     : SliderDevice(),
    DeviceType.thermostat : ThermostatDevice(),
  };

  static Device get(DeviceType type) {
    return _devices[type] ?? Gauge();
  }

}
