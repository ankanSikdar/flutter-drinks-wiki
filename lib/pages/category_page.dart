import 'package:drinks_wiki/widgets/drinks_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:drinks_wiki/models/drink_list.dart';
import 'package:drinks_wiki/repositories/repositories.dart';

class CategoryPage extends StatefulWidget {
  final String category;

  const CategoryPage({
    Key key,
    @required this.category,
  }) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  Future<List<DrinkList>> drinkListFuture;

  @override
  void initState() {
    super.initState();
    drinkListFuture = getDrinksList(widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.category),
        ),
        body: FutureBuilder(
          future: drinkListFuture,
          builder:
              (BuildContext context, AsyncSnapshot<List<DrinkList>> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return DrinksGridView(snapshot);
              } else {
                return Center(
                  child: Text('No Data'),
                );
              }
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}
