import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopApp/widgets/app_drawer.dart';

import '../widgets/product_grid.dart';
import '../widgets/badge.dart';
import '../providers/cart.dart';
import 'cart_screen.dart';

enum FilterOPtions {
  Favourites,
  All,
}

class ProductsOverviewScreen extends StatefulWidget {
  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showFavouriteOnly = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text('MyShop'),
        actions: [
          PopupMenuButton(
            onSelected: (FilterOPtions selectedValue) {
              // print(selectedValue);
              setState(() {
                if (selectedValue == FilterOPtions.Favourites) {
                  // productContainer.showFavouriteOnly();
                  _showFavouriteOnly = true;
                } else {
                  // productContainer.showAll();
                  _showFavouriteOnly = false;
                }
              });
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Only Favourite'),
                value: FilterOPtions.Favourites,
              ),
              PopupMenuItem(
                child: Text('Show All'),
                value: FilterOPtions.All,
              )
            ],
          ),
          Consumer<Cart>(
            builder: (_, cart, ch) => Badge(
              child: ch,
              value: cart.itemCount.toString(),
            ),
            child: IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(CartScreen.routeName);
                }),
          ),
        ],
      ),
      body: ProductsGrid(_showFavouriteOnly),
    );
  }
}
