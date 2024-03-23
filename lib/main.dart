import 'package:flutter/material.dart';
import 'package:proyecto_final/pages/shopping_cart/shopping_cart_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: '/',
      routes: Map<String, WidgetBuilder>.from({
        '/': (context) => const ShoppingCartPage(),
      }),
      theme: ThemeData(
        useMaterial3: false,
        primaryColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.red,
          brightness: Brightness.light,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.red,
          shadowColor: Colors.transparent,
        ),
      ),
    );
  }
}
