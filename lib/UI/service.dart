import 'package:flutter/material.dart';

void main() => runApp(const ServiceScreen());

class ServiceScreen extends StatelessWidget {
  const ServiceScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: ('clap'),
      home: ServicePage(),
    );
  }
}

class ServicePage extends StatelessWidget {
  const ServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
