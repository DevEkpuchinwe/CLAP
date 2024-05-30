import 'package:flutter/material.dart';

void main() => runApp(const DataScreen());

class DataScreen extends StatelessWidget {
  const DataScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: ('clap'),
      home: DataPage(),
    );
  }
}

class DataPage extends StatelessWidget {
  const DataPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
