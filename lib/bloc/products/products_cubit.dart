import 'package:flutter_bloc/flutter_bloc.dart';
part 'products_state.dart';

class ProductsCubit extends Cubit<ProductState> {
  ProductsCubit(super.initialState);

  addToFavorites(Map<String, dynamic> product) {
    var currenFavorites = state.favorites;

    bool found = false;

    for (int i = 0; i < currenFavorites.length; i++) {
      if (currenFavorites[i]["id"] == product["id"]) {
        found = true;
        break;
      }
    }
    if (found) {
      //ürün listede zaten mevcut
      //eklemeye gerek yok
    } else {
      currenFavorites.add(product);
      final updatedState = ProductState(
        favorites: currenFavorites,
      );
      emit(updatedState);
    }
  }

  addFavorites2(Map<String, dynamic> product) {
    var currenFavorites = state.favorites;

    if (currenFavorites.any((element) => element["id"] == product["id"])) {
      //zaten var
    } else {
      currenFavorites.add(product);
      final newState = ProductState(favorites: currenFavorites);
      emit(newState);
    }
  }

  bool isFavorite(int productID) {
    return state.favorites.any((element) => element["id"] == productID);
  }

  removeFromFavorites(int productID) {
    var currentFavorites = state.favorites;

    currentFavorites.removeWhere((element) => element["id"] == productID);

    final newState = ProductState(favorites: currentFavorites);

    emit(newState);
  }

  clearFavorites(Map<String, dynamic> product) {
    final updatedState = ProductState(
      favorites: const [],
    );
    emit(updatedState);
  }
}
