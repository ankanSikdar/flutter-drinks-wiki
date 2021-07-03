import 'package:bloc/bloc.dart';
import 'package:drinks_wiki/models/drink_list.dart';
import 'package:meta/meta.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(FavoritesState.initial());

  bool isFavorite({@required DrinkList drink}) {
    return state.favorites.contains(drink);
  }

  void toggleFavorite({@required DrinkList drink}) {
    final newList = state.favorites;
    if (isFavorite(drink: drink)) {
      // If drink is already in favorites then remove it
      newList.remove(drink);
      emit(state.copyWith(favorites: newList));
    } else {
      // If drink is not in favorites then add it
      newList.add(drink);
      emit(state.copyWith(favorites: newList));
    }
  }
}
