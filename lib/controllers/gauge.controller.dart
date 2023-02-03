import 'package:get/get.dart';

class GaugeController extends GetxController {
  late double _value = 0.4;

  double get value => _value;

  void change(double newValue, String id) {
    _value = newValue;
    update([id]);
  }
}