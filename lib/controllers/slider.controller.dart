import 'package:get/get.dart';

class SliderController extends GetxController {
  double _value = 0.0;

  double get value => _value;

  void change(double newValue, String id) {
    _value = newValue;
    update([id]);
  }
  
}