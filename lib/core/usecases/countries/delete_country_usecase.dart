import 'package:europen_countries_app/domain/entities/country_entity.dart';

abstract class DeleteCountryUseCase {
  Future<void> execute(CountryEntity country);
}
