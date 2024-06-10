import 'package:finalmobil/screens/client/login.dart';
import 'package:finalmobil/screens/client/profile.dart';
import 'package:finalmobil/screens/client/register.dart';
import 'package:finalmobil/screens/core/error.dart';
import 'package:finalmobil/screens/core/loader.dart';
import 'package:finalmobil/screens/home.dart';
import 'package:finalmobil/screens/product/product.dart';
import 'package:finalmobil/screens/product/products.dart';
import 'package:finalmobil/screens/product/search.dart';
import 'package:finalmobil/screens/static/about.dart';
import 'package:finalmobil/screens/static/boarding.dart';
import 'package:finalmobil/screens/static/contact.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration
final routes = GoRouter(
  errorBuilder: (context, state) => const ErrorScreen(),
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoaderScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/boarding',
      builder: (context, state) => const BoardingScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfileScreen(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      path: '/product',
      builder: (context, state) => const ProductScreen(),
    ),
    GoRoute(
      path: '/products',
      builder: (context, state) => const ProductsScreen(),
    ),
    GoRoute(
      path: '/search',
      builder: (context, state) => const SearchScreen(),
    ),
    GoRoute(
      path: '/about',
      builder: (context, state) => const AboutScreen(),
    ),
    GoRoute(
      path: '/contact',
      builder: (context, state) => const ContactScreen(),
    ),
  ],
);
