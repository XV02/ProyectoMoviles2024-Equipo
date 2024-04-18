import 'package:flutter/material.dart';

class LogoImage extends StatelessWidget {
  const LogoImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 200,
      width: 200,
      child: Image(
        image: AssetImage('assets/images/app_logo.png'),
        fit: BoxFit.contain,
      ),
    );
  }
}
