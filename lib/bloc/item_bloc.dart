import 'package:anosh/bloc/item_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../repositories/item_repository.dart';
import 'item_state.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  final ItemRepository itemRepository;

  ItemBloc(this.itemRepository) : super(ItemState()) {
    on<LoadItems>(_onLoadItems);
    on<SelectItem>(_onSelectItem);
    on<ClearSelectedItem>(_onClearSelectedItem);
  }

  void _onLoadItems(LoadItems event, Emitter<ItemState> emit) async {
    emit(state.copyWith(loading: true, error: null));
    try {
      final items = await itemRepository.loadItemsFromJson();
      emit(state.copyWith(items: items, loading: false));
    } catch (e) {
      emit(state.copyWith(loading: false, error: e.toString()));
    }
  }

  void _onSelectItem(SelectItem event, Emitter<ItemState> emit) {
    emit(state.copyWith(selectedItem: event.item));
  }

  void _onClearSelectedItem(ClearSelectedItem event, Emitter<ItemState> emit) {
    emit(state.copyWith(selectedItem: null));
  }
}
