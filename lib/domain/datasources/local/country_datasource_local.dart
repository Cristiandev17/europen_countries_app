import 'package:europen_countries_app/data/models/country_model.dart';

abstract class CountryDataSourceLocal {
  Future<int> insertCountry(CountryModel country);

  Future<List<CountryModel>> getWishListCountry();

  Future<void> deleteCountry(String name);

  Future<CountryModel?> getCountryByName(String name);
}
