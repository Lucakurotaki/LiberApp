import 'package:flutter/material.dart';
import '../../pages/account_page.dart';
import '../../pages/cart_page.dart';
import '../../pages/favorites_page.dart';
import '../../pages/home_page.dart';
import '../../pages/orders_page.dart';

class DrawBar extends StatefulWidget {
  final Color mainColor = Colors.indigo;
  final Color secondColor = Colors.white;

  const DrawBar({Key? key}) : super(key: key);

  @override
  State<DrawBar> createState() => _DrawBarState();
}

class _DrawBarState extends State<DrawBar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 250,
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(
              'Página do usuário',
              style: TextStyle(color: widget.secondColor),
            ),
            accountEmail: Text(
              'email@mail.com',
              style: TextStyle(color: widget.secondColor),
            ),
            currentAccountPicture: GestureDetector(
              child: const CircleAvatar(
                backgroundColor: Colors.grey,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
            ),
            decoration: BoxDecoration(color: widget.mainColor),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MyHomePage()));
            },
            child: const ListTile(
              title: Text('Página inicial'),
              leading: Icon(Icons.home),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AccountPage()));
            },
            child: const ListTile(
              title: Text('Minha conta'),
              leading: Icon(Icons.person),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const OrdersPage()));
            },
            child: const ListTile(
              title: Text('Meus pedidos'),
              leading: Icon(Icons.shopping_basket),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const CartPage()));
            },
            child: const ListTile(
              title: Text('Carrinho'),
              leading: Icon(Icons.shopping_cart),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const FavoritesPage()));
            },
            child: const ListTile(
              title: Text('Favoritos'),
              leading: Icon(Icons.favorite),
            ),
          ),
          const Divider(),
          InkWell(
            onTap: () {},
            child: const ListTile(
              title: Text('Configurações'),
              leading: Icon(Icons.settings),
            ),
          ),
          InkWell(
            onTap: () {},
            child: ListTile(
              title: const Text('Sobre'),
              leading: Icon(
                Icons.help,
                color: Colors.blue[700],
              ),
            ),
          )
        ],
      ),
    );
  }
}

