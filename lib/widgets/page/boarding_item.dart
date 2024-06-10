import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BoardingItem extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  const BoardingItem({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Padding(
        padding: const EdgeInsets.all(38.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.network(
              image,
              height: 200,
            ),
            Column(
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Gap(20),
                Text(description),
              ],
            )
          ],
        ),
      ),
    );
  }
}
