import 'package:flutter/material.dart';

void main() => runApp(const AirtimeScreen());

class AirtimeScreen extends StatelessWidget {
  const AirtimeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: ('clap'),
      home: AirtimePage(),
    );
  }
}

class AirtimePage extends StatelessWidget {
  const AirtimePage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
