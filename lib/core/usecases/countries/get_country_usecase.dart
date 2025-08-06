import 'package:europen_countries_app/domain/entities/country_entity.dart';

abstract class GetCountryUseCase {
  Future<CountryEntity> execute(String name);
}
