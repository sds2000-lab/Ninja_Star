import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class BuyView extends StatelessWidget {
  const BuyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.route.navigateToPage(const NextPage());
          },
          child: const Text("Next"),
        ),
      ),
    );
  }
}

class NextPage extends StatelessWidget {
  const NextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Next Page")),
    );
  }
}