import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_final/auth/bloc/bloc/auth_bloc.dart';
import 'package:proyecto_final/shared/widgets/red_nav.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const RedAppBar(),
        backgroundColor: Colors.red,
        body: // Login button from google
            Center(
                child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Put here the app logo
            const SizedBox(
              height: 200,
              width: 200,
              child: Image(
                image: AssetImage('assets/images/app_logo.png'),
                fit: BoxFit.contain,
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red[800],
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                fixedSize: const Size(270, 80),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                BlocProvider.of<AuthBloc>(context).add(GoogleAuthEvent());
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Sign in/up with',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w400),
                  ),
                  Image(
                    image: AssetImage('assets/images/google_logo.png'),
                    width: 60,
                    height: 80,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 100),
          ],
        )));
  }
}
