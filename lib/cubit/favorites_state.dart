part of 'favorites_cubit.dart';

class FavoritesState {
  final List<DrinkList> favorites;
  FavoritesState({
    @required this.favorites,
  });

  factory FavoritesState.initial() {
    return FavoritesState(favorites: []);
  }

  FavoritesState copyWith({
    List<DrinkList> favorites,
  }) {
    return FavoritesState(
      favorites: favorites ?? this.favorites,
    );
  }
}
