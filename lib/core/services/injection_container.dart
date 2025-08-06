import 'package:dio/dio.dart';
import 'package:europen_countries_app/core/usecases/countries/get_countries_usecase.dart';
import 'package:europen_countries_app/data/datasources/dio/dio_base.dart';
import 'package:europen_countries_app/data/repositories/remote/countries/country_repository_impl.dart';
import 'package:europen_countries_app/domain/datasources/remote/country_datasource.dart';
import 'package:europen_countries_app/domain/repositories/remote/country_repository.dart';
import 'package:europen_countries_app/domain/usecases/countries/get_countries_usecase_impl.dart';
import 'package:europen_countries_app/presentation/blocs/bloc/countries_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../data/datasources/remote/countries/country_datasource_impl.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  //Dio`
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton<DioBase>(DioBase());

  //DataSources
  getIt.registerSingleton<CountryDataSource>(CountryDataSourceImpl(getIt<DioBase>()));

  //Repositories
  getIt.registerSingleton<CountryRepository>(CountryRepositoryImpl(getIt<CountryDataSource>()));

  //UseCases
  getIt.registerSingleton<GetCountriesUseCase>(GetCountriesUseCaseImpl(getIt<CountryRepository>()));

  //Blocs
  getIt.registerFactory(() => CountriesBloc(getIt<GetCountriesUseCase>()));
}
