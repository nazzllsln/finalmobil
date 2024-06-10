import 'package:finalmobil/core/storage.dart';
import 'package:finalmobil/widgets/page/boarding_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:preload_page_view/preload_page_view.dart';

class BoardingScreen extends StatefulWidget {
  const BoardingScreen({super.key});

  @override
  State<BoardingScreen> createState() => _BoardingScreenState();
}

class _BoardingScreenState extends State<BoardingScreen> {
  int page = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: InkWell(
              onTap: () async {
                final storage = Storage();
                await storage.firstLaunched();
                GoRouter.of(context).replace('/home');
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: page == 2 ? const Text("Home") : const Text("skip"),
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: PreloadPageView(
          onPageChanged: (value) {
            setState(() {
              page = value;
            });
          },
          children: [
            BoardingItem(
              image: "https://www.e-tamaya.co.jp/img/mv/mv_mac.png",
              title: "Buy All You Need!!!",
              description:
                  "You can order what you want in just seconds using our awesome application",
            ),
            BoardingItem(
              image:
                  "https://www.beko.com.tr/media/resize/9232881600_LO2_20230922_001316.png/2000Wx2000H/image.webp",
              title: "Buy All You Need!!!",
              description:
                  "You can order what you want in just seconds using our awesome application",
            ),
            BoardingItem(
              image:
                  "https://www.arcelik.com.tr/media/resize/8914111100_LO1_20221102_074005.png/2000Wx2000H/image.webp",
              title: "Buy All You Need!!!",
              description:
                  "You can order what you want in just seconds using our awesome application",
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(page == 0
                ? CupertinoIcons.circle_filled
                : CupertinoIcons.circle),
            Icon(page == 1
                ? CupertinoIcons.circle_filled
                : CupertinoIcons.circle),
            Icon(page == 2
                ? CupertinoIcons.circle_filled
                : CupertinoIcons.circle),
          ],
        ),
      ),
    );
  }
}
