import 'package:drinks_wiki/models/drink_list.dart';
import 'package:drinks_wiki/widgets/drink_card.dart';
import 'package:flutter/material.dart';

class DrinksGridView extends StatelessWidget {
  final List<DrinkList> drinkList;

  const DrinksGridView(this.drinkList);

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    return SliverGrid(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        final drink = drinkList[index];
        return DrinkCard(
          key: ValueKey(drink.id),
          id: drink.id,
          title: drink.name,
          imageUrl: drink.imageUrl,
        );
      }, childCount: drinkList.length),
      // padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: deviceHeight < 600 ? 0.60 : 0.65,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
      ),
    );
  }
}
