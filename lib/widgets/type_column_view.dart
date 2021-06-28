import 'package:drinks_wiki/widgets/type_card.dart';
import 'package:flutter/material.dart';

class TypeColumnView extends StatelessWidget {
  const TypeColumnView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TypeCard('Alcoholic'),
            TypeCard('Non Alcoholic'),
          ],
        ),
        TypeCard('Optional Alcohol'),
      ],
    );
  }
}
