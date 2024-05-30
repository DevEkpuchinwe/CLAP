import 'package:flutter/material.dart';

void main() => runApp(const TradeScreen());

class TradeScreen extends StatelessWidget {
  const TradeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: ('clap'),
      home: TradePage(),
    );
  }
}

class TradePage extends StatelessWidget {
  const TradePage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
