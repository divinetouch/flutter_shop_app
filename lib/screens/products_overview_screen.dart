import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/products_grid.dart';
import '../providers/products.dart';

enum FilterOptions { Favorites, All }

class ProductsOverviewScreen extends StatelessWidget {
  static const routeName = '/products-overview';

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyShop'),
        actions: <Widget>[
          PopupMenuButton(
            icon: Icon(
              Icons.more_vert,
            ),
            itemBuilder: (_) => [
              PopupMenuItem(
                  child: Text('Only Favorites'),
                  value: FilterOptions.Favorites),
              PopupMenuItem(child: Text('Show All'), value: FilterOptions.All),
            ],
            onSelected: (FilterOptions selectedValue) {
              if (selectedValue == FilterOptions.Favorites) {
                products.showFavoritesOnly();
              } else {
                products.showAll();
              }
            },
          ),
        ],
      ),
      body: ProductsGrid(),
    );
  }
}
