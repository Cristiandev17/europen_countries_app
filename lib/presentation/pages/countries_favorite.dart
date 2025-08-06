import 'package:flutter/material.dart';

class CountriesFavoriteScreen extends StatefulWidget {
  const CountriesFavoriteScreen({super.key});

  @override
  State<CountriesFavoriteScreen> createState() => _CountriesFavoriteScreenState();
}

class _CountriesFavoriteScreenState extends State<CountriesFavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Countries')),
      body: Center(
        child: Column(
          children: [
            // Expanded(child: ListView.builder(itemBuilder: itemBuilder, itemCount: itemCount))
          ],
        ),
      ),
    );
  }
}
