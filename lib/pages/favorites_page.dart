import 'package:drinks_wiki/cubit/favorites_cubit.dart';
import 'package:drinks_wiki/models/drink_model.dart';
import 'package:drinks_wiki/widgets/drink_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LikesPage extends StatefulWidget {
  const LikesPage({Key key}) : super(key: key);

  @override
  _LikesPageState createState() => _LikesPageState();
}

class _LikesPageState extends State<LikesPage> {
  List<Drink> drinks;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        drinks = context.read<FavoritesCubit>().state.favorites;
        return drinks.length == 0
            ? Container(
                child: Center(
                  child: Text('No Favorites Added Yet'),
                ),
              )
            : CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          final drink = drinks[index];
                          return Padding(
                            padding: EdgeInsets.symmetric(vertical: 18.0),
                            child: DrinkCard(
                              id: drink.id,
                              title: drink.name,
                              imageUrl: drink.imageUrl,
                            ),
                          );
                        },
                        childCount: drinks.length,
                      ),
                    ),
                  )
                ],
              );
      },
    );
  }
}
