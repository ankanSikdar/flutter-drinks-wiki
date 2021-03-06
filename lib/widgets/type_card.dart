import 'package:drinks_wiki/models/category_names.dart';
import 'package:drinks_wiki/pages/drink_list_page.dart';
import 'package:drinks_wiki/widgets/category_card.dart';
import 'package:flutter/material.dart';

class TypeCard extends StatelessWidget {
  final String title;

  const TypeCard(
    this.title,
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                DrinkListPage(category: title, type: CategoryType.content),
          ),
        );
      },
      child: Container(
        alignment: Alignment.center,
        height: 70,
        width: MediaQuery.of(context).size.width / 2.5,
        margin: EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          gradient: RadialGradient(
            colors: [
              Colors.grey.shade900,
              Colors.black87,
            ],
            radius: 2.5,
          ),
        ),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}
