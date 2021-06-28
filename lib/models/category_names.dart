import 'package:drinks_wiki/widgets/category_card.dart';

class Category {
  static const String ordinaryDrink = "Ordinary Drink";
  static const String cocktail = "Cocktail";
  static const String milkFloatShake = "Milk / Float / Shake";
  static const String other = "Other/Unknown";
  static const String cocoa = "Cocoa";
  static const String shot = "Shot";
  static const String teaCoffee = "Coffee / Tea";
  static const String homemade = "Homemade Liqueur";
  static const String punchParty = "Punch / Party Drink";
  static const String beer = "Beer";
  static const String softDrink = "Soft Drink / Soda";
}

List<CategoryCard> categories = [
  CategoryCard(
    title: Category.cocktail,
    type: CategoryType.cocktails,
    imageUrl:
        'https://www.thecocktaildb.com/images/media/drink/wwpyvr1461919316.jpg',
  ),
  CategoryCard(
    title: Category.homemade,
    type: CategoryType.cocktails,
    imageUrl:
        'https://www.thecocktaildb.com/images/media/drink/qtspsx1472667392.jpg',
  ),
  CategoryCard(
    title: Category.beer,
    type: CategoryType.cocktails,
    imageUrl:
        'https://www.thecocktaildb.com/images/media/drink/xxyywq1454511117.jpg',
  ),
  CategoryCard(
    title: Category.milkFloatShake,
    type: CategoryType.cocktails,
    imageUrl:
        'https://www.thecocktaildb.com/images/media/drink/uppqty1472720165.jpg',
  ),
  CategoryCard(
    title: Category.ordinaryDrink,
    type: CategoryType.cocktails,
    imageUrl:
        'https://www.thecocktaildb.com/images/media/drink/xrvruq1472812030.jpg',
  ),
  CategoryCard(
    title: Category.punchParty,
    type: CategoryType.cocktails,
    imageUrl:
        'https://www.thecocktaildb.com/images/media/drink/tpxurs1454513016.jpg',
  ),
  CategoryCard(
    title: Category.shot,
    type: CategoryType.cocktails,
    imageUrl:
        'https://www.thecocktaildb.com/images/media/drink/dbtylp1493067262.jpg',
  ),
  CategoryCard(
    title: Category.softDrink,
    type: CategoryType.cocktails,
    imageUrl:
        'https://www.thecocktaildb.com/images/media/drink/uyrvut1479473214.jpg',
  ),
  CategoryCard(
    title: Category.teaCoffee,
    type: CategoryType.cocktails,
    imageUrl:
        'https://www.thecocktaildb.com/images/media/drink/wrvpuu1472667898.jpg',
  ),
  CategoryCard(
    title: Category.other,
    type: CategoryType.cocktails,
    imageUrl:
        'https://www.thecocktaildb.com/images/media/drink/jogv4w1487603571.jpg',
  ),
];
