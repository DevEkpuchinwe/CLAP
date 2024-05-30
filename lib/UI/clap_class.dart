import 'package:flutter/material.dart';

void main() => runApp(const ClassScreen());

class ClassScreen extends StatelessWidget {
  const ClassScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: ('clap'),
      home: ClassPage(),
    );
  }
}

class ClassPage extends StatelessWidget {
  const ClassPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
