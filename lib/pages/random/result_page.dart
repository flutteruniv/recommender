import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[50],
      body: Center(
        child: Column(
          children: [
            Container(
              height: 540,
              width: 335,
              margin: const EdgeInsets.only(
                top: 109,
                right: 20,
                left: 20,
              ),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(36),
                ),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        top: 20,
                        right: 20,
                        // bottom: 146,
                        left: 20,
                      ),
                      child: const Text(
                        'Starbucksの\nドリンクチケット',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        top: 4,
                      ),
                      width: 70.76,
                      height: 134,
                      child: Image.asset(
                        'images/starbacks.jpg',
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        top: 8,
                      ),
                      child: const Text(
                        '¥220,000',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        top: 8,
                      ),
                      width: 123,
                      height: 36,
                      child: Container(
                        width: 43,
                        height: 30,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.only(
                          top: 3,
                          right: 40,
                          bottom: 3,
                          left: 40,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text(
                          'Link',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Container(
                      width: 60,
                      height: 60,
                      margin: const EdgeInsets.only(
                        top: 24,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 1,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    const Text(
                      'yui',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        top: 12,
                      ),
                      width: 112,
                      height: 20,
                      alignment: Alignment.center,
                      child: const Text(
                        'おすすめコメント',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.only(
                          top: 4,
                        ),
                        width: 295,
                        height: 63,
                        child: const Text(
                          '500円のカードでももらえるとシンプルに嬉しい！スタバは毎日行きたい。シンプルに嬉しい！スタバは毎日行きたい。',
                          style: TextStyle(
                            fontSize: 13,
                          ),
                          textAlign: TextAlign.center,
                        )),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 12,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 1, color: Colors.green),
              ),
              width: 214,
              height: 56,
              child: Container(
                padding: const EdgeInsets.only(
                  top: 13,
                  right: 40,
                  bottom: 13,
                  left: 40,
                ),
                width: 120,
                height: 30,
                child: const Text(
                  '←選びなおす',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
