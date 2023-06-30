import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BluetoothPage(),
    );
  }
}

class BluetoothPage extends StatefulWidget {
  @override
  _BluetoothPageState createState() => _BluetoothPageState();
}

class _BluetoothPageState extends State<BluetoothPage> {
  FlutterBluePlus flutterBlue = FlutterBluePlus.instance;
  BluetoothDevice? device;
  BluetoothCharacteristic? characteristic;

  @override
  void initState() {
    super.initState();
    scanDevices();
  }

  void scanDevices() {
    flutterBlue.scan().listen((scanResult) {
      // スキャン結果を処理
      if (scanResult.device.name == 'Your ESP32 Device Name') {
        // ESP32デバイスが見つかった場合
        device = scanResult.device;
        connectToDevice();
      }
    });
  }

  void connectToDevice() async {
    if (device != null) {
      await device!.connect();
      discoverServices();
    }
  }

  void discoverServices() async {
    List<BluetoothService> services = await device!.discoverServices();
    services.forEach((service) {
      if (service.uuid.toString() == 'Your Service UUID') {
        service.characteristics.forEach((characteristic) {
          if (characteristic.uuid.toString() == 'Your Characteristic UUID') {
            this.characteristic = characteristic;
          }
        });
      }
    });
  }

  void sendValue(int value) async {
    if (characteristic != null) {
      List<int> data = [value];  // 送信するデータを準備
      await characteristic!.write(data);
    }
  }

  void func(int a){
    print(a);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bluetooth Communication'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () {
              func(123);
            }, child: const Text('送る１')),
            ElevatedButton(onPressed: () {
              sendValue(2);
            }, child: const Text('送る２')),

          ],
        ),
      ),
    );
  }
}
