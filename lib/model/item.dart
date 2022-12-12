import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class Item {
  Item(DocumentSnapshot<Map<String, dynamic>> doc) {
    Firebase.initializeApp();
    id = doc.id;
    name = doc.data()!['name'];
    cost = doc.data()!['cost'];
    costType = doc.data()!['cost_type'];
    itemImage = doc.data()!['item_image'];
    //storeUrl = doc.data()!['store_url'];
    memberName = doc.data()!['member_name'];
    memberMessage = doc.data()!['member_message'];
    memberIcon = doc.data()!['member_icon'];
    createdAt = doc.data()!['createdAt'];
    updatedAt = doc.data()!['updatedAt'];
    deletedAt = doc.data()!['deletedAt'];
  }

  /// id
  String? id;

  /// 商品名
  String? name;

  /// 値段
  String? cost;

  /// コストタイプ
  String? costType;

  /// 商品画像url
  String? itemImage;

  /// 商品ページurl
  //Uri? storeUrl;

  /// メンバー名
  String? memberName;

  /// メンバーコメント
  String? memberMessage;

  /// アイコン画像url
  String? memberIcon;

  /// 作成日
  Timestamp? createdAt;

  /// 更新日
  Timestamp? updatedAt;

  /// 削除日
  Timestamp? deletedAt;
}
