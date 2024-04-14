import 'package:flutter/material.dart';

class LandingAppBar extends StatelessWidget implements PreferredSizeWidget {
  const LandingAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart)),
        IconButton(
          icon: const Icon(Icons.more_vert),
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
