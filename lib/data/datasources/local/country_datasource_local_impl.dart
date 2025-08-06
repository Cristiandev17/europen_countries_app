import 'package:drift/drift.dart';
import 'package:europen_countries_app/core/database/database.dart' show AppDatabase, CountriesCompanion;
import 'package:europen_countries_app/data/mappers/country_mapper.dart';
import 'package:europen_countries_app/data/models/country_model.dart';
import 'package:europen_countries_app/domain/datasources/local/country_datasource_local.dart';

class CountryDataSourceLocalImpl implements CountryDataSourceLocal {
  final AppDatabase _database;

  CountryDataSourceLocalImpl(this._database);
  @override
  Future<int> insertCountry(CountryModel country) {
    return _database
        .into(_database.countries)
        .insert(
          CountriesCompanion.insert(
            name: country.name,
            capital: country.capital,
            flag: country.flag,
            population: country.population,
            currency: country.currency,
            area: country.area,
          ),
        );
  }

  @override
  Future<void> deleteCountry(String name) async {
    await (_database.delete(_database.countries)..where((country) => country.name.upper().equals(name.toUpperCase()))).go();
  }

  @override
  Future<List<CountryModel>> getWishListCountry() async {
    final result = await _database.select(_database.countries).get();
    return result.map((e) => CountryMapper.toModel(e)).toList();
  }

  @override
  Future<CountryModel?> getCountryByName(String name) async {
    final result = await (_database.select(_database.countries)..where((u) => u.name.upper().equals(name.toUpperCase()))).get();
    if (result.isNotEmpty) {
      return CountryMapper.toModel(result.first);
    }
    return null;
  }
}
