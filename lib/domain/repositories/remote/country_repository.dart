import 'package:europen_countries_app/domain/entities/country_entity.dart';

abstract class CountryRepository {
  Future<List<CountryEntity>> getCountries();

  Future<CountryEntity> getCountry(String name);
}
