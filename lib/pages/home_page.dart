import 'package:drinks_wiki/models/category_names.dart';
import 'package:drinks_wiki/widgets/category_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(16.0, 32.0, 16.0, 32.0),
        child: CustomScrollView(
          slivers: [
            SliverGrid.count(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 1,
              children: [
                CategoryCard(
                  title: Category.cocktail,
                  imageUrl:
                      'https://www.thecocktaildb.com/images/media/drink/wwpyvr1461919316.jpg',
                ),
                CategoryCard(
                  title: Category.homemade,
                  imageUrl:
                      'https://www.thecocktaildb.com/images/media/drink/qtspsx1472667392.jpg',
                ),
                CategoryCard(
                  title: Category.beer,
                  imageUrl:
                      'https://www.thecocktaildb.com/images/media/drink/xxyywq1454511117.jpg',
                ),
                CategoryCard(
                  title: Category.milkFloatShake,
                  imageUrl:
                      'https://www.thecocktaildb.com/images/media/drink/uppqty1472720165.jpg',
                ),
                CategoryCard(
                  title: Category.ordinaryDrink,
                  imageUrl:
                      'https://www.thecocktaildb.com/images/media/drink/xrvruq1472812030.jpg',
                ),
                CategoryCard(
                  title: Category.punchParty,
                  imageUrl:
                      'https://www.thecocktaildb.com/images/media/drink/tpxurs1454513016.jpg',
                ),
                CategoryCard(
                  title: Category.shot,
                  imageUrl:
                      'https://www.thecocktaildb.com/images/media/drink/dbtylp1493067262.jpg',
                ),
                CategoryCard(
                  title: Category.softDrink,
                  imageUrl:
                      'https://www.thecocktaildb.com/images/media/drink/uyrvut1479473214.jpg',
                ),
                CategoryCard(
                  title: Category.teaCoffee,
                  imageUrl:
                      'https://www.thecocktaildb.com/images/media/drink/wrvpuu1472667898.jpg',
                ),
                CategoryCard(
                  title: Category.other,
                  imageUrl:
                      'https://www.thecocktaildb.com/images/media/drink/jogv4w1487603571.jpg',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
