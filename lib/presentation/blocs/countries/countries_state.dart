part of 'countries_bloc.dart';

enum CountriesStatus { initial, loading, success, failure, consulted, saved, timeout }

class CountriesState extends Equatable {
  final CountriesStatus status;
  final List<CountryEntity> countries;
  final CountryEntity countrySelected;

  CountriesState({this.status = CountriesStatus.initial, this.countries = const [], CountryEntity? countrySelected})
    : countrySelected = countrySelected ?? CountryEntity.empty();

  CountriesState copyWith({CountriesStatus? status, List<CountryEntity>? countries, CountryEntity? countrySelected}) {
    return CountriesState(
      status: status ?? this.status,
      countries: countries ?? this.countries,
      countrySelected: countrySelected ?? this.countrySelected,
    );
  }

  @override
  List<Object> get props => [status, countries, countrySelected];
}
