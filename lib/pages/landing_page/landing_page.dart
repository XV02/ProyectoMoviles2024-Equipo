import 'package:flutter/material.dart';
import 'package:proyecto_final/pages/landing_page/categories_container.dart';
import 'package:proyecto_final/pages/landing_page/landing_app_bar.dart';
import 'package:proyecto_final/pages/landing_page/most_popular_container.dart';
import 'package:proyecto_final/pages/landing_page/searcher_container.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const LandingAppBar(),
      body: Container(
        color: Colors.red,
        // The container should occupy the entire screen
        width: double.infinity,
        height: double.infinity,
        child: const Column(
          children: [
            SearcherContainer(),
            CategoriesContainer(),
            Divider(
              color: Colors.white,
              thickness: 2,
            ),
            MostPopularContainer()
          ],
        ),
      ),
    );
  }
}
