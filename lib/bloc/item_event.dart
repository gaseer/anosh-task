import 'package:anosh/models/item_model.dart';

abstract class ItemEvent {}

class LoadItems extends ItemEvent {}

class SelectItem extends ItemEvent {
  final Item item;
  SelectItem(this.item);
}

class ClearSelectedItem extends ItemEvent {}
