import 'package:europen_countries_app/core/usecases/countries/delete_country_usecase.dart';
import 'package:europen_countries_app/domain/entities/country_entity.dart';
import 'package:europen_countries_app/domain/repositories/countries/country_repository.dart';

class DeleteCountryUseCaseImpl implements DeleteCountryUseCase {
  final CountryRepository _countryRepository;

  DeleteCountryUseCaseImpl(this._countryRepository);

  @override
  Future<void> execute(CountryEntity country) {
    return _countryRepository.deleteCountry(country.name);
  }
}
