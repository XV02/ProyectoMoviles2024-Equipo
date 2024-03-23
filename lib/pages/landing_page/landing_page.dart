import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:proyecto_final/pages/landing_page/categories_container.dart';
import 'package:proyecto_final/pages/landing_page/landing_app_bar.dart';
import 'package:proyecto_final/pages/landing_page/searcher_container.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LandingAppBar(),
      body: Container(
        color: Colors.red,
        // The container should occupy the entire screen
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            SearcherContainer(),
            CategoriesContainer(),
            Divider(
              color: Colors.white,
              thickness: 2,
            )
          ],
        ),
      ),
    );
  }
}
