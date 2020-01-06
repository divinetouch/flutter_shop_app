import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/products_overview_screen.dart';
import './screens/product_detail_screen.dart';
import './providers/products.dart';
import './providers/cart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          key: Key('cart'),
          value: Cart(),
        ),
        ChangeNotifierProvider.value(
          key: Key('products'),
          value: Products(),
        ),
      ],
      child: MaterialApp(
        title: 'MyShop',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato',
        ),
        home: ProductsOverviewScreen(),
        routes: {
          ProductsOverviewScreen.routeName: (context) =>
              ProductsOverviewScreen(),
          ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
        },
      ),
    );
  }
}
//   return MaterialApp(
//       title: 'MyShop',
//       theme: ThemeData(
//         primarySwatch: Colors.purple,
//         accentColor: Colors.deepOrange,
//         fontFamily: 'Lato',
//       ),
//       home: ProductsOverviewScreen(),
//       routes: {
//         ProductsOverviewScreen.routeName: (context) =>
//             ProductsOverviewScreen(),
//         ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
//       });
// }
// }
