import 'dart:async';

import 'package:flutter/material.dart';
import 'package:recommender_app/model/item.dart';
import '../../custom_page_route.dart';
import '../result_page.dart';
import 'stack_item.dart';

class ShortFlip extends StatefulWidget {
  const ShortFlip({Key? key, required this.item, required this.items}) : super(key: key);
  final Item item;
  final List<Item> items;

  @override
  _ShortFlipState createState() => _ShortFlipState();
}

class _ShortFlipState extends State<ShortFlip>{
  //Declare a timer
  Timer? timer;

  /// Stackとして重ねる画像
  final items = const <StackItem>[
    StackItem(
      imagePath: 'images/animation/10.png',
      visibleMilliseconds: 2000,
    ),
    StackItem(
      imagePath: 'images/animation/shake6.png',
      visibleMilliseconds: 1500,
    ),
    StackItem(
      imagePath: 'images/animation/shake5.png',
      visibleMilliseconds: 1000,
    ),
    StackItem(
      imagePath: 'images/animation/shake4.png',
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
      body: Center(
        child: SizedBox(
          width: 400,
          child: Stack(
            children: items,
          ),
        ),
      ),
    );
  }
}