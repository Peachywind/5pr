import 'package:flutter/material.dart';

class Item {
  final String name;

  Item(this.name);
}

class ItemProvider extends ChangeNotifier {
  final List<Item> _items = [ // Исправлено на final
    Item('Item 1'),
    Item('Item 2'),
    Item('Item 3'),
    Item('Item 4'),
  ];

  List<Item> get items => _items;

  void reorderItems(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) newIndex--;
    final item = _items.removeAt(oldIndex);
    _items.insert(newIndex, item);
    notifyListeners();
  }
}
