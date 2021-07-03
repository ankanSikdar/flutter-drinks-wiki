part of 'favorites_cubit.dart';

class FavoritesState {
  final List<Drink> favorites;
  FavoritesState({
    @required this.favorites,
  });

  factory FavoritesState.initial() {
    return FavoritesState(favorites: []);
  }

  FavoritesState copyWith({
    List<Drink> favorites,
  }) {
    return FavoritesState(
      favorites: favorites ?? this.favorites,
    );
  }
}
