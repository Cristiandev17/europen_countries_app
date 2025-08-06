import 'package:europen_countries_app/presentation/blocs/countries/countries_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountriesScreen extends StatefulWidget {
  const CountriesScreen({super.key});

  @override
  State<CountriesScreen> createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<CountriesScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CountriesBloc>().add(GetCountriesEvent());
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<CountriesBloc>().state;
    final countries = state.countries;
    return Scaffold(
      appBar: AppBar(title: const Text('Countries')),
      body:
          state.status == CountriesStatus.loading
              ? const Center(child: CircularProgressIndicator())
              : Center(
                child: Column(
                  children: [
                    // Expanded(child: ListView.builder(itemBuilder: itemBuilder, itemCount: itemCount))
                  ],
                ),
              ),
    );
  }
}
