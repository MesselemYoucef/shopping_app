// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/product_detail_screen.dart';

import '../providers/product.dart';

class ProductItem extends StatelessWidget {
  const ProductItem();

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    return GridTile(
      footer: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTileBar(
          leading: Consumer<Product>(
            builder: (ctx, product, _) => IconButton(
              color: product.isFavorite
                  ? Theme.of(context).colorScheme.secondary
                  : Colors.white,
              icon: const Icon(Icons.favorite),
              onPressed: () {
                product.toggleFavoriteStatue();
                ;
              },
            ),
          ),
          trailing: IconButton(
            color: Theme.of(context).colorScheme.secondary,
            icon: const Icon(Icons.shopping_bag),
            onPressed: () {},
          ),
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.black87,
        ),
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context)
              .pushNamed(ProductDetailScreen.routeName, arguments: product.id);
        },
        child: Image.network(
          product.imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
