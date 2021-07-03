import 'package:cached_network_image/cached_network_image.dart';
import 'package:drinks_wiki/cubit/favorites_cubit.dart';
import 'package:drinks_wiki/models/drink_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DrinkImage extends StatelessWidget {
  const DrinkImage({
    Key key,
    @required this.drink,
  }) : super(key: key);

  final Drink drink;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 400,
            decoration: BoxDecoration(
              color: Colors.transparent,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: CachedNetworkImageProvider(drink.imageUrl),
              ),
            ),
          ),
          Container(
            height: 400,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black87],
                  stops: [0, 1.0]),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
            child: Text(
              drink.name,
              style: TextStyle(color: Colors.white, fontSize: 28.0),
              textAlign: TextAlign.center,
            ),
          ),
          Positioned(
            right: 4.0,
            bottom: 4.0,
            child: IconButton(
              icon: context.read<FavoritesCubit>().isFavorite(drink: drink)
                  ? Icon(
                      Icons.favorite,
                      color: Theme.of(context).accentColor,
                    )
                  : Icon(Icons.favorite_outline),
              onPressed: () {
                context.read<FavoritesCubit>().toggleFavorite(drink: drink);
              },
            ),
          )
        ],
      ),
    );
  }
}
