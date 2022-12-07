import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recommender_app/repository/firestore_repository.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../model/item.dart';
import 'package:url_launcher/link.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FirestoreRepository>(
      create: (_) => FirestoreRepository()..getRandomItem(),
      child: Scaffold(
        backgroundColor: Colors.orange[50],
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Consumer<FirestoreRepository>(
                  builder: (context, model, child) {
                    final List<Item>? items = model.item;
                   Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(36),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text(
                            items.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 16),
                          Image.asset(
                            items.itemImage,
                          ),
                          const SizedBox(height: 16),
                          Container(
                            margin: const EdgeInsets.only(
                              top: 8,
                            ),
                            child: Text(
                              items.cost,
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
                              onPressed: () => _openUrl(),
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
                                  image: AssetImage(items.memberIcon)),
                              border: Border.all(
                                width: 3,
                                color: HexColor('F4F4F3'),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                           Text(
                            items.memberName,
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
                            items.memberMessage,
                            style: const TextStyle(
                              fontSize: 13,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  );},
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 12,
                ),
                width: 214,
                height: 56,
                child: OutlinedButton(
                  onPressed: () {},
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

  void _openUrl() async {
    const url = items.storeUrl;
    if (await canLaunchUrl(url)) {
      await launchUrl(
        url,
      );
    } else {
      throw 'このURLにはアクセスできません';
    }
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
