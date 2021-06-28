import 'package:drinks_wiki/models/drink_model.dart';
import 'package:flutter/material.dart';

class DrinkDetails extends StatelessWidget {
  const DrinkDetails({
    Key key,
    @required this.drink,
  }) : super(key: key);

  final Drink drink;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 32.0),
      sliver: SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DetailText(text: drink.category),
                DetailText(text: drink.alcoholic),
              ],
            ),
            DetailText(text: drink.glass),
          ],
        ),
      ),
    );
  }
}

class DetailText extends StatelessWidget {
  const DetailText({
    Key key,
    @required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 50,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      width: (MediaQuery.of(context).size.width - 90) / 2,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Theme.of(context).accentColor,
          fontSize: 16.0,
        ),
        maxLines: 1,
        overflow: TextOverflow.clip,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
