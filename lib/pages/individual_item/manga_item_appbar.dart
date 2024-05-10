import 'package:flutter/material.dart';

class MangaItemAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MangaItemAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          // Push named to base route
          Navigator.pushNamed(context, '/');
        },
        icon: Icon(Icons.arrow_back_ios_outlined),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.more_vert),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
