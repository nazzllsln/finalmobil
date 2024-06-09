import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gap/gap.dart';

class ErrorScreen extends StatefulWidget {
  const ErrorScreen({super.key});

  @override
  State<ErrorScreen> createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("404 - Not Found"),
            const Gap(20),
            IconButton(
              onPressed: () => GoRouter.of(context).pop(),
              icon: Icon(CupertinoIcons.chevron_back),
            ),
          ],
        ),
      )),
    );
  }
}
