import 'package:drinks_wiki/widgets/category_card.dart';
import 'package:drinks_wiki/widgets/drinks_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:drinks_wiki/models/drink_list.dart';
import 'package:drinks_wiki/repositories/repositories.dart';

class DrinkListPage extends StatefulWidget {
  final String category;
  final CategoryType type;

  const DrinkListPage({
    Key key,
    @required this.category,
    @required this.type,
  }) : super(key: key);

  @override
  _DrinkListPageState createState() => _DrinkListPageState();
}

class _DrinkListPageState extends State<DrinkListPage> {
  Future<List<DrinkList>> drinkListFuture;

  @override
  void initState() {
    super.initState();
    drinkListFuture = getDrinksList(name: widget.category, type: widget.type);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: drinkListFuture,
      builder: (BuildContext context, AsyncSnapshot<List<DrinkList>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back_ios_rounded),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  title: Text(widget.category),
                  centerTitle: true,
                  snap: true,
                  floating: true,
                ),
                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                  sliver: DrinksGridView(snapshot),
                ),
              ],
            );
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
