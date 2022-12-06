import 'package:flutter/material.dart';

class SelectPage extends StatelessWidget {
  const SelectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(
                top: 156,
              ),
              width: 216,
              height: 36,
              child: const Text(
                'どっちでさがす？',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 24),
              height: 207.69,
              width: 248,
              child: Card(
                color: HexColor('C63030'),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 24),
                      width: 96,
                      height: 36,
                      child: const Text(
                        'ランダム',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.only(
                          top: 16,
                        ),
                        height: 107.69,
                        width: 100,
                        child: Image.asset('images/presents_random.jpg'))
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 24),
              height: 207.69,
              width: 248,
              child: Card(
                color: HexColor('288776'),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 24),
                      width: 120,
                      height: 36,
                      child: const Text(
                        '条件で絞る',
                        // 工事中だよみたいなポップアップ出す
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.only(
                          top: 16,
                        ),
                        height: 107.69,
                        width: 100,
                        child: Image.asset('images/presents_conditions.jpg'))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
