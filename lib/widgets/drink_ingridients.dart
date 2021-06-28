import 'package:drinks_wiki/models/drink_model.dart';
import 'package:flutter/material.dart';

class DrinkIngridients extends StatefulWidget {
  const DrinkIngridients({
    Key key,
    @required this.drink,
  }) : super(key: key);

  final Drink drink;

  @override
  _DrinkIngridientsState createState() => _DrinkIngridientsState();
}

class _DrinkIngridientsState extends State<DrinkIngridients> {
  List<Widget> getDrinks() {
    final list = <Widget>[];
    for (var i = 0; i < widget.drink.ingridients.length; i++) {
      list.add(
        Ingridient(
          ingridient: widget.drink.ingridients[i] ?? '',
          measure: widget.drink.measures[i] ?? '',
        ),
      );
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      sliver: SliverToBoxAdapter(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ingridients: ',
                style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontSize: 20.0,
                ),
              ),
              SizedBox(height: 4.0),
              ...getDrinks(),
            ],
          ),
        ),
      ),
    );
  }
}

class Ingridient extends StatelessWidget {
  const Ingridient({
    Key key,
    @required this.measure,
    @required this.ingridient,
  }) : super(key: key);

  final String ingridient;
  final String measure;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            ingridient,
            style: TextStyle(fontSize: 18.0),
          ),
          Text(
            measure,
            style: TextStyle(fontSize: 18.0),
          ),
        ],
      ),
    );
  }
}
