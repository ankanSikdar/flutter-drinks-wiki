import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class DrinkList extends Equatable {
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

  @override
  String toString() => 'DrinkList(id: $id, name: $name, imageUrl: $imageUrl)';

  @override
  List<Object> get props => [id, name, imageUrl];

  DrinkList copyWith({
    String id,
    String name,
    String imageUrl,
  }) {
    return DrinkList(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}
