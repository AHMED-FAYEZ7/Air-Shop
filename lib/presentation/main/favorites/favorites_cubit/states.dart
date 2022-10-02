abstract class FavoritesStates {}

class FavoritesInitialState extends FavoritesStates {}

class LoadingFavoritesState extends FavoritesStates {}
class SuccessFavoritesState extends FavoritesStates {}
class ErrorFavoritesState extends FavoritesStates
{
  final String error;

  ErrorFavoritesState(this.error);
}