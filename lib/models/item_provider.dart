import 'package:flutter/material.dart';

class ItemProvider with ChangeNotifier {
  final List<String> _items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
  ];

  List<String> get items => _items;

  // Метод для перемещения элементов
  void reorderItems(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final String item = _items.removeAt(oldIndex);
    _items.insert(newIndex, item);
    notifyListeners();
  }

  // Добавление нового элемента
  void addItem(String newItem) {
    _items.add(newItem);
    notifyListeners();
  }

  // Удаление элемента по индексу
  void removeItem(int index) {
    _items.removeAt(index);
    notifyListeners();
  }

  // Обновление элемента
  void editItem(int index, String newItem) {
    _items[index] = newItem;
    notifyListeners();
  }
}
