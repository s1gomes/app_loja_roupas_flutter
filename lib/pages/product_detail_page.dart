import 'package:flutter/material.dart';
import 'package:proj_roupas/models/product_model.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Product product =
        ModalRoute.of(context)!.settings.arguments as Product;
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: SingleChildScrollView(
        child: 
          Column(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                child: Image.network(product.imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset("assets/images/product_image_not_available.png",
                fit: BoxFit.cover,);
                },),
              ),
              const SizedBox(height: 10), 
              Text('R\$ ${product.price}',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20
              )),
              SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
                child: Text(product.description,
                style: TextStyle(
                  fontSize: 17
                ),
                textAlign: TextAlign.center,),
              )


            ],
          )
      )
    );
  }
}
