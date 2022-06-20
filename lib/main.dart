// ignore_for_file: use_key_in_widget_constructors

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '144 Hours',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 1), (timer) => setState(() {}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: orientation == Orientation.portrait
            ? SizedBox(
                height: size.height,
                width: size.width,
                child: FittedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Hours(),
                      Minutes(),
                      Seconds(),
                    ],
                  ),
                ),
              )
            : SizedBox(
                height: size.height,
                width: size.width,
                child: FittedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Hours(),
                      const Dots(),
                      Minutes(),
                      const Dots(),
                      Seconds(),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}

class Dots extends StatelessWidget {
  const Dots({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: MediaQuery.of(context).size.width * .5 / 80),
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(height: 40),
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.black, width: MediaQuery.of(context).size.width * .5 / 80)),
        ),
      ],
    );
  }
}

class Seconds extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var time = DateTime.now();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        OneDigit(digit: time.second ~/ 10),
        OneDigit(digit: time.second % 10),
      ],
    );
  }
}

class Minutes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var time = DateTime.now();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        OneDigit(digit: time.minute ~/ 10),
        OneDigit(digit: time.minute % 10),
      ],
    );
  }
}

class Hours extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int hour = int.parse(DateFormat('hh').format(DateTime.now()));
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        OneDigit(digit: hour ~/ 10),
        OneDigit(digit: hour % 10),
      ],
    );
  }
}

class OneDigit extends StatelessWidget {
  final int digit;
  const OneDigit({
    Key? key,
    required this.digit,
  }) : super(key: key);

  HandTurns calcAngle({required int index}) {
    if (digit == 0) {
      if (index == 1 || index == 2 || index == 21 || index == 22) {
        return HandTurns(hand1: .25, hand2: .75);
      } else if (index == 0 || index == 5) {
        return HandTurns(hand1: .25, hand2: .5);
      } else if (index == 20 || index == 17) {
        return HandTurns(hand1: 0, hand2: .25);
      } else if (index == 23 || index == 18) {
        return HandTurns(hand1: 0, hand2: .75);
      } else if (index == 3 || index == 6) {
        return HandTurns(hand1: .5, hand2: .75);
      } else {
        return HandTurns(hand1: 0, hand2: .5);
      }
    } else if (digit == 1) {
      if (index == 0 || index == 16) {
        return HandTurns(hand1: .25, hand2: .5);
      } else if (index == 1 || index == 21 || index == 22) {
        return HandTurns(hand1: .25, hand2: .75);
      } else if (index == 2 || index == 5 || index == 19) {
        return HandTurns(hand1: .5, hand2: .75);
      } else if (index == 6 || index == 9 || index == 10 || index == 13 || index == 14) {
        return HandTurns(hand1: .0, hand2: .5);
      } else if (index == 17 || index == 23) {
        return HandTurns(hand1: .0, hand2: .75);
      } else if (index == 18 || index == 20 || index == 4) {
        return HandTurns(hand1: .0, hand2: .25);
      } else {
        return HandTurns(hand1: .625, hand2: .625);
      }
    } else if (digit == 2) {
      if (index == 0 || index == 13 || index == 8) {
        return HandTurns(hand1: .25, hand2: .5);
      } else if (index == 4 || index == 17 || index == 20) {
        return HandTurns(hand1: .0, hand2: .25);
      } else if (index == 7 || index == 11 || index == 12 || index == 16) {
        return HandTurns(hand1: .0, hand2: .5);
      } else if (index == 10 || index == 15 || index == 23) {
        return HandTurns(hand1: .0, hand2: .75);
      } else if (index == 1 || index == 2 || index == 5 || index == 9 || index == 14 || index == 18 || index == 22 || index == 21) {
        return HandTurns(hand1: .25, hand2: .75);
      } else if (index == 3 || index == 6 || index == 19) {
        return HandTurns(hand1: .5, hand2: .75);
      } else {
        return HandTurns(hand1: .625, hand2: .625);
      }
    } else if (digit == 3) {
      if (index == 0 || index == 8 || index == 16) {
        return HandTurns(hand1: .25, hand2: .5);
      } else if (index == 1 || index == 2 || index == 5 || index == 9 || index == 13 || index == 21 || index == 22 || index == 17) {
        return HandTurns(hand1: .25, hand2: .75);
      } else if (index == 7 || index == 11 || index == 15 || index == 19) {
        return HandTurns(hand1: .0, hand2: .5);
      } else if (index == 4 || index == 20 || index == 12) {
        return HandTurns(hand1: .0, hand2: .25);
      } else if (index == 10 || index == 18 || index == 23) {
        return HandTurns(hand1: .0, hand2: .75);
      } else if (index == 3 || index == 6 || index == 14) {
        return HandTurns(hand1: .5, hand2: .75);
      } else {
        return HandTurns(hand1: .625, hand2: .625);
      }
    } else if (digit == 4) {
      if (index == 0 || index == 2) {
        return HandTurns(hand1: .25, hand2: .5);
      } else if (index == 4 || index == 5 || index == 6 || index == 7 || index == 8 || index == 11 || index == 15 || index == 18 || index == 19) {
        return HandTurns(hand1: 0, hand2: .5);
      } else if (index == 1 || index == 3 || index == 14) {
        return HandTurns(hand1: .5, hand2: .75);
      } else if (index == 10 || index == 23) {
        return HandTurns(hand1: 0, hand2: .75);
      } else if (index == 9 || index == 22 || index == 12) {
        return HandTurns(hand1: .0, hand2: .25);
      } else if (index == 13) {
        return HandTurns(hand1: .25, hand2: .75);
      } else {
        return HandTurns(hand1: .625, hand2: .625);
      }
    } else if (digit == 5) {
      if (index == 1 || index == 2 || index == 6 || index == 10 || index == 13 || index == 17 || index == 21 || index == 22) {
        return HandTurns(hand1: .25, hand2: .75);
      } else if (index == 4 || index == 8 || index == 15 || index == 19) {
        return HandTurns(hand1: .0, hand2: .5);
      } else if (index == 18 || index == 23 || index == 7) {
        return HandTurns(hand1: 0, hand2: .75);
      } else if (index == 11 || index == 3 || index == 14) {
        return HandTurns(hand1: .5, hand2: .75);
      } else if (index == 12 || index == 20 || index == 9) {
        return HandTurns(hand1: .0, hand2: .25);
      } else if (index == 0 || index == 16 || index == 5) {
        return HandTurns(hand1: .25, hand2: .5);
      } else {
        return HandTurns(hand1: .625, hand2: .625);
      }
    } else if (digit == 6) {
      if (index == 1 || index == 2 || index == 6 || index == 21 || index == 22 || index == 10) {
        return HandTurns(hand1: .25, hand2: .75);
      } else if (index == 9 || index == 17 || index == 20) {
        return HandTurns(hand1: .0, hand2: .25);
      } else if (index == 0 || index == 5 || index == 13) {
        return HandTurns(hand1: .25, hand2: .5);
      } else if (index == 7 || index == 18 || index == 23) {
        return HandTurns(hand1: 0, hand2: .75);
      } else if (index == 14 || index == 3 || index == 11) {
        return HandTurns(hand1: .5, hand2: .75);
      } else if (index == 4 || index == 8 || index == 12 || index == 15 || index == 16 || index == 19) {
        return HandTurns(hand1: .0, hand2: .5);
      } else {
        return HandTurns(hand1: .625, hand2: .625);
      }
    } else if (digit == 7) {
      if (index == 7 || index == 10 || index == 11 || index == 14 || index == 15 || index == 18 || index == 19) {
        return HandTurns(hand1: .0, hand2: .5);
      } else if (index == 1 || index == 2 || index == 5) {
        return HandTurns(hand1: .25, hand2: .75);
      } else if (index == 0) {
        return HandTurns(hand1: .25, hand2: .5);
      } else if (index == 4 || index == 22) {
        return HandTurns(hand1: 0, hand2: .25);
      } else if (index == 6 || index == 3) {
        return HandTurns(hand1: .5, hand2: .75);
      } else if (index == 23) {
        return HandTurns(hand1: 0, hand2: .75);
      } else {
        return HandTurns(hand1: .625, hand2: .625);
      }
    } else if (digit == 8) {
      if (index == 1 || index == 2 || index == 21 || index == 22) {
        return HandTurns(hand1: .25, hand2: .75);
      } else if (index == 0 || index == 5 || index == 13) {
        return HandTurns(hand1: .25, hand2: .5);
      } else if (index == 20 || index == 17 || index == 9) {
        return HandTurns(hand1: 0, hand2: .25);
      } else if (index == 23 || index == 18 || index == 10) {
        return HandTurns(hand1: 0, hand2: .75);
      } else if (index == 14 || index == 6 || index == 3) {
        return HandTurns(hand1: .5, hand2: .75);
      } else {
        return HandTurns(hand1: 0, hand2: .5);
      }
    } else if (digit == 9) {
      if (index == 4 || index == 7 || index == 8 || index == 11 || index == 15 || index == 19) {
        return HandTurns(hand1: .0, hand2: .5);
      } else if (index == 1 || index == 2 || index == 13 || index == 21 || index == 22 || index == 17) {
        return HandTurns(hand1: .25, hand2: .75);
      } else if (index == 0 || index == 16 || index == 5) {
        return HandTurns(hand1: .25, hand2: .5);
      } else if (index == 3 || index == 6 || index == 14) {
        return HandTurns(hand1: .5, hand2: .75);
      } else if (index == 12 || index == 9 || index == 20) {
        return HandTurns(hand1: 0, hand2: .25);
      } else if (index == 10 || index == 18 || index == 32) {
        return HandTurns(hand1: 0, hand2: .75);
      } else {
        return HandTurns(hand1: 0, hand2: .75);
      }
    } else {
      return HandTurns(hand1: .625, hand2: .625);
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width / 2.65,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
        ),
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(4),
        itemCount: 24,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return ClockStack(handTurns: calcAngle(index: index));
        },
      ),
    );
  }
}

class HandTurns {
  final double hand1, hand2;
  HandTurns({required this.hand1, required this.hand2});
}

class ClockStack extends StatefulWidget {
  final HandTurns handTurns;
  const ClockStack({Key? key, required this.handTurns}) : super(key: key);

  @override
  _ClockStackState createState() => _ClockStackState();
}

class _ClockStackState extends State<ClockStack> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          margin: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(.08), offset: const Offset(-2, 0), spreadRadius: 0, blurRadius: 2),
              BoxShadow(color: Colors.black.withOpacity(.08), offset: const Offset(0, 2), spreadRadius: 0, blurRadius: 2),
            ],
            border: Border.all(color: Colors.white, width: 1),
          ),
        ),
        RotatedHand(handTurn: widget.handTurns.hand1),
        RotatedHand(handTurn: widget.handTurns.hand2),
        AnimatedOpacity(
          opacity: widget.handTurns.hand1 == .625 ? 0 : 1,
          duration: const Duration(milliseconds: 700),
          curve: Curves.decelerate,
          child: Container(
            width: MediaQuery.of(context).size.width * .5 / 80,
            height: MediaQuery.of(context).size.width * .5 / 80,
            decoration: const BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }
}

class RotatedHand extends StatelessWidget {
  final double handTurn;
  const RotatedHand({
    Key? key,
    required this.handTurn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedRotation(
      duration: const Duration(milliseconds: 800),
      curve: Curves.decelerate,
      turns: handTurn,
      child: AnimatedOpacity(
        opacity: handTurn == .625 ? 0 : 1,
        curve: Curves.decelerate,
        duration: const Duration(milliseconds: 800),
        child: Container(
          width: MediaQuery.of(context).size.width * .5 / 80,
          height: MediaQuery.of(context).size.width * .5,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black, Colors.transparent],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [.5, 0],
            ),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
        ),
      ),
    );
  }
}
