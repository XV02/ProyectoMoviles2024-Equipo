import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

// List of tuples containing the category name and the number of items in that category
final List<Tuple2<String, String>> mangas = [
  const Tuple2('One Piece', '5'),
  const Tuple2('Gurren Lagann', '4.5'),
];

class MostPopularContainer extends StatelessWidget {
  const MostPopularContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(children: [
      Column(
        children: [
          MostPopularTitleText(),
          MostPopularCards(),
        ],
      )
    ]);
  }
}

class MostPopularTitleText extends StatelessWidget {
  const MostPopularTitleText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'Most Popular Mangas',
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

class MostPopularCards extends StatelessWidget {
  const MostPopularCards({
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
          children: generateCards(mangas),
        ),
      ),
    );
  }
}

List<Widget> generateCards(List<Tuple2<String, String>> mangas) {
  return mangas.map((category) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MostPopularImage(),
        MostPopularTitle(title: category.item1),
        MostPopularGrade(grade: category.item2),
      ],
    );
  }).toList();
}

class MostPopularImage extends StatelessWidget {
  const MostPopularImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 10),
        alignment: Alignment.center,
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Icon(
          Icons.camera_alt_outlined,
          size: 70,
          color: Colors.red,
        ));
  }
}

class MostPopularTitle extends StatelessWidget {
  final String title;

  const MostPopularTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
    );
  }
}

class MostPopularGrade extends StatelessWidget {
  final String grade;

  const MostPopularGrade({
    super.key,
    required this.grade,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.star,
          color: Colors.yellow,
          size: 18,
        ),
        const SizedBox(width: 5),
        Text(
          grade,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
