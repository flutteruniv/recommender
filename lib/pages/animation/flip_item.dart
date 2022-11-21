import 'dart:async';

import 'package:flutter/material.dart';

class FlipItem extends StatefulWidget {
  /// 引数
  ///
  /// imagePath：表示画像パス
  ///
  /// visibleMilliseconds：画像を表示したい時間（ミリ）
  const FlipItem(
      {required this.imagePath, required this.visibleMilliseconds, super.key});
  final String imagePath;
  final int visibleMilliseconds;

  @override
  State<FlipItem> createState() => _FlipItemState();
}

class _FlipItemState extends State<FlipItem> {
  // 画像の透明度を保持する値
  double _opacity = 1.0;

  late Timer opacityTimer;

  @override
  void initState() {
    super.initState();

    // 画像が透明になり始めるまでの時間を設定
    // ここを調整するといい感じになる？
    opacityTimer =
        Timer(Duration(milliseconds: widget.visibleMilliseconds), () {
          setState(() {
            _opacity = 0.0;
          });
        });
  }

  @override
  void dispose() {
    super.dispose();
    // timerを破棄
    opacityTimer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 1000), // 不透明 -> 透明にどれくらいの時間をかけるか
      opacity: _opacity,
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(widget.imagePath),
              fit: BoxFit.cover,
            )),
      ),
    );
  }
}