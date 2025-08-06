import 'package:europen_countries_app/domain/entities/country_entity.dart';

abstract class CountryRepository {
  Future<List<CountryEntity>> getCountries();

  Future<CountryEntity> getDetailCountry(String name);

  Future<CountryEntity?> getCountryByName(String name);

  Future<void> saveCountry(CountryEntity country);

  Future<void> deleteCountry(String name);

  Future<List<CountryEntity>> getWishListCountries();
}
