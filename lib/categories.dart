import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Categories extends StatefulWidget {
  const Categories({Key key}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  Future<void> getCategories() async {
    final response = await http.get(Uri.parse(
        'https://www.thecocktaildb.com/api/json/v1/1/list.php?c=list'));
    final jsonData = jsonDecode(response.body);
    print(jsonData['drinks'][0]);
  }

  @override
  Widget build(BuildContext context) {
    getCategories();
    return Container();
  }
}
