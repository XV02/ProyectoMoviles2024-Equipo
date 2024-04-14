import 'package:flutter/material.dart';

class SearcherContainer extends StatelessWidget {
  const SearcherContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Hello, User!',
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.red,
                    fontWeight: FontWeight.w300),
              ),
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Find Manga near to you',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w400,
                  color: Colors.red,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: // PAdding of 20 in top and bottom
                    const EdgeInsets.symmetric(vertical: 20),
                child: TextField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Colors.red,
                      ),
                    ),
                    hintText: 'Search a title',
                    suffixIcon: const Icon(
                      Icons.search,
                      color: Colors.red,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
