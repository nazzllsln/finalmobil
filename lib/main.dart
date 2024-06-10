import 'package:finalmobil/bloc/cart/cart_cubit.dart';
import 'package:finalmobil/bloc/client/client_cubit.dart';
import 'package:finalmobil/core/routes.dart';
import 'package:finalmobil/core/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                ClientCubit(ClientState(darkMode: false, language: "en"))),
        BlocProvider(create: (context) => CartCubit(CartState(sepet: [])))
      ],
      child: BlocBuilder<ClientCubit, ClientState>(builder: (context, state) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: routes,
          themeMode: state.darkMode ? ThemeMode.dark : ThemeMode.light,
          // Theme config for FlexColorScheme version 7.3.x. Make sure you use
// same or higher package version, but still same major version. If you
// use a lower package version, some properties may not be supported.
// In that case remove them after copying this theme to your app.
          theme: lightTheme,
          darkTheme: darkTheme,
        );
      }),
    );
  }
}
