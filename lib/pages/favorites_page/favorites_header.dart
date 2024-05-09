import 'package:flutter/material.dart';

class FavoritesHeader extends StatelessWidget {
  const FavoritesHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      height: MediaQuery.of(context).size.height * .25,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Favorites',
            style: TextStyle(
              color: Colors.red,
              fontSize: 38,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
