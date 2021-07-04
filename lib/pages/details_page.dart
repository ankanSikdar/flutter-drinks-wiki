import 'package:drinks_wiki/models/drink_model.dart';
import 'package:drinks_wiki/repositories/repositories.dart';
import 'package:drinks_wiki/widgets/drink_details.dart';
import 'package:drinks_wiki/widgets/drink_image.dart';
import 'package:drinks_wiki/widgets/drink_ingridients.dart';
import 'package:drinks_wiki/widgets/drink_instructions.dart';
import 'package:drinks_wiki/widgets/error_text.dart';
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
            if (snapshot.hasError) {
              return ErrorText(snapshot.error);
            }
            if (snapshot.hasData) {
              final drink = snapshot.data;
              return CustomScrollView(
                slivers: [
                  SliverAppBar(
                    leading: IconButton(
                      icon: Icon(Icons.arrow_back_ios_rounded),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    title: Text('Details'),
                    centerTitle: true,
                  ),
                  DrinkImage(drink: drink),
                  DrinkDetails(drink: drink),
                  DrinkIngridients(drink: drink),
                  DrinkInstructions(drink: drink),
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
