import 'package:flutter/material.dart';
import 'package:proyecto_final/pages/list_page/list_header.dart';
import 'package:proyecto_final/pages/list_page/list_body.dart';
import 'package:proyecto_final/shared/widgets/red_nav.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RedAppBar(),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.red,
        child: Column(
          children: [
            ListHeader(),
            ListPageBody(),
          ],
        ),
      ),
    );
  }
}
