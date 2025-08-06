part of 'wish_list_country_bloc.dart';

enum WishListCountryStatus { initial, loading, success, failure }

class WishListCountryState extends Equatable {
  final WishListCountryStatus status;
  final List<CountryEntity> countries;

  const WishListCountryState({this.status = WishListCountryStatus.initial, this.countries = const []});

  WishListCountryState copyWith({WishListCountryStatus? status, List<CountryEntity>? countries}) {
    return WishListCountryState(status: status ?? this.status, countries: countries ?? this.countries);
  }

  @override
  List<Object> get props => [status, countries];
}
