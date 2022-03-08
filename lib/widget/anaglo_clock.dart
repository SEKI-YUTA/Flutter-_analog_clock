import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class AnalogClock extends StatefulWidget {
  const AnalogClock({Key? key}) : super(key: key);

  @override
  State<AnalogClock> createState() => _AnalogClockState();
}

class _AnalogClockState extends State<AnalogClock> {
  int secAngle = 0;
  int minAngle = 0;
  int hourAngle = 0;
  String _time = "";
  @override
  void initState() {
    print('initState');
    Timer.periodic(Duration(milliseconds: 1000), (timer) {
      DateTime now = DateTime.now();
      String formatted = _convertTime(now);
      _calcAngle(formatted);
      setState(() {
        _time = formatted;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(8),
      decoration:
          BoxDecoration(color: Theme.of(context).scaffoldBackgroundColor),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
                Radius.circular(MediaQuery.of(context).size.width)),
            border: Border.all(width: 2, color: Colors.black45)),
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            Positioned(
                bottom: 20,
                child: Text(
                  _time,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                )),
            RotationTransition(
              alignment: Alignment.bottomCenter,
              turns: AlwaysStoppedAnimation(secAngle / 360),
              child: Container(
                width: 4,
                height: MediaQuery.of(context).size.width / 2 - 10,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        stops: [
                      0.9,
                      0.9,
                    ],
                        colors: [
                      Colors.blue,
                      Theme.of(context).scaffoldBackgroundColor
                    ])),
              ),
            ),
            RotationTransition(
              alignment: Alignment.bottomCenter,
              turns: AlwaysStoppedAnimation(minAngle / 360),
              child: Container(
                width: 4,
                height: MediaQuery.of(context).size.width / 2 - 10,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        stops: [
                      0.7,
                      0.7,
                    ],
                        colors: [
                      Colors.green,
                      Theme.of(context).scaffoldBackgroundColor
                    ])),
              ),
            ),
            RotationTransition(
              alignment: Alignment.bottomCenter,
              turns: AlwaysStoppedAnimation(hourAngle / 360),
              child: Container(
                width: 4,
                height: MediaQuery.of(context).size.width / 2 - 10,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        stops: [
                      0.6,
                      0.6,
                    ],
                        colors: [
                      Colors.red,
                      Theme.of(context).scaffoldBackgroundColor
                    ])),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.width / 2 - 10 - (15 / 2),
              child: Container(
                width: 15,
                height: 15,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
              ),
            )
          ],
        ),
      ),
    );
  }

  _convertTime(DateTime date) {
    DateFormat formatter = DateFormat('hh:mm:ss');
    return formatter.format(date);
  }

  _calcAngle(String time) {
    int hour = (360 / 12 * int.parse(time.split(":")[0])).toInt();
    int min = (360 / 60 * int.parse(time.split(":")[1])).toInt();
    int sec = (360 / 60 * int.parse(time.split(":")[2])).toInt();
    print('hour$hour');
    print('min${min}');
    print('sec $sec');
    setState(() {
      secAngle = sec;
      minAngle = min;
      hourAngle = hour;
    });
  }
}
