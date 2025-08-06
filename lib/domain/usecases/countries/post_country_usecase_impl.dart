import 'package:europen_countries_app/core/usecases/countries/post_country_usecase.dart';
import 'package:europen_countries_app/domain/entities/country_entity.dart';
import 'package:europen_countries_app/domain/repositories/countries/country_repository.dart';

class PostCountryUseCaseImpl implements PostCountryUseCase {
  final CountryRepository _countryRepository;

  PostCountryUseCaseImpl(this._countryRepository);

  @override
  Future<void> execute(CountryEntity country) {
    return _countryRepository.saveCountry(country);
  }
}
