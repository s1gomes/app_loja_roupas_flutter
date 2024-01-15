import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:proj_roupas/models/cart_model.dart';
import 'package:proj_roupas/models/order_list_model.dart';
import 'package:proj_roupas/models/product_list_model.dart';
import 'package:proj_roupas/models/product_model.dart';
import 'package:proj_roupas/pages/cart_page.dart';
import 'package:proj_roupas/pages/counter_page.dart';
import 'package:proj_roupas/pages/orders_page.dart';
import 'package:proj_roupas/pages/product_detail_page.dart';
import 'package:proj_roupas/pages/product_form_page.dart';
import 'package:proj_roupas/pages/product_page.dart';
import 'package:proj_roupas/pages/products_overview_page.dart';
import 'package:proj_roupas/utils/app_routes.dart';
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  static MaterialColor green =
      const MaterialColor(_greenPrimaryValue, <int, Color>{
    50: Color(0xFF4CAF50),
    100: Color(0xFF43A047),
    200: Color(0xFF388E3C),
    300: Color(_greenPrimaryValue),
    500: Color(0xFF1B5E20),
    600: Color(0xFF2196F3),
    700: Color(0xFF1E88E5),
    800: Color(0xFF1976D2),
    900: Color(0xFF1565C0),
  });
  static const int _greenPrimaryValue = 0xFF2E7D32;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (_) => ProductList(),
        ),
        ChangeNotifierProvider(
          create: (_) => OrderList(),
        ),


      ],
      child: MaterialApp(
        // home: ProductsOverviewPage(),
        debugShowCheckedModeBanner: false,
        title: 'Roupas',
        theme: ThemeData(
            primarySwatch: MyApp.green,
            cardColor: Colors.red,
            colorScheme: ColorScheme(
              brightness: Brightness.light,
              primary: MyApp.green,
              onPrimary: const Color.fromARGB(255, 3, 3, 3),
              secondary: Colors.purple,
              onSecondary: Color.fromARGB(255, 104, 100, 100),
              error: Colors.red,
              onError: Colors.red,
              background: const Color.fromRGBO(255, 254, 229, 1),
              onBackground: const Color.fromRGBO(255, 254, 229, 1),
              surface: const Color.fromRGBO(255, 254, 229, 1),
              onSurface: const Color.fromRGBO(255, 254, 229, 1),
            ),
            // fontFamily: 'Lato',
            canvasColor: const Color.fromRGBO(255, 254, 229, 1),
            textTheme: ThemeData.light().textTheme.copyWith(
                titleSmall: const TextStyle(fontSize: 20, fontFamily: 'Lato'))),
        routes: {
          AppRoutes.HOME: (ctx) => ProductsOverviewPage(),
          AppRoutes.PRODUCT_DETAIL: (ctx) => ProductDetailPage(),
          AppRoutes.CART: (ctx) => CartPage(),
          AppRoutes.ORDERS: (ctx) => OrdersPage(),
          AppRoutes.PRODUCTS: (ctx) => ProductPage(),
          AppRoutes.PRODUCT_FORM: (ctx) => ProductFormPage(),
        },
      ),
    );
  }
}
