import 'package:flutter/material.dart';
import 'flip_item.dart';

/// そもそもStackとは？
/// -> ウィジェットを重ねることができるウィジェット (https://flutter.ctrnost.com/basic/layout/stack/)
///    Stackを使ったサンプルページ
/// 　　指定した時間を経過するとStackの子要素として設定しているウィジェットを非表示にしてみる
class Flipbook extends StatelessWidget {
  const Flipbook({super.key});

  /// Stackとして重ねる画像
  final items = const <FlipItem>[
    FlipItem(
      imagePath: 'assets/images/10.png',
      visibleMilliseconds: 8000,
    ),
    FlipItem(
      imagePath: 'assets/images/shake6.jpg',
      visibleMilliseconds: 7500,
    ),
    FlipItem(
      imagePath: 'assets/images/shake5.jpg',
      visibleMilliseconds: 7000,
    ),
    FlipItem(
      imagePath: 'assets/images/shake4.jpg',
      visibleMilliseconds: 6500,
    ),
    FlipItem(
      imagePath: 'assets/images/shake3.jpg',
      visibleMilliseconds: 6000,
    ),
    FlipItem(
      imagePath: 'assets/images/shake2.jpg',
      visibleMilliseconds: 5500,
    ),
    FlipItem(
      imagePath: 'assets/images/shake1.jpg',
      visibleMilliseconds: 5000,
    ),
    FlipItem(
      imagePath: 'assets/images/9.png',
      visibleMilliseconds: 4500,
    ),
    FlipItem(
      imagePath: 'assets/images/8.png',
      visibleMilliseconds: 4000,
    ),
    FlipItem(
      imagePath: 'assets/images/7.png',
      visibleMilliseconds: 3500,
    ),
    FlipItem(
      imagePath: 'assets/images/6.png',
      visibleMilliseconds: 3000,
    ),
    FlipItem(
      imagePath: 'assets/images/5.png',
      visibleMilliseconds: 2500,
    ),
    FlipItem(
      imagePath: 'assets/images/4.png',
      visibleMilliseconds: 2000,
    ),
    FlipItem(
      imagePath: 'assets/images/3.png',
      visibleMilliseconds: 1500,
    ),
    FlipItem(
      imagePath: 'assets/images/2.png',
      visibleMilliseconds: 1000,
    ),
    FlipItem(
      imagePath: 'assets/images/1.png',
      visibleMilliseconds: 500,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: items,
        ));
  }
}