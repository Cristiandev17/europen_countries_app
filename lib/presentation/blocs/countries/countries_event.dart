part of 'countries_bloc.dart';

sealed class CountriesEvent {}

class GetCountriesEvent extends CountriesEvent {}

class GetFavoriteCountriesEvent extends CountriesEvent {}

class AddFavoriteCountryEvent extends CountriesEvent {}
