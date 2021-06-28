import 'package:drinks_wiki/widgets/category_grid_view.dart';
import 'package:drinks_wiki/widgets/glass_grid_view.dart';
import 'package:drinks_wiki/widgets/type_column_view.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(16.0, 32.0, 0.0, 32.0),
        child: ListView(
          children: [
            TitleWidget('Categories'),
            SizedBox(
              height: 400,
              child: CategoryGridView(),
            ),
            TitleWidget('Glass Type'),
            SizedBox(
              height: 400,
              child: GlassGridView(),
            ),
            TitleWidget('Alcohol Content'),
            TypeColumnView(),
          ],
        ),
      ),
    );
  }
}

class TitleWidget extends StatelessWidget {
  final String title;

  const TitleWidget(
    this.title,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomLeft,
      margin: EdgeInsets.fromLTRB(0.0, 36.0, 0, 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 42.0,
          color: Theme.of(context).accentColor,
        ),
      ),
    );
  }
}
