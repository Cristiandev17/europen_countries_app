import 'package:dio/dio.dart';
import 'package:europen_countries_app/presentation/blocs/bloc/countries_bloc.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  getIt.registerSingleton(() => Dio());

  getIt.registerFactory(() => CountriesBloc());
}
