import 'package:europen_countries_app/data/mappers/country_mapper.dart';
import 'package:europen_countries_app/domain/datasources/remote/country_datasource.dart';
import 'package:europen_countries_app/domain/entities/country_entity.dart';
import 'package:europen_countries_app/domain/repositories/remote/country_repository.dart';

class CountryRepositoryImpl implements CountryRepository {
  final CountryDataSource _countryDataSource;

  CountryRepositoryImpl(this._countryDataSource);

  @override
  Future<List<CountryEntity>> getCountries() async {
    final countries = await _countryDataSource.getCountries();
    return countries.map((e) => CountryMapper.toEntity(e)).toList();
  }
  
  @override
  Future<CountryEntity> getCountry(String name) async {
    final country = await _countryDataSource.getCountry(name);
    return CountryMapper.toEntity(country);
  }
}
