import 'package:drinks_wiki/models/glass_type.dart';
import 'package:flutter/material.dart';

class GlassGridView extends StatelessWidget {
  const GlassGridView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      scrollDirection: Axis.horizontal,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) {
        return glassCategories[index];
      },
      itemCount: glassCategories.length,
    );
  }
}
