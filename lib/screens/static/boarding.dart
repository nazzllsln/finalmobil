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
              children: [
                Image.asset(
                  "assets/images/boarding1.jpg",
                  width: 50,
                ),
                const Text("Buy All You Need!!!")
              ],
            ),
          ),
          Center(child: Text("Boarding 1")),
          Center(child: Text("Boarding 2")),
          Center(child: Text("Boarding 3")),
        ],
      ),
    ));
  }
}
