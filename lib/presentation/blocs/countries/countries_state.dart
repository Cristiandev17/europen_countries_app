part of 'countries_bloc.dart';

enum CountriesStatus { initial, loading, success, failure }

class CountriesState extends Equatable {
  final CountriesStatus status;
  final List<CountryEntity> countries;
  final List<CountryEntity> favoriteCountries;

  const CountriesState({this.status = CountriesStatus.initial, this.countries = const [], this.favoriteCountries = const []});

  CountriesState copyWith({CountriesStatus? status, List<CountryEntity>? countries, List<CountryEntity>? favoriteCountries}) {
    return CountriesState(status: status ?? this.status, countries: countries ?? this.countries, favoriteCountries: favoriteCountries ?? this.favoriteCountries);
  }

  @override
  List<Object> get props => [status, countries, favoriteCountries];
}
