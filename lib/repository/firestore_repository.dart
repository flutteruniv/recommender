import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:recommender_app/model/item.dart';

class FirestoreRepository extends ChangeNotifier {
  Future<Item> getRandomItem() async {
    final snapshots =
        await FirebaseFirestore.instance.collection('items').get();
    final list = snapshots.docs.map((doc) => Item(doc)).toList();

    //乱数の種を時間ごとに変更するためのDataTime指定
    final ram = Random(DateTime.now().millisecondsSinceEpoch);
    final item = list[ram.nextInt(list.length)];

    return item;
  }
}
