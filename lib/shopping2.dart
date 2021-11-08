import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Product {
  final String name;

  const Product({required this.name});
}

typedef CartChangedCallback = Function(Product product, bool inCart);

class ShoppingListItem extends StatelessWidget {
  const ShoppingListItem(
      {required this.product,
      required this.inCart,
      required this.onCartChanged,
      Key? key})
      : super(key: key);

  final Product product;
  final bool inCart;
  final CartChangedCallback onCartChanged;

  Color _getColor(BuildContext context) {
    // The theme depends on the BuildContext because different
    // parts of the tree can have different themes.
    // The BuildContext indicates where the build is
    // taking place and therefore which theme to use.

    return inCart //
        ? Colors.green
        : Theme.of(context).primaryColor;
  }

  TextStyle? _getTextStyle(BuildContext context) {
    if (!inCart) return null;

    return const TextStyle(
      color: Colors.purpleAccent,
      decoration: TextDecoration.none,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onCartChanged(product, inCart);
      },
      leading: CircleAvatar(
        backgroundColor: _getColor(context),
        child: Text(product.name[0]),
      ),
      title: Text(
        product.name,
        style: _getTextStyle(context),
      ),
    );
  }
}

class ShoppingList extends StatefulWidget {
  const ShoppingList({required this.products, Key? key}) : super(key: key);
  final List<Product> products;

  @override
  _ShoppingListState createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  final _shoppingCart = <Product>{};

  void _handleCartChangerd(Product product, bool inCart) {
    setState(() {
      if (!inCart) {
        _shoppingCart.add(product);
      } else {
        _shoppingCart.remove(product);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping List'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8),
        children: widget.products.map((Product product) {
          return ShoppingListItem(
            product: product,
            inCart: _shoppingCart.contains(product),
            onCartChanged: _handleCartChangerd,
          );
        }).toList(),
      ),
    );
  }
}
/*

void main() {
  runApp(const MaterialApp(
      title: 'Shopping App',
      home: ShoppingList(products: [
        Product(name: "Eggs"),
        Product(name: "Flour"),
        Product(name: "Chocolate chips")
      ])));
}

*/

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body:Container(
          height: 100,
          decoration: const BoxDecoration(color: Colors.black12),
          child: Row(
            children: [
              Icon(Icons.star_border, color: Colors.orange[500]),
              Icon(Icons.star, color: Colors.green[500]),
              Icon(Icons.star, color: Colors.green[500]),
              Icon(Icons.star, color: Colors.green[500]),
              Icon(Icons.star_border, color: Colors.orange[500]),
            ],
          ),
      ),
    ),
  ));
}

/*

void main() {
  runApp(Scaffold(
    body: Center(

    ),
  ));
}
*/
