import 'dart:async';

import 'package:flutter/material.dart';
import 'package:recommender_app/model/item.dart';
import '../../custom_page_route.dart';
import '../result_page.dart';
import 'stack_item.dart';

class Flipbook extends StatefulWidget {
  const Flipbook({Key? key, required this.item, required this.items}) : super(key: key);
  final Item item;
  final List<Item> items;

  @override
  _FlipbookState createState() => _FlipbookState();
}

class _FlipbookState extends State<Flipbook>{
  //Declare a timer
  Timer? timer;

  /// Stackとして重ねる画像
  final flips = const <StackItem>[
    StackItem(
      imagePath: 'images/animation/10.png',
      visibleMilliseconds: 8000,
    ),
    StackItem(
      imagePath: 'images/animation/shake6.png',
      visibleMilliseconds: 7500,
    ),
    StackItem(
      imagePath: 'images/animation/shake5.png',
      visibleMilliseconds: 7000,
    ),
    StackItem(
      imagePath: 'images/animation/shake4.png',
      visibleMilliseconds: 6500,
    ),
    StackItem(
      imagePath: 'images/animation/shake3.png',
      visibleMilliseconds: 6000,
    ),
    StackItem(
      imagePath: 'images/animation/shake2.png',
      visibleMilliseconds: 5500,
    ),
    StackItem(
      imagePath: 'images/animation/shake1.png',
      visibleMilliseconds: 5000,
    ),
    StackItem(
      imagePath: 'images/animation/9.png',
      visibleMilliseconds: 4500,
    ),
    StackItem(
      imagePath: 'images/animation/8.png',
      visibleMilliseconds: 4000,
    ),
    StackItem(
      imagePath: 'images/animation/7.png',
      visibleMilliseconds: 3500,
    ),
    StackItem(
      imagePath: 'images/animation/6.png',
      visibleMilliseconds: 3000,
    ),
    StackItem(
      imagePath: 'images/animation/5.png',
      visibleMilliseconds: 2500,
    ),
    StackItem(
      imagePath: 'images/animation/4.png',
      visibleMilliseconds: 2000,
    ),
    StackItem(
      imagePath: 'images/animation/3.png',
      visibleMilliseconds: 1500,
    ),
    StackItem(
      imagePath: 'images/animation/2.png',
      visibleMilliseconds: 1000,
    ),
    StackItem(
      imagePath: 'images/animation/1.png',
      visibleMilliseconds: 500,
    ),
  ];

  @override
  void initState() {
    super.initState();

    timer = Timer(
      const Duration(milliseconds: 9000),
          () {
        Navigator.push(
          context,
          CustomPageRoute(
             ResultPage(item: widget.item, items: widget.items),
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
        children: flips,
      ),
    );
  }
}