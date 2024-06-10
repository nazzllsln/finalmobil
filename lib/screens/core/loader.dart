import 'package:finalmobil/core/storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:io';

class LoaderScreen extends StatefulWidget {
  const LoaderScreen({super.key});

  @override
  State<LoaderScreen> createState() => _LoaderScreenState();
}

class _LoaderScreenState extends State<LoaderScreen> {
  loadApp() async {
    final stroage = Storage();
    // await stroage.clearStorage();
    final firstLaunch = await stroage.isFirstLaunch();

    if (firstLaunch) {
      //cihazın gece gündüz moduna erişmek
      const darkMode = ThemeMode.system == ThemeMode.dark;
      //cihazın varsayılan diline erişmek
      await stroage.setConfig(
          language: getDeviceLanguage(), darkMode: darkMode);

      GoRouter.of(context).replace("/boarding");
    } else {
      // ana ekrana git
      // ignore: use_build_context_synchronously
      final config = await stroage.getConfig();
      if (config["language"] == null) {
        stroage.setConfig(language: getDeviceLanguage());
      }
      if (config["darkMode"] == null) {
        const darkMode = ThemeMode.system == ThemeMode.dark;
        await stroage.setConfig(darkMode: darkMode);
      }
      GoRouter.of(context).replace("/home");
    }
  }

  getDeviceLanguage() {
    final String defaultLocale;
    if (!kIsWeb) {
      defaultLocale = Platform.localeName;
    } else {
      defaultLocale = "en";
    }

    final langParts = defaultLocale.split("_");
    final supportedLanguages = ["en", "tr", "fr", "es"];
    final String finalLang;
    if (supportedLanguages.contains(langParts[0])) {
      finalLang = langParts[0];
    } else {
      finalLang = "en";
    }

    return finalLang;
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
