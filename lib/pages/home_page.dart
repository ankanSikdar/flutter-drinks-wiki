import 'package:drinks_wiki/widgets/category_grid_view.dart';
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
            Container(
              alignment: Alignment.bottomLeft,
              margin: EdgeInsets.only(bottom: 8.0),
              child: Text(
                'Categories',
                style: TextStyle(fontSize: 42.0),
              ),
            ),
            SizedBox(
              height: 400,
              child: CategoryGridView(),
            ),
            Container(
              alignment: Alignment.bottomLeft,
              margin: EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 8.0),
              child: Text(
                'Glass Type',
                style: TextStyle(fontSize: 42.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
