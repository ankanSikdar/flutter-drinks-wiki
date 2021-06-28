import 'package:cached_network_image/cached_network_image.dart';
import 'package:drinks_wiki/pages/details_page.dart';
import 'package:flutter/material.dart';

class DrinkCard extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  const DrinkCard({
    Key key,
    @required this.id,
    @required this.title,
    @required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(15.0);
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsPage(id: id),
          ),
        );
      },
      child: Column(
        children: [
          ClipRRect(
            borderRadius: borderRadius,
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.cover,
              placeholder: (_, __) => Container(
                height: MediaQuery.of(context).size.height / 4,
                width: double.infinity,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            title,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}
