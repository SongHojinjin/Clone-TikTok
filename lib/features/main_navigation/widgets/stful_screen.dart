import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StfulScreen extends StatefulWidget {
  const StfulScreen({super.key});

  @override
  State<StfulScreen> createState() => _StfulScreenState();
}

class _StfulScreenState extends State<StfulScreen> {
  int _clicks = 0;

  void _increase() {
    setState(() {
      _clicks++;
    });
  }

  @override
  void dispose() {
    print(_clicks);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$_clicks',
            style: TextStyle(fontSize: 30),
          ),
          TextButton(
            onPressed: _increase,
            child: Text('+'),
          )
        ],
      ),
    );
  }
}
