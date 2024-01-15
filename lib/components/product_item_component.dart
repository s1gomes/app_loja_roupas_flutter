import 'package:flutter/material.dart';
import 'package:proj_roupas/models/product_model.dart';

class ProductItem extends StatelessWidget {
  const ProductItem(
    this.product, {
    super.key,
  });
  final Product product;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(product.imageUrl),
        onBackgroundImageError: (exception, stackTrace) {
          Image.asset(
            "assets/images/product_image_not_available.png",
            fit: BoxFit.cover,
          );
        },
      ),
      title: Text(product.name),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(
              onPressed: () {},
              color: Theme.of(context).primaryColor,
              icon: Icon(Icons.edit),
            ),
            IconButton(
              onPressed: () {},
              color: Theme.of(context).colorScheme.error,
              icon: Icon(Icons.delete),
            )
          ],
        ),
      ),
    );
  }
}
