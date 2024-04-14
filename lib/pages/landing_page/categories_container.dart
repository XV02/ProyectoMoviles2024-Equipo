import 'package:flutter/material.dart';

// Temporary list of categories
final List<String> categories = [
  'Shonen',
  'Seinen',
  'Shojo',
  'One Shot',
];

class CategoriesContainer extends StatelessWidget {
  const CategoriesContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(children: [
      Column(
        children: [
          CategoriesTitleText(),
          CategoriesCards(),
        ],
      )
    ]);
  }
}

class CategoriesTitleText extends StatelessWidget {
  const CategoriesTitleText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'Categories',
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }
}

class CategoriesCards extends StatelessWidget {
  const CategoriesCards({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Align(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: generateCards(categories),
        ),
      ),
    );
  }
}

List<Widget> generateCards(List<String> categories) {
  return categories.map((category) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      alignment: Alignment.topCenter,
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        category,
        style: const TextStyle(
          color: Colors.red,
          fontSize: 16,
        ),
      ),
    );
  }).toList();
}
