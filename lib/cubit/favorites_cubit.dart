import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:drinks_wiki/models/drink_list.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'favorites_state.dart';

const String _FAVORITES = 'favorites';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(FavoritesState.initial());

  Future<void> loadFavoritesIfSaved() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final savedData = preferences.getStringList(_FAVORITES);
    if (savedData == null) {
      return;
    } else {
      final List<DrinkList> savedFavorites = savedData
          .map<DrinkList>((drinkListJson) =>
              DrinkList.fromJsonWithActualNames(drinkListJson))
          .toList();
      emit(state.copyWith(favorites: savedFavorites));
    }
  }

  bool isFavorite({@required DrinkList drink}) {
    return state.favorites.contains(drink);
  }

  void toggleFavorite({@required DrinkList drink}) {
    final newList = state.favorites;
    if (isFavorite(drink: drink)) {
      // If drink is already in favorites then remove it
      newList.remove(drink);
      updateSharedPreferences(newList);
      emit(state.copyWith(favorites: newList));
    } else {
      // If drink is not in favorites then add it
      newList.add(drink);
      updateSharedPreferences(newList);
      emit(state.copyWith(favorites: newList));
    }
  }

  Future<void> updateSharedPreferences(List<DrinkList> drinkList) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    List<String> stringifiedData =
        drinkList.map((drink) => jsonEncode(drink)).toList();
    await preferences.setStringList(_FAVORITES, stringifiedData);
  }
}
