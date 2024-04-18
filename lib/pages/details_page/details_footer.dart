import 'package:flutter/material.dart';

class DetailsFooter extends StatelessWidget {
  const DetailsFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .060,
      width: double.infinity,
    );
  }
}
