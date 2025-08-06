part of 'countries_bloc.dart';

sealed class CountriesEvent {}

class GetCountriesEvent extends CountriesEvent {}

class GetCountriesByNameEvent extends CountriesEvent {
  final String name;

  GetCountriesByNameEvent({required this.name});
}

class AddWishListCountryEvent extends CountriesEvent {
  final CountryEntity country;

  AddWishListCountryEvent({required this.country});
}
