import 'package:flutter_bloc/flutter_bloc.dart';
part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(super.initialState);

  sepetEkle({required String ad, required int sayi, required double fiyat}) {
    var suankiSepet = state.sepet;

    suankiSepet.add({
      "name": ad,
      "count": sayi,
      "price": fiyat,
    });

    final yeniDurum = CartState(
      sepet: suankiSepet,
    );
    emit(yeniDurum);
  }

  sepetiBosalt({required String ad, required int sayi, required double fiyat}) {
    final yeniDurum = CartState(
      sepet: [],
    );
    emit(yeniDurum);
  }
}
