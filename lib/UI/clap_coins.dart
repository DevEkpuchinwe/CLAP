import 'package:flutter/material.dart';

void main() => runApp(const CoinsScreen());

class CoinsScreen extends StatelessWidget {
  const CoinsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: ('clap'),
      home: CoinsPage(),
    );
  }
}

class CoinsPage extends StatelessWidget {
  const CoinsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
