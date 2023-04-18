import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({
    super.key,
  });

  static const routeName = "/product-detail";

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)?.settings.arguments as String;

    final productsData = Provider.of<Products>(
      context,
    );

    final product = productsData.findById(productId);

    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: Column(children: [
        SizedBox(
          height: 300,
          width: double.infinity,
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "\$${product.price}",
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 20,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          width: double.infinity,
          child: Text(
            product.description,
            textAlign: TextAlign.center,
            softWrap: true,
          ),
        )
      ]),
    );
  }
}
