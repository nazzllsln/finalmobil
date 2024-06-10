import 'package:finalmobil/bloc/cart/cart_cubit.dart';
import 'package:finalmobil/bloc/client/client_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ClientCubit clientCubit;
  late CartCubit cartCubit;

  @override
  void initState() {
    super.initState();
    clientCubit = context.read<ClientCubit>();
    cartCubit = context.read<CartCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(builder: (context, state) {
      return Scaffold(
        body: SafeArea(
            child: Center(
          child: Column(
            children: [
              InkWell(
                  onTap: () => GoRouter.of(context).push("/ali"),
                  child: const Text("HomeScreen")),
              Text("Language: " + clientCubit.state.language),
              Text("DarkMode: " + clientCubit.state.darkMode.toString()),
              Text("Sepet: " + cartCubit.state.sepet.toString()),
              ElevatedButton(
                  onPressed: () {
                    clientCubit.changeDarkMode(darkMode: true);
                  },
                  child: Text("gece modu")),
              ElevatedButton(
                  onPressed: () {
                    clientCubit.changeDarkMode(darkMode: false);
                  },
                  child: Text("gündüz modu")),
              ElevatedButton(
                  onPressed: () {
                    cartCubit.sepetEkle(ad: "macbook", sayi: 1, fiyat: 99000);
                  },
                  child: Text("Sepete Ekle Macbook")),
            ],
          ),
        )),
      );
    });
  }
}
