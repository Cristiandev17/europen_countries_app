part of 'countries_bloc.dart';

enum CountriesStatus { initial, loading, success, failure }

class CountriesState extends Equatable {
  final CountriesStatus status;
  final List<CountryEntity> countries;

  const CountriesState({this.status = CountriesStatus.initial, this.countries = const []});

  CountriesState copyWith({CountriesStatus? status, List<CountryEntity>? countries}) {
    return CountriesState(status: status ?? this.status, countries: countries ?? this.countries);
  }

  @override
  List<Object> get props => [status, countries];
}
