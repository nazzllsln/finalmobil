import 'package:flutter/material.dart';

class BoardingScreen extends StatefulWidget {
  const BoardingScreen({super.key});

  @override
  State<BoardingScreen> createState() => _BoardingScreenState();
}

class _BoardingScreenState extends State<BoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          children: [
            SizedBox.expand(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    "https://www.macworld.com/wp-content/uploads/2023/01/imac_21_5_2019_with_mba2019_04-1.jpg?quality=50&strip=all",
                    height: 200, // Yükseklik ekleyelim
                  ),
                  const SizedBox(height: 20),
                  const Text("Buy All You Need!!!")
                ],
              ),
            ),
            Center(child: Text("Boarding 1")),
            Center(child: Text("Boarding 2")),
            Center(child: Text("Boarding 3")),
          ],
        ),
      ),
    );
  }
}
