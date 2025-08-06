import 'package:europen_countries_app/core/usecases/countries/get_country_usecase.dart';
import 'package:europen_countries_app/domain/entities/country_entity.dart';
import 'package:europen_countries_app/domain/repositories/countries/country_repository.dart';

class GetCountryUseCaseImpl implements GetCountryUseCase {
  final CountryRepository _countryRepository;

  GetCountryUseCaseImpl(this._countryRepository);

  @override
  Future<CountryEntity> execute(String name) async {
    return await _countryRepository.getDetailCountry(name);
  }
}
