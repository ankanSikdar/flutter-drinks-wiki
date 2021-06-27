import 'package:drinks_wiki/models/drink_list.dart';
import 'package:drinks_wiki/widgets/drink_card.dart';
import 'package:flutter/material.dart';

class DrinksGridView extends StatelessWidget {
  final AsyncSnapshot<List<DrinkList>> snapshot;

  const DrinksGridView(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        final drink = snapshot.data[index];
        return DrinkCard(
          key: ValueKey(drink.id),
          id: drink.id,
          title: drink.name,
          imageUrl: drink.imageUrl,
        );
      }, childCount: snapshot.data.length),
      // padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.76,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 7.0,
      ),
    );
  }
}
