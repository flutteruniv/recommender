import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:recommender_app/model/item.dart';

import 'custom_page_route.dart';
import 'random/animation/flipbook.dart';

class SelectPage extends StatefulWidget {
  const SelectPage({super.key});

  @override
  State<SelectPage> createState() => _SelectPageState();
}

class _SelectPageState extends State<SelectPage> {
  List<Item> items = [];

  @override
  void initState() {
    super.initState();
    Future(() async {
      final snapshots = await fetchItems();
      setState(() {
        items = snapshots;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('EAE8E4'),
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
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 24),
              height: 207.69,
              width: 248,
              child: GestureDetector(
                onTap: () {
                  final item = getRandomItem();

                  Navigator.push(
                    context,
                    CustomPageRoute(
                      Flipbook(item: item, items: items),
                    ),
                  );
                },
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
                            fontWeight: FontWeight.w500,
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
            ),
            Container(
              margin: const EdgeInsets.only(top: 24),
              height: 207.69,
              width: 248,
              child: GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Coming Soon !"),
                        actions: [
                          TextButton(
                            child: const Text("OK"),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ],
                      );
                    },
                  );
                },
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
                            fontWeight: FontWeight.w500,
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
            ),
          ],
        ),
      ),
    );
  }

  /// Firestoreのデータを取得し、listに格納
  Future<List<Item>> fetchItems() async {
    final snapshots =
        await FirebaseFirestore.instance.collection('items').get();
    final list = snapshots.docs.map((doc) => Item(doc)).toList();
    return list;
  }

  /// listの中からランダムで1つアイテム取り出す
  Item getRandomItem() {
    final ram = Random(DateTime.now().millisecondsSinceEpoch);
    final item = items[ram.nextInt(items.length)];
    return item;
  }
}
