import 'package:dio/dio.dart';
import 'package:europen_countries_app/core/database/database.dart';
import 'package:europen_countries_app/core/usecases/countries/delete_country_usecase.dart';
import 'package:europen_countries_app/core/usecases/countries/get_countries_usecase.dart';
import 'package:europen_countries_app/core/usecases/countries/get_country_by_name_usecase.dart';
import 'package:europen_countries_app/core/usecases/countries/get_country_usecase.dart';
import 'package:europen_countries_app/core/usecases/countries/get_wish_list_country_usecase.dart';
import 'package:europen_countries_app/core/usecases/countries/post_country_usecase.dart';
import 'package:europen_countries_app/data/datasources/dio/dio_base.dart';
import 'package:europen_countries_app/data/datasources/local/country_datasource_local_impl.dart';
import 'package:europen_countries_app/data/repositories/countries/country_repository_impl.dart';
import 'package:europen_countries_app/domain/datasources/local/country_datasource_local.dart';
import 'package:europen_countries_app/domain/datasources/remote/country_datasource.dart';
import 'package:europen_countries_app/domain/repositories/countries/country_repository.dart';
import 'package:europen_countries_app/domain/usecases/countries/delete_country_usecase_impl.dart';
import 'package:europen_countries_app/domain/usecases/countries/get_countries_usecase_impl.dart';
import 'package:europen_countries_app/domain/usecases/countries/get_country_by_name_usecase_impl.dart';
import 'package:europen_countries_app/domain/usecases/countries/get_country_usecase_impl.dart';
import 'package:europen_countries_app/domain/usecases/countries/get_wish_list_country_usecase_impl.dart';
import 'package:europen_countries_app/domain/usecases/countries/post_country_usecase_impl.dart';
import 'package:europen_countries_app/presentation/blocs/countries/countries_bloc.dart';
import 'package:europen_countries_app/presentation/blocs/wish_list/wish_list_country_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../data/datasources/remote/countries/country_datasource_impl.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  //Dio`
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton<DioBase>(DioBase());

  //Database
  getIt.registerSingleton<AppDatabase>(AppDatabase());

  //DataSources
  getIt.registerSingleton<CountryDataSource>(CountryDataSourceImpl(getIt<DioBase>()));
  getIt.registerSingleton<CountryDataSourceLocal>(CountryDataSourceLocalImpl(getIt<AppDatabase>()));

  //Repositories
  getIt.registerSingleton<CountryRepository>(CountryRepositoryImpl(getIt<CountryDataSource>(), getIt<CountryDataSourceLocal>()));

  //UseCases
  getIt.registerSingleton<GetCountriesUseCase>(GetCountriesUseCaseImpl(getIt<CountryRepository>()));
  getIt.registerSingleton<PostCountryUseCase>(PostCountryUseCaseImpl(getIt<CountryRepository>()));
  getIt.registerSingleton<GetWishListCountryUseCase>(GetWishListCountryUseCaseImpl(getIt<CountryRepository>()));
  getIt.registerSingleton<DeleteCountryUseCase>(DeleteCountryUseCaseImpl(getIt<CountryRepository>()));
  getIt.registerSingleton<GetCountryUseCase>(GetCountryUseCaseImpl(getIt<CountryRepository>()));
  getIt.registerSingleton<GetCountryByNameUseCase>(GetCountryByNameUseCaseImpl(getIt<CountryRepository>()));

  //Blocs
  getIt.registerFactory(
    () => CountriesBloc(
      getIt<GetCountriesUseCase>(),
      getIt<PostCountryUseCase>(),
      getIt<GetCountryUseCase>(),
      getIt<GetCountryByNameUseCase>(),
    ),
  );
  getIt.registerFactory(() => WishListCountryBloc(getIt<GetWishListCountryUseCase>(), getIt<DeleteCountryUseCase>()));
}
