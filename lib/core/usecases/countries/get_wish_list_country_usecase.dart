import 'package:europen_countries_app/domain/entities/country_entity.dart';

abstract class GetWishListCountryUseCase {
  Future<List<CountryEntity>> execute();
}
