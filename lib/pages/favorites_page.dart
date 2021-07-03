import 'package:drinks_wiki/cubit/favorites_cubit.dart';
import 'package:drinks_wiki/models/drink_model.dart';
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
    drinks = context.read<FavoritesCubit>().state.favorites;
    return Container(
      child: Center(
        child: Text('${drinks.length}'),
      ),
    );
  }
}
