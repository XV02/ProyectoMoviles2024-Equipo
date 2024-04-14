import 'package:flutter/material.dart';
import 'package:proyecto_final/pages/details_page/details_app_bar.dart';
import 'package:proyecto_final/pages/details_page/details_footer.dart';
import 'package:proyecto_final/pages/details_page/details_header.dart';
import 'package:proyecto_final/pages/details_page/details_list.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DetailsAppBar(),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.red,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DetailsHeader(),
            DetailsList(),
            DetailsFooter(),
          ],
        ),
      ),
    );
  }
}
