import 'package:flutter/material.dart';
import 'package:iot/models/alert.type.dart';
import 'package:iot/utils/constants.dart';

final Map<AlertType, Color> _backgrounds = {
  AlertType.success : ColorUtil.success,
  AlertType.warning : ColorUtil.orange,
  AlertType.error   : ColorUtil.red,
};

void showAlertMessage({
  required BuildContext context,
  required String message,
  AlertType type = AlertType.success,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: const TextStyle(
          color: ColorUtil.black,
          fontSize: 18.0
        ),
      ),
      duration: const Duration(seconds: 3),
      backgroundColor: _backgrounds[type],
      dismissDirection: DismissDirection.endToStart,
    )
  );
}

