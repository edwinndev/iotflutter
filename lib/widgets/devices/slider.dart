import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:iot/controllers/slider.controller.dart';
import 'package:iot/models/device.info.dart';
import 'package:iot/widgets/devices/device.dart';

class SliderDevice implements Device {
  
  @override
  Widget create(DeviceInfo device) {
    return GetBuilder<SliderController>(
      id: device.id,
      init: SliderController(),
      builder: (_) => Slider(
        min: 0.0,
        max: 100.0,
        value: _.value,
        divisions: 10,
        label: '${_.value.round()}',
        onChanged: (value) => _.change(value, device.id),
      ),
    );
  }
  
}


class RoundSliderThumbShape extends SliderComponentShape {
  final double enabledThumbRadius;
  final double disabledThumbRadius;

  const RoundSliderThumbShape({
    this.enabledThumbRadius = 10.0,
    required this.disabledThumbRadius,
  });

  double get _disabledThumbRadius =>  disabledThumbRadius;

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(isEnabled == true ? enabledThumbRadius : _disabledThumbRadius);
  }
  
  @override
  void paint(
    PaintingContext context,
    Offset center, {
      required Animation<double> activationAnimation,
      required Animation<double> enableAnimation,
      required bool isDiscrete,
      required TextPainter labelPainter,
      required RenderBox parentBox,
      required SliderThemeData sliderTheme,
      required TextDirection textDirection,
      required double value,
      required double textScaleFactor,
      required Size sizeWithOverflow
    }
  ) {
    final Canvas canvas = context.canvas;
    final Tween<double> radiusTween = Tween<double>(
      begin: _disabledThumbRadius,
      end: enabledThumbRadius,
    );
    final ColorTween colorTween = ColorTween(
      begin: sliderTheme.disabledThumbColor,
      end: sliderTheme.thumbColor,
    );
    canvas.drawCircle(
      center,
      radiusTween.evaluate(enableAnimation),
      Paint()..color = colorTween.evaluate(enableAnimation)!,
    );
  }

  /*@override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
  }) {
    final Canvas canvas = context.canvas;
    final Tween<double> radiusTween = Tween<double>(
      begin: _disabledThumbRadius,
      end: enabledThumbRadius,
    );
    final ColorTween colorTween = ColorTween(
      begin: sliderTheme.disabledThumbColor,
      end: sliderTheme.thumbColor,
    );
    canvas.drawCircle(
      center,
      radiusTween.evaluate(enableAnimation),
      Paint()..color = colorTween.evaluate(enableAnimation)!,
    );
  }*/
}