import 'dart:convert';
import 'dart:math';

import 'package:europen_countries_app/core/constants/app_constants.dart';
import 'package:europen_countries_app/data/datasources/dio/dio_base.dart';
import 'package:europen_countries_app/data/models/country_model.dart';
import 'package:europen_countries_app/domain/datasources/remote/country_datasource.dart';
import 'package:flutter/foundation.dart';

class CountryDataSourceImpl implements CountryDataSource {
  final DioBase _dioBase;

  CountryDataSourceImpl(this._dioBase);

  @override
  Future<CountryModel> getDetailCountry(String name) async {
    final response = await _dioBase.get(
      AppConstants.countryEndpoint + name,
      forceRefresh: true,
      maxStale: const Duration(minutes: 60),
    );

    return (response.data as List).map((e) => CountryModel.fromJson(e)).toList().first;
  }

  @override
  Future<List<CountryModel>> getCountries() async {
    final response = await _dioBase.get(AppConstants.countriesEndpoint);

    // Simular una demora de red adicional
    await Future.delayed(const Duration(seconds: 4));

    return await compute<List<dynamic>, List<CountryModel>>(_managmentGetCountriesIsolate, response.data);
  }

  Future<List<CountryModel>> _managmentGetCountriesIsolate(List<dynamic> responseData) async {
    List<CountryModel> result = [];

    for (var item in responseData) {
      double dummy = 0;
      for (int i = 0; i < 100000; i++) {
        dummy += sqrt(i * pi) * pow(i, 2);
      }

      result.add(CountryModel.fromJson(item));
    }

    return result;
  }
}
