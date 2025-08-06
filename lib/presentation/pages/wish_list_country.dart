import 'package:europen_countries_app/core/theme/app_colors.dart';
import 'package:europen_countries_app/core/widgets/custom_card.dart';
import 'package:europen_countries_app/core/widgets/custom_list_empty.dart';
import 'package:europen_countries_app/presentation/blocs/wish_list/wish_list_country_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishListCountryScreen extends StatefulWidget {
  const WishListCountryScreen({super.key});

  @override
  State<WishListCountryScreen> createState() => _WishListCountryScreenState();
}

class _WishListCountryScreenState extends State<WishListCountryScreen> {
  @override
  void initState() {
    super.initState();
    context.read<WishListCountryBloc>().add(GetWishListCountryEvent());
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<WishListCountryBloc>().state;
    final countries = state.countries;
    return Scaffold(
      appBar: AppBar(title: const Text('Countries')),
      body: SafeArea(
        child:
            countries.isEmpty
                ? CustomListEmpty(message: 'No hay paises en tu lista de deseos', fontSize: 18, color: AppColors.black)
                : Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    child: ListView.builder(
                      itemCount: countries.length,
                      itemBuilder: (context, index) {
                        final country = countries[index];
                        return CustomCard(
                          country: country,
                          iconTap: Icons.delete_forever,
                          onTapIcon: () {
                            context.read<WishListCountryBloc>().add(DeleteCountryEvent(country: country));
                            if (state.status == WishListCountryStatus.success) {
                              ScaffoldMessenger.of(
                                context,
                              ).showSnackBar(const SnackBar(content: Text('Pais eliminado de tu lista de deseos')));
                              context.read<WishListCountryBloc>().add(GetWishListCountryEvent());
                            }
                          },
                        );
                      },
                    ),
                  ),
                ),
      ),
    );
  }
}
