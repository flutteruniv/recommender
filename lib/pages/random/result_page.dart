import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../model/item.dart';
import '../custom_page_route.dart';
import 'animation/short_flip.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key, required this.item, required this.items});
  final Item item;
  final List<Item> items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('EDE8E4'),
      body: Center(
        child: Container(
          width: 390,
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('images/background-result.png'),
            fit: BoxFit.cover,
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(36),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Text(
                              item.name != null
                                  ? item.name!.replaceAll('\\n', '\n')
                                  : "",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                height: 1.4,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 4),
                            SizedBox(
                              width: 135,
                              height: 135,
                              child: Image(
                                image: NetworkImage(
                                  item.itemImage ?? "",
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              item.cost != '' ? '¥${item.cost}' : "",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                height: 1.4,
                              ),
                            ),
                            const SizedBox(height: 8),
                            SizedBox(
                              width: 123,
                              height: 36,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: HexColor('288776'),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onPressed: () {
                                  onLaunchUrl();
                                },
                                child: const Text(
                                  'Link',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 34),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: HexColor('FAF8F4'),
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(36),
                            bottomRight: Radius.circular(36),
                          ),
                        ),
                        child: Container(
                          transform: Matrix4.translationValues(0.0, -30.0, 0.0),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20.0,
                          ),
                          child: Column(
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(item.memberIcon ?? ""),
                                  ),
                                  border: Border.all(
                                    width: 3,
                                    color: HexColor('F4F4F3'),
                                  ),
                                ),
                              ),
                              Container(
                                transform:
                                    Matrix4.translationValues(0.0, -8.0, 0.0),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                child: Text(
                                  item.memberName ?? "",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'おすすめコメント',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: HexColor('288776'),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              SizedBox(
                                height: 63,
                                child: Text(
                                  // note: 12文字 x 3行
                                  item.memberMessage ?? "",
                                  style: const TextStyle(
                                    fontSize: 13,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: 214,
                height: 56,
                child: OutlinedButton(
                  onPressed: () {
                    final item = getRandomItem();
                    Navigator.push(
                      context,
                      CustomPageRoute(
                        ShortFlip(item: item, items: items),
                      ),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    side: BorderSide(
                      width: 1,
                      color: HexColor('94D4C8'),
                    ),
                  ),
                  child: Text(
                    '←選びなおす',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: HexColor('288776'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Item getRandomItem() {
    final ram = Random(DateTime.now().millisecondsSinceEpoch);
    final item = items[ram.nextInt(items.length)];
    return item;
  }

  Future onLaunchUrl() async {
    final url = Uri.parse(item.storeUrl ?? "");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }
}
