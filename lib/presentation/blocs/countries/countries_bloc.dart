import 'package:europen_countries_app/core/usecases/countries/get_countries_usecase.dart';
import 'package:europen_countries_app/core/usecases/countries/get_country_by_name_usecase.dart';
import 'package:europen_countries_app/core/usecases/countries/post_country_usecase.dart';
import 'package:europen_countries_app/core/usecases/countries/get_country_usecase.dart';
import 'package:europen_countries_app/domain/entities/country_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'countries_event.dart';
part 'countries_state.dart';

class CountriesBloc extends Bloc<CountriesEvent, CountriesState> {
  final GetCountriesUseCase _getcountriesUseCase;
  final PostCountryUseCase _postCountryUseCase;
  final GetCountryUseCase _getCountryUseCase;
  final GetCountryByNameUseCase _getCountryByNameUseCase;

  CountriesBloc(this._getcountriesUseCase, this._postCountryUseCase, this._getCountryUseCase, this._getCountryByNameUseCase)
    : super(CountriesState()) {
    on<GetCountriesEvent>(_getcountries);
    on<AddWishListCountryEvent>(_addWishListCountry);
    on<GetCountriesByNameEvent>(_getcountriesByName);
  }

  Future<void> _getcountries(GetCountriesEvent event, Emitter<CountriesState> emit) async {
    emit(state.copyWith(status: CountriesStatus.loading));
    try {
      final result = await _getcountriesUseCase.execute();
      emit(state.copyWith(status: CountriesStatus.success, countries: result));
    } catch (e) {
      emit(state.copyWith(status: CountriesStatus.failure));
    }
  }

  Future<void> _addWishListCountry(AddWishListCountryEvent event, Emitter<CountriesState> emit) async {
    emit(state.copyWith(status: CountriesStatus.loading));
    try {
      final country = await _getCountryByNameUseCase.execute(event.country.name);

      if (country == null) {
        await _postCountryUseCase.execute(event.country);
        emit(state.copyWith(status: CountriesStatus.saved));
      } else {
        emit(state.copyWith(status: CountriesStatus.failure));
      }
    } catch (e) {
      emit(state.copyWith(status: CountriesStatus.failure));
    }
  }

  Future<void> _getcountriesByName(GetCountriesByNameEvent event, Emitter<CountriesState> emit) async {
    emit(state.copyWith(status: CountriesStatus.loading));
    try {
      final result = await _getCountryUseCase.execute(event.name);
      emit(state.copyWith(status: CountriesStatus.consulted, countrySelected: result));
    } catch (e) {
      emit(state.copyWith(status: CountriesStatus.failure));
    }
  }
}
