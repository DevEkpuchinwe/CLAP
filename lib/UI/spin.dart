import 'package:flutter/material.dart';

void main() => runApp(const SpinScreen());

class SpinScreen extends StatelessWidget {
  const SpinScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: ('clap'),
      home: SpinPage(),
    );
  }
}

class SpinPage extends StatelessWidget {
  const SpinPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
