import 'package:europen_countries_app/data/models/country_model.dart';
import 'package:europen_countries_app/domain/entities/country_entity.dart';

class CountryMapper {
  static CountryEntity toEntity(CountryModel model) {
    return CountryEntity(
      name: model.name,
      capital: model.capital,
      flag: model.flag,
      population: model.population,
      currency: model.currency,
      area: model.area,
    );
  }
}
