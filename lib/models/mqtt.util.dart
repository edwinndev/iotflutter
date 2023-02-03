enum MqttQos {
  atMostOnce(0),
  atLeastOnce(1),
  exactlyOnce(2);
  final int qos;
  const MqttQos(this.qos);
}
