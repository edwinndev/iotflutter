import 'package:get/get.dart';

class DeviceCardController extends GetxController {
  late bool _status = false;

  bool get status => _status;

  void enable(bool status, String id) {
    _status = status;
    update([id]);
  }

}