import 'package:europen_countries_app/core/database/database.dart' show AppDatabase, CountriesCompanion;
import 'package:europen_countries_app/data/models/country_model.dart';
import 'package:europen_countries_app/domain/datasources/local/country_datasource_local.dart';

class CountryDataSourceLocalImpl implements CountryDataSourceLocal {
  final AppDatabase _database;

  CountryDataSourceLocalImpl(this._database);
  @override
  Future<int> insertCountry(CountryModel country) {
    return _database.into(_database.countries).insert(CountriesCompanion.insert(
      name: country.name,
      capital: country.capital,
      flag: country.flag,
      population: country.population,
      currency: country.currency,
      area: country.area,
    ));
  }
}
