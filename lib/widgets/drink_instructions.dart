import 'package:drinks_wiki/models/drink_model.dart';
import 'package:flutter/material.dart';

class DrinkInstructions extends StatelessWidget {
  const DrinkInstructions({
    Key key,
    @required this.drink,
  }) : super(key: key);

  final Drink drink;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      sliver: SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Instructions: ',
              style: TextStyle(
                color: Theme.of(context).accentColor,
                fontSize: 20.0,
              ),
            ),
            SizedBox(height: 4.0),
            Text(
              drink.instructions,
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }
}
