import 'package:europen_countries_app/core/constants/app_constants.dart';
import 'package:europen_countries_app/data/datasources/dio/dio_base.dart';
import 'package:europen_countries_app/data/models/country_model.dart';
import 'package:europen_countries_app/domain/datasources/remote/country_datasource.dart';

class CountryDataSourceImpl implements CountryDataSource {
  final DioBase _dioBase;

  CountryDataSourceImpl(this._dioBase);

  @override
  Future<List<CountryModel>> getCountries() async {
    final response = await _dioBase.get(AppConstants.countriesEndpoint);
    return (response.data as List).map((e) => CountryModel.fromJson(e)).toList();
  }

  @override
  Future<CountryModel> getDetailCountry(String name) async {
    final response = await _dioBase.get(
      AppConstants.countryEndpoint + name,
      forceRefresh: true,
      maxStale: const Duration(minutes: 60),
    );

    return (response.data as List).map((e) => CountryModel.fromJson(e)).toList().first;
  }
}
