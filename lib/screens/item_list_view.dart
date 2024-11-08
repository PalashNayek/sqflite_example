import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../view_models/item_view_model.dart';

class ItemListView extends StatelessWidget {
  final ItemViewModel _viewModel = GetIt.I<ItemViewModel>();

  ItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Items')),
      body: FutureBuilder(
        future: _viewModel.fetchItems(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
          return ListView.builder(
            itemCount: _viewModel.items.length,
            itemBuilder: (context, index) {
              final item = _viewModel.items[index];
              return ListTile(
                title: Text(item['name']),
                subtitle: Text(item['description']),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => _viewModel.deleteItem(item['id']),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _viewModel.addItem('New Item', 'This is a new item'),
        child: Icon(Icons.add),
      ),
    );
  }
}
