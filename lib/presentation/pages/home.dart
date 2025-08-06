import 'package:europen_countries_app/presentation/pages/countries.dart';
import 'package:europen_countries_app/presentation/pages/wish_list_country.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  final screens = const <Widget>[CountriesScreen(), WishListCountryScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Paises'),
          BottomNavigationBarItem(icon: Icon(Icons.airplane_ticket), label: 'Proximos destinos'),
        ],
      ),
    );
  }
}
