import 'package:finalmobil/core/storage.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoaderScreen extends StatefulWidget {
  const LoaderScreen({super.key});

  @override
  State<LoaderScreen> createState() => _LoaderScreenState();
}

class _LoaderScreenState extends State<LoaderScreen> {
  loadApp() async {
    final stroage = Storage();
    stroage.clearStorage();
    final firstLaunch = await stroage.isFirstLaunch();

    if (firstLaunch) {
      GoRouter.of(context).replace("/boarding");
    } else {
      // ana ekrana git
      // ignore: use_build_context_synchronously
      GoRouter.of(context).replace("/home");
    }
  }

  @override
  void initState() {
    super.initState();
    loadApp();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
