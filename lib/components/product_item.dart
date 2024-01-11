import 'package:flutter/material.dart';
import 'package:proj_roupas/models/cart_model.dart';
import 'package:proj_roupas/models/product_model.dart';
import 'package:proj_roupas/utils/app_routes.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTile(
            footer: GridTileBar(
              backgroundColor: Colors.black54,
              leading: Consumer<Product>(
                builder: (ctx, product, _) => IconButton(
                  onPressed: () {
                    product.toggleFavorite();
                  },
                  icon: Icon(product.isFavorite
                      ? Icons.favorite
                      : Icons.favorite_border),
                  color: Theme.of(context).cardColor,
                ),
              ),
              title: Text(
                product.name,
                textAlign: TextAlign.center,
              ),
              trailing: IconButton(
                onPressed: () {
                  cart.addItem(product);
                },
                icon: const Icon(Icons.shopping_cart),
                color: Colors.amber,
              ),
            ),
            child: GestureDetector(
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return GridTile(
                      child: Image.asset(
                    "assets/images/product_image_not_available.png",
                    fit: BoxFit.cover,
                  ));
                },
              ),
              onTap: () {
                Navigator.of(context)
                    .pushNamed(AppRoutes.PRODUCT_DETAIL, arguments: product);
              },
            )),
      ),
    );
  }
}
