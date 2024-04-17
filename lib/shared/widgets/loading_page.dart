import 'package:flutter/material.dart';
import 'package:proyecto_final/shared/widgets/red_nav.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: RedAppBar(),
        backgroundColor: Colors.red,
        body: // Login button from google
            Center(
                child: Column(
          children: [
            SizedBox(
              height: 150,
            ),
            SizedBox(
              height: 200,
              width: 200,
              child: Image(
                image: AssetImage('assets/images/app_logo.png'),
                fit: BoxFit.contain,
              ),
            ),
            CircularProgressIndicator(
              color: Colors.white,
            ),
          ],
        )));
  }
}
