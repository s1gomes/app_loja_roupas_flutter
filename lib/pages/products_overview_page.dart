import 'package:flutter/material.dart';
import 'package:proj_roupas/components/contador_items_carrinho.dart';
import 'package:proj_roupas/components/product_grid.dart';
import 'package:proj_roupas/models/cart_model.dart';
import 'package:proj_roupas/models/product_list_model.dart';
import 'package:proj_roupas/utils/app_routes.dart';
import 'package:provider/provider.dart';

enum FilterOptions { Favorite, All }

class ProductsOverviewPage extends StatefulWidget {
  const ProductsOverviewPage({super.key});

  @override
  State<ProductsOverviewPage> createState() => _ProductsOverviewPageState();
}

class _ProductsOverviewPageState extends State<ProductsOverviewPage> {
  bool _showFavoriteOnly = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Minha loja'),
          actions: [
            Consumer<Cart>(
              child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(AppRoutes.CART);

                  },
                  icon: const Icon(Icons.shopping_cart),
                ),
              builder: (ctx, cart, child) => ContadorItemsCarrinho(
                value: cart.itemsCount.toString(),
                child: child!,
              ),
            ),
            PopupMenuButton(
              // icon: const Icon(Icons.more_vert),
              itemBuilder: (_) => [
                const PopupMenuItem(
                  value: FilterOptions.Favorite,
                  child: Text('Somente favoritos'),
                ),
                const PopupMenuItem(
                  value: FilterOptions.All,
                  child: Text('Todos'),
                ),
              ],
              onSelected: (FilterOptions selectedValue) {
                setState(() {
                  if (selectedValue == FilterOptions.Favorite) {
                    _showFavoriteOnly = true;
                  } else {
                    _showFavoriteOnly = false;
                  }
                });
              },
            ),
          ],
        ),
        body: ProductGrid(
          showFavoriteOnly: _showFavoriteOnly,
        ));
  }
}
