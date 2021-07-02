import 'package:drinks_wiki/models/drink_list.dart';
import 'package:drinks_wiki/widgets/drinks_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:drinks_wiki/repositories/repositories.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _controller = TextEditingController();

  bool isSearching = false;
  List<DrinkList> drinkList = [];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          centerTitle: true,
          floating: true,
          title: TextField(
            controller: _controller,
            decoration: InputDecoration(
              hintText: 'Enter Drink Name',
              border: InputBorder.none,
            ),
            keyboardType: TextInputType.name,
            textAlign: TextAlign.center,
          ),
          actions: [
            isSearching
                ? Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                    child: CircularProgressIndicator(
                      strokeWidth: 1.0,
                    ),
                  )
                : IconButton(
                    icon: Icon(Icons.search_sharp),
                    onPressed: () async {
                      if (isSearching)
                        return;
                      else
                        setState(() {
                          isSearching = true;
                        });
                      final name = _controller.text;
                      drinkList = await getSearchedDrinksList(name: name);
                      setState(() {
                        isSearching = false;
                      });
                    },
                  ),
          ],
        ),
        SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            sliver: DrinksGridView(drinkList)),
      ],
    );
  }
}
