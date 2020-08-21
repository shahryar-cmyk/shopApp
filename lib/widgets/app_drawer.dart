import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopApp/helpers/custom_route.dart';

import '../screens/order_screen.dart';
import '../screens/user_products_screen.dart';
import '../providers/auth.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text('Hello Friend'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('Shop'),
            onTap: () => Navigator.of(context).pushReplacementNamed('/'),
          ),
          Divider(),
          ListTile(
              leading: Icon(Icons.payment),
              title: Text('Orders'),
              onTap: () => Navigator.of(context).pushReplacement(
                    CustomRoute(
                      builder: (ctx) => OrdersScreen(),
                    ),
                  )
              // Navigator.of(context)
              //     .pushReplacementNamed(OrdersScreen.routeName),
              ),
          Divider(),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('Manage Products'),
            onTap: () => Navigator.of(context)
                .pushReplacementNamed(UserProductScreen.routeName),
          ),
          Divider(),
          ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Log Out'),
              onTap: () {
                Navigator.pop(context);
                Provider.of<Auth>(context, listen: false).logOut();
              }

              //  Navigator.of(context)
              //     .pushReplacementNamed(UserProductScreen.routeName),
              ),
          Divider(),
        ],
      ),
    );
  }
}
