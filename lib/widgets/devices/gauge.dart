import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:iot/controllers/gauge.controller.dart';
import 'package:iot/models/device.info.dart';
import 'package:iot/utils/constants.dart';
import 'package:iot/widgets/devices/device.dart';

class Gauge implements Device {
  
  @override
  Widget create(DeviceInfo device) {
    return GetBuilder<GaugeController>(
      id: device.id,
      init: GaugeController(),
      builder: (_) => CustomPaint(
        painter: _CustomGauge(
          value: _.value
        ),
        child: Center(
          child: Text(
            '${_.value} °C',
            style: const TextStyle(fontSize: 22.0, color: ColorUtil.dark),
          )
        ),
      ),
    );
  }
  
}

class _CustomGauge extends CustomPainter {
  final double value;

  _CustomGauge({required this.value});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    const double startAngle = 140.0 * math.pi / 180.0; 
    const double sweepAngle = 260.0 * math.pi / 180.0; 

    final double sizeWidget = size.height * 1.2;

    canvas.drawArc(
      Rect.fromCenter(center: center, width: sizeWidget, height: sizeWidget),
      startAngle,
      sweepAngle,
      false,
      Paint()
        ..style = PaintingStyle.stroke
        ..color = Colors.black12
        ..strokeCap = StrokeCap.round
        ..strokeWidth = 20,
    );
    canvas.saveLayer(
      Rect.fromCenter(center: center, width: 200, height: 200),
      Paint(),
    );

    const Gradient gradient = SweepGradient(
      startAngle: 1.25 * math.pi / 2,
      endAngle: 5.5 * math.pi / 2,
      tileMode: TileMode.repeated,
      colors: <Color>[
        Colors.blueAccent,
        Colors.lightBlueAccent,
      ],
    );
    canvas.drawArc(
      Rect.fromCenter(center: center, width: sizeWidget, height: sizeWidget),
      startAngle,
      sweepAngle * value,
      false,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round
        ..shader = gradient.createShader(Rect.fromLTWH(0.0, 0.0, size.width, size.height))
        ..strokeWidth = 20,
    );
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}