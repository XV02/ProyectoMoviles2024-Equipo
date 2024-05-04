import 'package:flutter/material.dart';

class ListHeader extends StatelessWidget {
  const ListHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .1,
      width: double.infinity,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () => {},
            icon: Icon(Icons.search),
          ),
          Container(
            width: 280,
            height: 60,
            child: TextField(),
          ),
          PopupMenuButton(
            icon: const Icon(Icons.sort),
            itemBuilder: (BuildContext context) {
              return const [
                PopupMenuItem(child: Text("Alphabetical")),
                PopupMenuItem(child: Text("By Publication Date")),
                PopupMenuItem(child: Text("By Genre")),
                PopupMenuItem(child: Text("By Author")),
              ];
            },
          )
        ],
      ),
    );
  }
}
