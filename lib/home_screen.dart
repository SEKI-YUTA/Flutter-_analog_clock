import 'package:analog_clock/widget/anaglo_clock.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(icon: Icon(Icons.nightlight), onPressed: () {},),
      ),
      body: Center(
        child: AnalogClock(),
      ),
    );
  }
}