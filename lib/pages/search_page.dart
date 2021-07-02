import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          centerTitle: true,
          title: TextField(
            controller: _controller,
            decoration: InputDecoration(
              hintText: 'Enter Drink Name',
              border: InputBorder.none,
            ),
          ),
          actions: [
            IconButton(
                icon: Icon(Icons.search_sharp),
                onPressed: () {
                  print(_controller.text);
                }),
          ],
        )
      ],
    );
  }
}
