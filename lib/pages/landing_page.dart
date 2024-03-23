import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LandingAppBar(),
      body: Container(
        // Make the container take the full screen and red background
        color: Colors.red,
      ),
    );
  }
}

class LandingAppBar extends StatelessWidget implements PreferredSizeWidget {
  const LandingAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Home Page'),
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart)),
        IconButton(
          //The icon should be three dots
          icon: const Icon(Icons.more_vert),
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
