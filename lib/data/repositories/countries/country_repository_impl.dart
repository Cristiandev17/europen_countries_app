import 'package:europen_countries_app/data/mappers/country_mapper.dart';
import 'package:europen_countries_app/domain/datasources/local/country_datasource_local.dart';
import 'package:europen_countries_app/domain/datasources/remote/country_datasource.dart';
import 'package:europen_countries_app/domain/entities/country_entity.dart';
import 'package:europen_countries_app/domain/repositories/countries/country_repository.dart';

class CountryRepositoryImpl implements CountryRepository {
  final CountryDataSource _countryDataSource;
  final CountryDataSourceLocal _countryDataSourceLocal;

  CountryRepositoryImpl(this._countryDataSource, this._countryDataSourceLocal);

  @override
  Future<List<CountryEntity>> getCountries() async {
    final countries = await _countryDataSource.getCountries();
    return countries.map((e) => CountryMapper.toEntity(e)).toList();
  }

  @override
  Future<CountryEntity> getDetailCountry(String name) async {
    final country = await _countryDataSource.getDetailCountry(name);
    return CountryMapper.toEntity(country);
  }

  @override
  Future<void> saveCountry(CountryEntity country) async {
    await _countryDataSourceLocal.insertCountry(CountryMapper.toModelFromEntity(country));
  }

  @override
  Future<void> deleteCountry(String name) async {
    await _countryDataSourceLocal.deleteCountry(name);
  }

  @override
  Future<List<CountryEntity>> getWishListCountries() async {
    final countries = await _countryDataSourceLocal.getWishListCountry();
    return countries.map((e) => CountryMapper.toEntity(e)).toList();
  }

  @override
  Future<CountryEntity?> getCountryByName(String name) async {
    final result = await _countryDataSourceLocal.getCountryByName(name);
    if (result != null) {
      return CountryMapper.toEntity(result);
    }
    return null;
  }
}
