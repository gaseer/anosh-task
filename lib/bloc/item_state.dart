import '../models/item_model.dart';

class ItemState {
  final List<Item> items;
  final Item? selectedItem;
  final bool loading;
  final String? error;

  ItemState({
    this.items = const [],
    this.selectedItem,
    this.loading = false,
    this.error,
  });

  ItemState copyWith({
    List<Item>? items,
    Item? selectedItem,
    bool? loading,
    String? error,
  }) {
    return ItemState(
      items: items ?? this.items,
      selectedItem: selectedItem,
      loading: loading ?? this.loading,
      error: error ?? this.error,
    );
  }
}
