import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/item_provider.dart';

class TemplateFourScreen extends StatelessWidget {
  const TemplateFourScreen({Key? key}) : super(key: key);

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
            key: ValueKey(index),
            title: Text(provider.items[index]),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    Navigator.pushNamed(context, '/edit', arguments: index);
                  },
                ),
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
    );
  }
}
