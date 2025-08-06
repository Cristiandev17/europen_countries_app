import 'package:europen_countries_app/core/theme/app_colors.dart';
import 'package:europen_countries_app/core/utils/number_formatting.dart';
import 'package:europen_countries_app/core/widgets/custom_item_information.dart';
import 'package:europen_countries_app/presentation/blocs/countries/countries_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountryDetailScreen extends StatefulWidget {
  const CountryDetailScreen({super.key});

  @override
  State<CountryDetailScreen> createState() => _CountryDetailScreenState();
}

class _CountryDetailScreenState extends State<CountryDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final state = context.watch<CountriesBloc>().state;
    final country = state.countrySelected;
    return Scaffold(
      appBar: AppBar(title: const Text('Country Detail')),
      body:
          state.status == CountriesStatus.loading
              ? const Center(child: CircularProgressIndicator())
              : SizedBox(
                child: Stack(
                  children: [
                    // Content
                    Center(
                      child: Column(
                        children: [
                          Image.network(country.flag, height: 150, width: 150),
                          const SizedBox(height: 18),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: Column(
                              children: [
                                Text(
                                  country.name,
                                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: AppColors.black),
                                ),
                                const SizedBox(height: 25),
                                CustomItemInformation(icon: Icons.location_on, title: 'Capital', value: country.capital),
                                const SizedBox(height: 25),
                                CustomItemInformation(
                                  icon: Icons.language,
                                  title: 'Population',
                                  value: country.population.toString().withThousandsSeparator,
                                ),
                                const SizedBox(height: 25),
                                CustomItemInformation(icon: Icons.euro_symbol, title: 'Moneda', value: country.currency),
                                const SizedBox(height: 25),
                                CustomItemInformation(
                                  icon: Icons.map,
                                  title: 'Area',
                                  value: country.area.toString().withThousandsSeparator,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
    );
  }
}
