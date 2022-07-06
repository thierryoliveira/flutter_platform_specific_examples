import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BatteryLevelPage extends StatefulWidget {
  const BatteryLevelPage({Key? key}) : super(key: key);

  @override
  State<BatteryLevelPage> createState() => _BatteryLevelPageState();
}

class _BatteryLevelPageState extends State<BatteryLevelPage> {
  static const platform = MethodChannel('samples.thierryoliveira.com/battery');
  String? _batteryLevel;

  @override
  void initState() {
    _getBatteryLevel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Battery level'),
        centerTitle: true,
      ),
      body: Center(child: Text(_batteryLevel ?? '')),
    );
  }

  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level: $result%';
    } on PlatformException catch (e) {
      batteryLevel = 'Ops, something went wrong: ${e.message}';
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }
}
