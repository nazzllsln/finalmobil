import 'package:finalmobil/screens/client/login.dart';
import 'package:finalmobil/screens/client/profile.dart';
import 'package:finalmobil/screens/client/register.dart';
import 'package:finalmobil/screens/home.dart';
import 'package:finalmobil/screens/product/product.dart';
import 'package:finalmobil/screens/product/search.dart';
import 'package:finalmobil/screens/static/about.dart';
import 'package:finalmobil/screens/static/contact.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration
final routes = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => ProfileScreen(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => RegisterScreen(),
    ),
    GoRoute(
      path: '/product',
      builder: (context, state) => ProductScreen(),
    ),
    GoRoute(
      path: '/search',
      builder: (context, state) => SearchScreen(),
    ),
    GoRoute(
      path: '/about',
      builder: (context, state) => AboutScreen(),
    ),
    GoRoute(
      path: '/contact',
      builder: (context, state) => ContactScreen(),
    ),
  ],
);
