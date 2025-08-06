import 'package:europen_countries_app/core/usecases/countries/get_wish_list_country_usecase.dart';
import 'package:europen_countries_app/domain/entities/country_entity.dart';
import 'package:europen_countries_app/domain/repositories/countries/country_repository.dart';

class GetWishListCountryUseCaseImpl implements GetWishListCountryUseCase {
  final CountryRepository _countryRepository;

  GetWishListCountryUseCaseImpl(this._countryRepository);

  @override
  Future<List<CountryEntity>> execute() {
    return _countryRepository.getWishListCountries();
  }
}
