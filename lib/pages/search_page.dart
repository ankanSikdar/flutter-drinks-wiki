import 'package:drinks_wiki/models/drink_list.dart';
import 'package:drinks_wiki/widgets/drinks_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:drinks_wiki/repositories/repositories.dart';
import 'package:flutter/rendering.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _controller = TextEditingController();

  bool isSearching = false;
  List<DrinkList> drinkList = [];

  Future<void> _formSubmit() async {
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

    // For dismissing the keyboard
    // Will only unfocus if keyboard is open
    if (FocusScope.of(context).isFirstFocus) {
      FocusScope.of(context).requestFocus(new FocusNode());
    }
  }

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
              hintStyle: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            style: TextStyle(fontSize: 18.0),
            textInputAction: TextInputAction.search,
            textAlign: TextAlign.center,
            onSubmitted: (value) {
              _formSubmit();
            },
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
                      _formSubmit();
                    },
                  ),
          ],
        ),
        drinkList.length == 0
            ? SliverToBoxAdapter(
                child: Container(
                  margin: EdgeInsets.only(
                    top: (MediaQuery.of(context).size.height / 3),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'No Results Found',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
              )
            : SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                sliver: DrinksGridView(drinkList)),
      ],
    );
  }
}
