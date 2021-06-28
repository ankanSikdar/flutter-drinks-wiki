import 'package:drinks_wiki/models/drink_model.dart';
import 'package:drinks_wiki/repositories/repositories.dart';
import 'package:drinks_wiki/widgets/drink_details.dart';
import 'package:drinks_wiki/widgets/drink_image.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  final String id;

  const DetailsPage({
    Key key,
    @required this.id,
  }) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  Future<Drink> drinkFuture;

  @override
  void initState() {
    super.initState();
    drinkFuture = getDrinkDetails(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: drinkFuture,
        builder: (BuildContext context, AsyncSnapshot<Drink> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              final drink = snapshot.data;
              return CustomScrollView(
                slivers: [
                  DrinkImage(drink: drink),
                  DrinkDetails(drink: drink),
                ],
              );
            }
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
