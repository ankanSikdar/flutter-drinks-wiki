import 'package:cached_network_image/cached_network_image.dart';
import 'package:drinks_wiki/cubit/favorites_cubit.dart';
import 'package:drinks_wiki/models/drink_list.dart';
import 'package:drinks_wiki/pages/details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        bool isFavorite = context.read<FavoritesCubit>().isFavorite(
            drink: DrinkList(id: id, name: title, imageUrl: imageUrl));
        return Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsPage(id: id),
                  ),
                );
              },
              child: ClipRRect(
                borderRadius: borderRadius,
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: BoxFit.cover,
                  placeholder: (_, __) => Container(
                    height: MediaQuery.of(context).size.height / 4,
                    width: double.infinity,
                    color: Theme.of(context).primaryColor,
                  ),
                  errorWidget: (context, url, error) {
                    return Center(
                      child: Container(
                        height: MediaQuery.of(context).size.height / 4,
                        width: double.infinity,
                        color: Theme.of(context).primaryColor,
                        child: Center(child: Text('Failed to load image')),
                      ),
                    );
                  },
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    padding: EdgeInsets.zero,
                    icon: isFavorite
                        ? Icon(
                            Icons.favorite,
                            size: 20.0,
                            color: Theme.of(context).accentColor,
                          )
                        : Icon(
                            Icons.favorite_outline,
                            size: 20.0,
                          ),
                    onPressed: () {
                      context.read<FavoritesCubit>().toggleFavorite(
                          drink: DrinkList(
                              id: id, name: title, imageUrl: imageUrl));
                    }),
              ],
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ],
        );
      },
    );
  }
}
