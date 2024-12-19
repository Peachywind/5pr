import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/item_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ItemProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Reorderable List'),
      ),
      body: ReorderableListView(
        onReorder: (oldIndex, newIndex) {
          provider.reorderItems(oldIndex, newIndex);
        },
        children: List.generate(provider.items.length, (index) {
          return ListTile(
            key: ValueKey(provider.items[index]),
            title: Text(provider.items[index]),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Кнопка редактирования
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    _editItemDialog(context, index, provider);
                  },
                ),
                // Кнопка удаления
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    provider.removeItem(index);
                  },
                ),
              ],
            ),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addItemDialog(context, provider);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  // Диалог для добавления элемента
  void _addItemDialog(BuildContext context, ItemProvider provider) {
    final TextEditingController controller = TextEditingController();
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Add Item'),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(labelText: 'Item Name'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              provider.addItem(controller.text);
              Navigator.of(ctx).pop();
            },
            child: Text('Add'),
          ),
        ],
      ),
    );
  }

  // Диалог для редактирования элемента
  void _editItemDialog(BuildContext context, int index, ItemProvider provider) {
    final TextEditingController controller =
        TextEditingController(text: provider.items[index]);
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Edit Item'),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(labelText: 'Item Name'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              provider.editItem(index, controller.text);
              Navigator.of(ctx).pop();
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }
}
