import 'dart:async';
import 'package:flutter/material.dart';
import '../result_page.dart';
import 'custom_page_route.dart';
import 'stack_item.dart';

class ShortFlip extends StatefulWidget {
  const ShortFlip({Key? key}) : super(key: key);

  @override
  _ShortFlipState createState() => _ShortFlipState();
}

class _ShortFlipState extends State<ShortFlip>{
  //Declare a timer
  Timer? timer;

  /// Stackとして重ねる画像
  final items = const <StackItem>[
    StackItem(
      imagePath: 'assets/images/animation/10.png',
      visibleMilliseconds: 2000,
    ),
    StackItem(
      imagePath: 'assets/images/animation/shake6.jpg',
      visibleMilliseconds: 1500,
    ),
    StackItem(
      imagePath: 'assets/images/animation/shake5.jpg',
      visibleMilliseconds: 1000,
    ),
    StackItem(
      imagePath: 'assets/images/animation/shake4.jpg',
      visibleMilliseconds: 500,
    ),
  ];

  @override
  void initState() {
    super.initState();

    timer = Timer(
      const Duration(milliseconds: 3000),
          () {
        Navigator.push(
          context,
          CustomPageRoute(
            const ResultPage(),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: items,
      ),
    );
  }
}