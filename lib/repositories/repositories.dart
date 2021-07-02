import 'package:drinks_wiki/models/drink_list.dart';
import 'package:drinks_wiki/models/drink_model.dart';
import 'package:drinks_wiki/widgets/category_card.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:meta/meta.dart';

Future<List<DrinkList>> getDrinksList(
    {@required String name, @required CategoryType type}) async {
  var filter = '';
  switch (type) {
    case CategoryType.glasses:
      filter = 'g';
      break;
    case CategoryType.cocktails:
      filter = 'c';
      break;
    case CategoryType.content:
      filter = 'a';
      break;
  }

  final response = await http.get(Uri.parse(
      'https://www.thecocktaildb.com/api/json/v1/1/filter.php?$filter=$name'));
  final jsonData = jsonDecode(response.body)['drinks'] as List;
  final List<DrinkList> drinksList = [];
  jsonData.forEach((drink) {
    drinksList.add(DrinkList.fromMap(drink));
  });
  return drinksList;
}

Future<Drink> getDrinkDetails(String id) async {
  final response = await http.get(Uri.parse(
      'https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=$id'));
  final jsonData = jsonDecode(response.body)['drinks'][0];
  final drink = Drink.fromMap(jsonData);
  return drink;
}

Future<List<DrinkList>> getSearchedDrinksList({@required String name}) async {
  final response = await http.get(Uri.parse(
      'https://www.thecocktaildb.com/api/json/v1/1/search.php?s=$name'));
  final jsonData = jsonDecode(response.body)['drinks'] as List;
  final List<DrinkList> drinksList = [];
  jsonData.forEach((drink) {
    drinksList.add(DrinkList.fromMap(drink));
  });
  return drinksList;
}
