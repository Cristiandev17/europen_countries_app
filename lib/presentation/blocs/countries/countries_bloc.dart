import 'package:europen_countries_app/core/usecases/countries/get_countries_usecase.dart';
import 'package:europen_countries_app/domain/entities/country_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/usecases/countries/get_country_usecase.dart';

part 'countries_event.dart';
part 'countries_state.dart';

class CountriesBloc extends Bloc<CountriesEvent, CountriesState> {
  final GetCountriesUseCase _getcountriesUseCase;
 
  CountriesBloc(this._getcountriesUseCase) : super(CountriesState()) {
    on<GetCountriesEvent>(_getcountries);
    on<GetFavoriteCountriesEvent>(_getFavoriteCountries);
    on<AddFavoriteCountryEvent>(_addFavoriteCountry);
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

  Future<void> _getFavoriteCountries(GetFavoriteCountriesEvent event, Emitter<CountriesState> emit) async {
    emit(state.copyWith(status: CountriesStatus.loading));
    try {
      final result = await _getcountriesUseCase.execute();
      emit(state.copyWith(status: CountriesStatus.success, countries: result));
    } catch (e) {
      emit(state.copyWith(status: CountriesStatus.failure));
    }
  }

  Future<void> _addFavoriteCountry(AddFavoriteCountryEvent event, Emitter<CountriesState> emit) async {
    emit(state.copyWith(status: CountriesStatus.loading));
    try {
      final result = await _getcountriesUseCase.execute();
      emit(state.copyWith(status: CountriesStatus.success, countries: result));
    } catch (e) {
      emit(state.copyWith(status: CountriesStatus.failure));
    }
  }
}
