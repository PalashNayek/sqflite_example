import 'package:flutter/material.dart';

import '../repositories/item_repository.dart';

class ItemViewModel extends ChangeNotifier {
  final ItemRepository _repository;
  List<Map<String, dynamic>> _items = [];

  ItemViewModel(this._repository);

  List<Map<String, dynamic>> get items => _items;

  Future<void> fetchItems() async {
    _items = await _repository.getItems();
    notifyListeners();
  }

  Future<void> addItem(String name, String description) async {
    await _repository.addItem({
      'name': name,
      'description': description,
    });
    fetchItems();
  }

  Future<void> deleteItem(int id) async {
    await _repository.deleteItem(id);
    fetchItems();
  }
}
