import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../core/data.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  Map<String, dynamic> pageData = {};

  loadData() async {
    AppData veriYoneticim = AppData();

    final veriler = await veriYoneticim.getContactScreenData();

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
              if (pageData["Address"].isNotEmpty)
                InkWell(
                  onTap: () async {
                    if (pageData["mapLink"].isNotEmpty) {
                      final Uri url = Uri.parse(pageData["mapLink"]);
                      await launchUrl(url);
                    }
                  },
                  child: Container(
                      padding: const EdgeInsets.all(8.0),
                      margin: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      child: Text(pageData["Address"])),
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (pageData["instagram"].isNotEmpty)
                    IconButton(
                      onPressed: () async {
                        final Uri url = Uri.parse(pageData["instagram"]);
                        await launchUrl(url);
                      },
                      icon: Icon(Icons.social_distance),
                    ),
                  if (pageData["facebook"].isNotEmpty)
                    IconButton(
                      onPressed: () async {
                        final Uri url = Uri.parse(pageData["facebook"]);
                        await launchUrl(url);
                      },
                      icon: Icon(Icons.facebook),
                    ),
                  if (pageData["linkedin"].isNotEmpty)
                    IconButton(
                      onPressed: () async {
                        final Uri url = Uri.parse(pageData["linkedin"]);
                        await launchUrl(url);
                      },
                      icon: Icon(Icons.linked_camera),
                    ),
                  if (pageData["youtube"].isNotEmpty)
                    IconButton(
                      onPressed: () async {
                        final Uri url = Uri.parse(pageData["youtube"]);
                        await launchUrl(url);
                      },
                      icon: Icon(Icons.video_call),
                    ),
                ],
              ),
              if (pageData["Phone"].isNotEmpty)
                InkWell(
                  onTap: () async {
                    final Uri url = Uri.parse("tell: ${pageData["Phone"]}");
                    await launchUrl(url);
                  },
                  child: Container(
                      padding: const EdgeInsets.all(8.0),
                      margin: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      child: Text(pageData["Phone"])),
                ),
              if (pageData["emails"].isNotEmpty)
                Column(
                  children: (pageData["emails"] as List)
                      .map((e) => InkWell(
                            onTap: () async {
                              final Uri url = Uri.parse("mailto:${e["email"]}");
                              await launchUrl(url);
                            },
                            child: Container(
                                padding: const EdgeInsets.all(8.0),
                                margin: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(6.0),
                                ),
                                child: Text(e["title"] + "\n" + e["email"])),
                          ))
                      .toList(),
                ),
            ],
          );
  }
}
