import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

class XMqttClient {
  MqttServerClient client = MqttServerClient('74.208.137.18', 'edwin');

  void connect() {
    final MqttClientPayloadBuilder payload = MqttClientPayloadBuilder();
    payload.addString('Hola Mundo');
    
    //client.useWebSocket = true;
    client.port = 1883;
    client.logging(on: true);
    client.connect('admin', 'EdwinMaster');
    client.publishMessage('topic', MqttQos.atMostOnce, payload.payload!);
    client.disconnect();
  }

}
