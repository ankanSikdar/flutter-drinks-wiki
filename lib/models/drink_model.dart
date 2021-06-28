import 'dart:convert';

import 'package:flutter/foundation.dart';

class Drink {
  final String id;
  final String name;
  final String category;
  final String alcoholic;
  final String glass;
  final String instructions;
  final String imageUrl;
  final List<String> ingridients;
  final List<String> measures;
  Drink({
    @required this.id,
    @required this.name,
    @required this.category,
    @required this.alcoholic,
    @required this.glass,
    @required this.instructions,
    @required this.imageUrl,
    @required this.ingridients,
    @required this.measures,
  });

  Drink copyWith({
    String id,
    String name,
    String category,
    String alcoholic,
    String glass,
    String instructions,
    String imageUrl,
    List<String> ingridients,
    List<String> measures,
  }) {
    return Drink(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      alcoholic: alcoholic ?? this.alcoholic,
      glass: glass ?? this.glass,
      instructions: instructions ?? this.instructions,
      imageUrl: imageUrl ?? this.imageUrl,
      ingridients: ingridients ?? this.ingridients,
      measures: measures ?? this.measures,
    );
  }

  factory Drink.fromMap(Map<String, dynamic> map) {
    List<String> ingridientsList = [];
    List<String> measureList = [];
    loop:
    for (var i = 1; i <= 15; i++) {
      if (map['strIngredient$i'] != null || map['strMeasure$i'] != null) {
        ingridientsList.add(map['strIngredient$i']);
        measureList.add(map['strMeasure$i']);
      } else {
        break loop;
      }
    }
    return Drink(
      id: map['idDrink'],
      name: map['strDrink'],
      category: map['strCategory'],
      alcoholic: map['strAlcoholic'],
      glass: map['strGlass'],
      instructions: map['strInstructions'],
      imageUrl: map['strDrinkThumb'],
      ingridients: ingridientsList,
      measures: measureList,
    );
  }

  factory Drink.fromJson(String source) => Drink.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Drink(id: $id, name: $name, category: $category, alcoholic: $alcoholic, glass: $glass, instructions: $instructions, imageUrl: $imageUrl, ingridients: $ingridients, measures: $measures)';
  }
}
