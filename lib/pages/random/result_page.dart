import 'dart:math';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../model/item.dart';
import '../custom_page_route.dart';
import 'animation/short_flip.dart';
import 'package:url_launcher/link.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key, required this.item, required this.items});
  final Item item;
  final List<Item> items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[50],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(36),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        item.name ?? "",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      Image(image:NetworkImage(
                        item.itemImage ?? "",
                      ),),
                     const SizedBox(height: 16),
                      Container(
                        margin: const EdgeInsets.only(
                          top: 8,
                        ),
                        child: Text(
                          '¥ ${item.cost ?? ""}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
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
                            onPressed: () {},
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
                      const SizedBox(height: 8),
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(item.memberIcon ?? "")),
                          border: Border.all(
                            width: 3,
                            color: HexColor('F4F4F3'),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        item.memberName ?? "",
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'おすすめコメント',
                        style: TextStyle(
                          fontSize: 14,
                          color: HexColor('288776'),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        item.memberMessage ?? "",
                        style: const TextStyle(
                          fontSize: 13,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 12,
              ),
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
    );
  }

  Item getRandomItem() {
    final ram = Random(DateTime.now().millisecondsSinceEpoch);
    final item = items[ram.nextInt(items.length)];
    return item;
  }
/*
  void _openUrl() async {
    const url = item.storeUrl ?? ""; //←ここに表示させたいURLを入力する
      await launchUrl(
        url,
        //forceSafariVC: true,
        //forceWebView: true,
      );
  }

 */
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
