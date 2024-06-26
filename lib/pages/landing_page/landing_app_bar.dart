import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_final/auth/bloc/bloc/auth_bloc.dart';

class LandingAppBar extends StatelessWidget implements PreferredSizeWidget {
  const LandingAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/shopping-cart');
          },
          icon: const Icon(Icons.shopping_cart),
        ),
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/favorites-page');
          },
          icon: const Icon(Icons.favorite),
        ),
        PopupMenuButton(
          itemBuilder: (BuildContext context) {
            return _buildPopupMenuItems(context);
          },
        ),
      ],
    );
  }

  // I want to turn the return of the PopupMenuButton into a list of PopupMenuItems in a function
  List<PopupMenuEntry<int>> _buildPopupMenuItems(BuildContext context) {
    return [
      const PopupMenuItem(
        value: 0,
        child: Text('Profile'),
      ),
 
      PopupMenuItem(
        value: 1,
        child: const Text('Log out'),
        onTap: () {
          BlocProvider.of<AuthBloc>(context).add(SignOutEvent());
        },
      ),
      PopupMenuItem(
        value: 2,
        child: const Text('QR Scanner' ),
        onTap: () {
          Navigator.pushNamed(context, '/QR-Scanner');

        },
      ),
    ];
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
