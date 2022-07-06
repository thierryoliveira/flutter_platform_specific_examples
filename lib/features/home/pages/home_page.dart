import 'package:flutter/material.dart';

import '../../battery_level/pages/battery_level_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text('Platform Specific Examples'),
          centerTitle: true,
        ),
        body: Center(
          child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BatteryLevelPage()));
              },
              child: const Text('Battery level')),
        ),
      );
}
