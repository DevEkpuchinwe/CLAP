import 'package:flutter/material.dart';

void main() => runApp(const CableScreen());

class CableScreen extends StatelessWidget {
  const CableScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: ('clap'),
      home: CablePage(),
    );
  }
}

class CablePage extends StatelessWidget {
  const CablePage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
