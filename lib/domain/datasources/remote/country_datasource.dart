import 'package:europen_countries_app/data/models/country_model.dart';

abstract class CountryDataSource {
  Future<List<CountryModel>> getCountries();
}
