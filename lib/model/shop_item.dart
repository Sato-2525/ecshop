import 'dart:convert';

import 'package:ecshop_techpit/model/category.dart';
import 'package:ecshop_techpit/model/data/item/item.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//FutureProviderは非同期関数を利用できる。JSON ファイルの読み込み処理は非同期処理
final shopItemProvider = FutureProvider((ref) async {
  //テキスト形式のファイルを String 型のデータで受け取り
  final data = await rootBundle.loadString('assets/mock.json');
  //受け取った JSONデータはただの String 型でJSON は Key と Value の構造的データですので、そのようにデコードする
  final json = (jsonDecode(data) as List).cast<Map<String, dynamic>>();
  //ロードした JSON データを item クラスに変換します。
  final items = json.map(Item.fromJson).toList();
  return items;
});

//各Itemのidだけを取り出したいProviderを追加する
final shopItemIdsForSelectedCategoryProvider = Provider((ref) {
  final AsyncValue<List<Item>> items = ref.watch(shopItemProvider);
  final selectedCategory = ref.watch(selectedCategoryProvider);
  return items.whenData((items) => items
      .where((item) => item.category == selectedCategory)
      .map((item) => item.id)
      .toList());
});

//IDを指定して商品情報を受け取ることができる
final shopItemForIdProvider = Provider.family((ref, String id) {
  final AsyncValue<List<Item>> items = ref.watch(shopItemProvider);
  return items.whenData((items) => items.firstWhere((item) => item.id == id));
});
