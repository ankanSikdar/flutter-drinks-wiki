import 'package:cached_network_image/cached_network_image.dart';
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
  List<Widget> getIngridientsList() {
    final list = <Widget>[];
    for (var i = 0; i < widget.drink.ingridients.length; i++) {
      String ingridient = widget.drink.ingridients[i] ?? '';
      String measure = widget.drink.measures[i] ?? '';
      if (measure.isEmpty) {
        measure = '1';
      }
      if (ingridient.isNotEmpty) {
        list.add(
          Ingridient(
            ingridient: ingridient,
            measure: measure,
          ),
        );
      }
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
                '${getIngridientsList().length} Ingridients: ',
                style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontSize: 20.0,
                ),
              ),
              SizedBox(height: 4.0),
              ...getIngridientsList(),
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
          Expanded(
            child: Text(
              '$measure $ingridient',
              style: TextStyle(fontSize: 18.0),
            ),
          ),
          Container(
            height: 150,
            width: 150,
            margin: EdgeInsets.symmetric(vertical: 8.0),
            child: CachedNetworkImage(
              imageUrl:
                  'https://www.thecocktaildb.com/images/ingredients/$ingridient-Medium.png',
              placeholder: (context, url) => Container(
                height: 150.0,
                width: 15.0,
                color: Theme.of(context).primaryColor,
              ),
              errorWidget: (context, url, error) {
                return Center(
                  child: Container(
                    height: 150.0,
                    width: 15.0,
                    color: Theme.of(context).primaryColor,
                    child: Center(child: Text('Failed to load image')),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
