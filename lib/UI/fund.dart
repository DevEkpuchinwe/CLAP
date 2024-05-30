import 'package:flutter/material.dart';

void main() => runApp(const FundScreen());

class FundScreen extends StatelessWidget {
  const FundScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: ('clap'),
      home: FundPage(),
    );
  }
}

class FundPage extends StatelessWidget {
  const FundPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
