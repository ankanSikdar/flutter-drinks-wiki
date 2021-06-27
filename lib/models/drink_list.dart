import 'dart:convert';
import 'package:meta/meta.dart';

class DrinkList {
  final String id;
  final String name;
  final String imageUrl;
  DrinkList({
    @required this.id,
    @required this.name,
    @required this.imageUrl,
  });

  factory DrinkList.fromMap(Map<String, dynamic> map) {
    return DrinkList(
      id: map['idDrink'],
      name: map['strDrink'],
      imageUrl: map['strDrinkThumb'],
    );
  }

  factory DrinkList.fromJson(String source) =>
      DrinkList.fromMap(json.decode(source));
}
