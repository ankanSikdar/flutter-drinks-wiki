import 'package:drinks_wiki/cubit/favorites_cubit.dart';
import 'package:drinks_wiki/models/drink_list.dart';
import 'package:drinks_wiki/widgets/drink_card.dart';
import 'package:drinks_wiki/widgets/drinks_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LikesPage extends StatefulWidget {
  const LikesPage({Key key}) : super(key: key);

  @override
  _LikesPageState createState() => _LikesPageState();
}

class _LikesPageState extends State<LikesPage> {
  List<DrinkList> drinks;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        drinks = context.read<FavoritesCubit>().state.favorites;
        return CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text('Your Favorites'),
              centerTitle: true,
              snap: true,
              floating: true,
            ),
            if (drinks.length == 0)
              SliverToBoxAdapter(
                child: Container(
                  margin: EdgeInsets.only(
                    top: (MediaQuery.of(context).size.height / 3),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'No Favorites Added Yet',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
              ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
              sliver: DrinksGridView(drinks),
            )
          ],
        );
      },
    );
  }
}
