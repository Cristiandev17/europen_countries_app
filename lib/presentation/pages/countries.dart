import 'package:europen_countries_app/core/constants/app_constants.dart';
import 'package:europen_countries_app/core/theme/app_colors.dart';
import 'package:europen_countries_app/core/widgets/custom_card.dart';
import 'package:europen_countries_app/core/widgets/custom_list_empty.dart';
import 'package:europen_countries_app/domain/entities/country_entity.dart';
import 'package:europen_countries_app/presentation/blocs/countries/countries_bloc.dart';
import 'package:europen_countries_app/presentation/blocs/wish_list/wish_list_country_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CountriesScreen extends StatefulWidget {
  const CountriesScreen({super.key});

  @override
  State<CountriesScreen> createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<CountriesScreen> {
  @override
  void initState() {
    super.initState();
    callListContry();
  }

  void callListContry() {
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
              : SafeArea(
                child: BlocListener<CountriesBloc, CountriesState>(
                  listener: (context, state) {
                    if (state.status == CountriesStatus.failure) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(const SnackBar(content: Text('Este Pais ya esta en tu lista de deseos')));
                    }
                    if (state.status == CountriesStatus.saved) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(const SnackBar(content: Text('Pais agregado a tu lista de deseos')));

                      context.read<WishListCountryBloc>().add(GetWishListCountryEvent());
                    }
                  },
                  child:
                      countries.isEmpty
                          ? CustomListEmpty(
                            message: 'No se pudo obtener los paises, intente mas tarde',
                            fontSize: 18,
                            color: AppColors.black,
                            onRetry: () => callListContry(),
                          )
                          : ConuntryList(countries: countries),
                ),
              ),
    );
  }
}

class ConuntryList extends StatelessWidget {
  const ConuntryList({super.key, required this.countries});

  final List<CountryEntity> countries;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: ListView.builder(
          itemCount: countries.length,
          itemBuilder: (context, index) {
            final country = countries[index];
            return CustomCard(
              country: country,
              iconTap: Icons.favorite_border_outlined,
              onTap: () {
                context.read<CountriesBloc>().add(GetCountriesByNameEvent(name: country.name));
                context.push(AppConstants.detailCountryRoute);
              },
              onTapIcon: () {
                context.read<CountriesBloc>().add(AddWishListCountryEvent(country: country));
              },
            );
          },
        ),
      ),
    );
  }
}
