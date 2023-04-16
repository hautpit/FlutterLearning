import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart.dart';
import 'package:shop_app/providers/product.dart';
import 'package:shop_app/screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String iamegUrl;

  const ProductItem({
    super.key,
    // required this.id,
    // required this.title,
    // required this.iamegUrl
  });

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(
      context,
    );
    final cart = Provider.of<Cart>(
      context,
    );

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: Consumer<Product>(
            builder: (context, value, child) => IconButton(
              icon: const Icon(Icons.favorite),
              onPressed: () {
                product.toggleFavoriteStatus();
              },
              color: product.isFavorite ? Colors.blueAccent : Colors.white,
            ),
            child: const Text("Never changes"),
          ),
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              cart.addItem(product.id, product.price, product.title);
            },
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(ProductDetailScreen.routeName,
                arguments: product.id);
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
