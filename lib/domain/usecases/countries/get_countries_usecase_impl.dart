import 'package:europen_countries_app/core/usecases/countries/get_countries_usecase.dart';
import 'package:europen_countries_app/domain/entities/country_entity.dart';
import 'package:europen_countries_app/domain/repositories/countries/country_repository.dart';

class GetCountriesUseCaseImpl implements GetCountriesUseCase {
  final CountryRepository _countryRepository;

  GetCountriesUseCaseImpl(this._countryRepository);

  @override
  Future<List<CountryEntity>> execute() async {
    return await _countryRepository.getCountries();
  }
}
