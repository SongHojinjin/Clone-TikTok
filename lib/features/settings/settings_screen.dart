import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: ListWheelScrollView(
        itemExtent: 200,
        children: [
          for (var x in [1, 1, 1, 1, 1, 1, 1, 1, 1])
            FractionallySizedBox(
              widthFactor: 1,
              child: Container(
                color: Colors.blue,
                alignment: Alignment.center,
                child: const Text('뭐'),
              ),
            )
        ],
      ),
    );
  }
}
