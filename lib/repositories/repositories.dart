import 'package:drinks_wiki/models/drink_list.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<DrinkList>> getDrinksList(String name) async {
  final response = await http.get(Uri.parse(
      'https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=$name'));
  final jsonData = jsonDecode(response.body)['drinks'] as List;
  final List<DrinkList> drinksList = [];
  jsonData.forEach((drink) {
    drinksList.add(DrinkList.fromMap(drink));
  });
  return drinksList;
}
