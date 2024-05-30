import 'package:flutter/material.dart';

void main() => runApp(const TransferScreen());

class TransferScreen extends StatelessWidget {
  const TransferScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: ('clap'),
      home: TransferPage(),
    );
  }
}

class TransferPage extends StatelessWidget {
  const TransferPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
