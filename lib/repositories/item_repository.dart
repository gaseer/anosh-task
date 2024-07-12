import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../models/item_model.dart';

class ItemRepository {
  Future<List<Item>> loadItemsFromJson() async {
    try {
      String jsonString = await rootBundle.loadString('assets/data.json');
      final jsonData = json.decode(jsonString);

      List<Item> items = (jsonData['Items'] as List)
          .map((itemJson) => Item.fromJson(itemJson))
          .toList();
      return items;
    } catch (e) {
      throw Exception('Failed to load items from JSON: $e');
    }
  }
}
