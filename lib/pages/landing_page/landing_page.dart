import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_final/bloc/landing_page/landing_page_bloc.dart';
import 'package:proyecto_final/pages/details_page/details_page.dart';
import 'package:proyecto_final/pages/landing_page/categories_container.dart';
import 'package:proyecto_final/pages/landing_page/landing_app_bar.dart';
import 'package:proyecto_final/pages/landing_page/most_popular_container.dart';
import 'package:proyecto_final/pages/landing_page/searcher_container.dart';
import 'package:proyecto_final/shared/widgets/loading_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LandingPageBloc, LandingPageState>(
        builder: (context, state) {
      if (state is LandingPageInitial || state is LandingPageNotFound) {
        return LandingPageWidget();
      } else if (state is LandingPageFound) {
        // Go to details page
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.pushNamed(context, "/details",
              arguments: DetailsPageArguments(state.mangaId));
        });
      }
      return const LoadingPage();
    }, listener: (context, state) {
      if (state is LandingPageNotFound) {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            const SnackBar(
              content: Text(
                "Manga not found",
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.black,
            ),
          );
      }
    });
  }
}

class LandingPageWidget extends StatelessWidget {
  const LandingPageWidget({
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
