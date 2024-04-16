import 'package:flutter/material.dart';

class RedAppBar extends StatelessWidget implements PreferredSizeWidget {
  const RedAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.red,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
