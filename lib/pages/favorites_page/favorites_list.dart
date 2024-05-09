import 'package:flutter/material.dart';

class FavoritesList extends StatelessWidget {
  final List<String> mangas;
  final List<String> author;
  final List<int> volumes;

  const FavoritesList(
      {super.key,
      this.mangas = const [
        'One Piece',
        'Berserk',
        'ChainsawMan',
        'Dragon Ball',
        'Bleach',
      ],
      this.author = const [
        'Eiichiro Oda',
        'Kentaro Miura',
        'Tatsuki Fujimoto',
        'Akira Toriyama',
        'Tite Kubo',
      ],
      this.volumes = const [
        108,
        41,
        16,
        42,
        74,
      ]});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .45,
      width: double.infinity,
      child: ListView.builder(
        itemCount: mangas.length,
        itemBuilder: (BuildContext context, int index) {
          Color bgColor =
              index % 2 != 0 ? Colors.red : Color.fromARGB(255, 243, 52, 38);
          return Container(
            height: 85,
            width: double.infinity,
            decoration: BoxDecoration(color: bgColor),
            child: ListTile(
              leading: Icon(
                Icons.image,
                color: Colors.white,
                size: 64,
              ),
              title: Text(
                '${mangas[index]}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              subtitle: Text(
                '${author[index]}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
              trailing: Container(
                margin: EdgeInsets.only(right: 20),
                width: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '# ${volumes[index]}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    Icon(
                      Icons.favorite,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
