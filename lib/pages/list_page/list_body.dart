import 'package:flutter/material.dart';

class ListPageBody extends StatefulWidget {
  final List<String> mangaList;

  const ListPageBody({
    super.key,
    this.mangaList = const [
      'Naruto',
      'One Piece',
      'Dragon Ball',
      'Attack on Titan',
      'Death Note',
      'Demon Slayer',
      'My Hero Academia',
      'Tokyo Ghoul',
      'Fullmetal Alchemist',
      'One Punch Man',
    ],
  });

  @override
  State<ListPageBody> createState() => _ListPageBodyState(mangaList: mangaList);
}

class _ListPageBodyState extends State<ListPageBody> {
  final List<String> mangaList;

  _ListPageBodyState({required this.mangaList});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .76,
      width: double.infinity,
      color: Colors.white,
      child: ListView.builder(
        itemCount: mangaList.length,
        itemBuilder: (BuildContext context, int index) {
          Color bgColor =
              index % 2 != 0 ? Colors.red : Color.fromARGB(255, 243, 52, 38);
          return Container(
            height: 80,
            width: double.infinity,
            decoration: BoxDecoration(color: bgColor),
            child: ListTile(
              leading: Icon(
                Icons.camera_alt_outlined,
                color: Colors.white,
                size: 50,
              ),
              title: Text(
                '${mangaList[index]}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          );
        },
      ), // This Listview is going to change in the future to the Firestore one
    );
  }
}
