import 'package:drinks_wiki/models/drink_list.dart';
import 'package:drinks_wiki/repositories/repositories.dart';
import 'package:drinks_wiki/widgets/drink_card.dart';
import 'package:flutter/material.dart';

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
                return GridView.builder(
                  padding:
                      EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.76,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 7.0,
                  ),
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    final drink = snapshot.data[index];
                    return DrinkCard(
                      key: ValueKey(drink.id),
                      id: drink.id,
                      title: drink.name,
                      imageUrl: drink.imageUrl,
                    );
                  },
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
