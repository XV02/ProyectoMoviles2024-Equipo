import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_final/bloc/shopping_cart/shopping_cart_bloc.dart';
import 'package:proyecto_final/pages/shopping_cart/shopping_cart_app_bar.dart';
import 'package:proyecto_final/pages/shopping_cart/shopping_cart_footer.dart';
import 'package:proyecto_final/pages/shopping_cart/shopping_cart_header.dart';
import 'package:proyecto_final/pages/shopping_cart/shopping_cart_list.dart';
import 'package:proyecto_final/shared/widgets/loading_page.dart';

class ShoppingCartPage extends StatefulWidget {
  const ShoppingCartPage({super.key});

  @override
  State<ShoppingCartPage> createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShoppingCartBloc, ShoppingCartState>(
        builder: (context, state) {
      if (state is ShoppingCartLoaded) {
        double total = 0;
        for (var item in state.shoppingCart) {
          total += 100 * int.parse(item['quantity']);
        }
        return ShoppingCartWidget(
            shoppingCart: state.shoppingCart, total: total);
      } else if (state is ShoppingCartRemoved) {
        double total = 0;
        for (var item in state.shoppingCart) {
          total += 100 * int.parse(item['quantity']);
        }
        return ShoppingCartWidget(
            shoppingCart: state.shoppingCart, total: total);
      } else if (state is ShoppingCartAdded) {
        double total = 0;
        for (var item in state.shoppingCart) {
          total += 100 * int.parse(item['quantity']);
        }
        return ShoppingCartWidget(
            shoppingCart: state.shoppingCart, total: total);
      }
      if (state is ShoppingCartError) {
        // Go back to landing page
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.pushNamedAndRemoveUntil(
              context, "/", (Route<dynamic> route) => false);
        });
      }
      return const LoadingPage();
    }, listener: (context, state) {
      if (state is ShoppingCartError) {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            const SnackBar(
              content: Text(
                "There was an error",
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.black,
            ),
          );
      }
      if (state is ShoppingCartRemoved) {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            const SnackBar(
              content: Text(
                "Removed from shopping cart",
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.black,
            ),
          );
        // Refresh the page
        context.read<ShoppingCartBloc>().add(LoadShoppingCart());
      }
      if (state is ShoppingCartAdded) {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            const SnackBar(
              content: Text(
                "Added to shopping cart",
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.black,
            ),
          );
        // Refresh the page
        context.read<ShoppingCartBloc>().add(LoadShoppingCart());
      }
    });
  }
}

class ShoppingCartWidget extends StatelessWidget {
  final List shoppingCart;
  final double total;

  const ShoppingCartWidget({
    super.key,
    required this.shoppingCart,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ShoppingCartAppBar(),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.red,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ShoppingCartHeader(),
            ShoppingCartList(shoppingCart: shoppingCart),
            ShoppingCartFooter(total: total),
          ],
        ),
      ),
    );
  }
}
