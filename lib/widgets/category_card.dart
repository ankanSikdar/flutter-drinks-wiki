import 'package:cached_network_image/cached_network_image.dart';
import 'package:drinks_wiki/pages/category_page.dart';
import 'package:flutter/material.dart';

enum CategoryType { cocktails, glasses }

class CategoryCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final CategoryType type;

  const CategoryCard({
    Key key,
    @required this.title,
    @required this.imageUrl,
    this.type = CategoryType.glasses,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryPage(
              category: title,
              type: type,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.cover,
                height: 350,
                width: 350,
                placeholder: (_, __) => Container(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.black45,
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
