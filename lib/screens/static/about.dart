import 'dart:io';
import 'package:flutter/material.dart';

import '../core/data.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  Map<String, dynamic> pageData = {};

  loadData() async {
    AppData veriYoneticim = AppData();

    final veriler = await veriYoneticim.getAboutScreenData();

    setState(() {
      pageData = veriler;
    });
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return pageData.isEmpty
        ? const SizedBox()
        : ListView(
            children: [
              if (pageData["slogan"].isNotEmpty)
                Container(
                    padding: const EdgeInsets.all(8.0),
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    child: Text(pageData["slogan"])),
              if (pageData["subSlogan"].isNotEmpty)
                Container(
                    padding: const EdgeInsets.all(8.0),
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    child: Text(pageData["subSlogan"])),
              if (pageData["cover"].isNotEmpty)
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6.0),
                    child: pageData["cover"].startsWith("http")
                        ? Image.network(pageData["cover"])
                        : pageData["cover"].startsWith("assets")
                            ? Image.asset(pageData["cover"])
                            : Image.file(File(pageData["cover"])),
                  ),
                ),
              if (pageData["summary"].isNotEmpty)
                Container(
                    padding: const EdgeInsets.all(8.0),
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    child: Text(pageData["summary"])),
            ],
          );
  }
}
