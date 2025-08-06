part of 'wish_list_country_bloc.dart';

sealed class WishListCountryEvent {}

class GetWishListCountryEvent extends WishListCountryEvent {}

class DeleteCountryEvent extends WishListCountryEvent {
  final CountryEntity country;
  DeleteCountryEvent({required this.country});
}
