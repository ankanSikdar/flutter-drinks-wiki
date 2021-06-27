import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  final String category;

  const CategoryPage({
    Key key,
    @required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
    );
  }
}
