import 'package:bloc/bloc.dart';
import 'package:drinks_wiki/models/drink_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(FavoritesState.initial());

  bool isFavorite({@required Drink drink}) {
    return state.favorites.contains(drink);
  }

  void toggleFavorite({@required Drink drink}) {
    final newList = state.favorites;
    if (isFavorite(drink: drink)) {
      // If drink is already in favorites then remove it
      newList.removeWhere((element) => element == drink);
      emit(state.copyWith(favorites: newList));
    } else {
      // If drink is not in favorites then add it
      newList.add(drink);
      emit(state.copyWith(favorites: newList));
    }
  }
}
