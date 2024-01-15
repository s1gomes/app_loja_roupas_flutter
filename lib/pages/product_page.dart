import 'package:flutter/material.dart';
import 'package:proj_roupas/components/appDrawer_components.dart';
import 'package:proj_roupas/components/product_item_component.dart';
import 'package:proj_roupas/models/product_list_model.dart';
import 'package:proj_roupas/utils/app_routes.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductList products = Provider.of(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Gerenciador de produtos'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.PRODUCT_FORM);
              },
              icon: Icon(Icons.add),
            )
          ],
        ),
        drawer: AppDrawer(),
        body: Padding(
            padding: EdgeInsets.all(8),
            child: ListView.builder(
                itemCount: products.itemsCount,
                itemBuilder: (ctx, i) => Column(
                      children: [
                        ProductItem(products.items[i]),
                        Divider(),
                      ],
                    ))));
  }
}
