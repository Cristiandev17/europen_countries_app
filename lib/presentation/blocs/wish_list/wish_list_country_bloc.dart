import 'package:europen_countries_app/core/usecases/countries/delete_country_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:europen_countries_app/core/usecases/countries/get_wish_list_country_usecase.dart';
import 'package:europen_countries_app/domain/entities/country_entity.dart';

part 'wish_list_country_event.dart';
part 'wish_list_country_state.dart';

class WishListCountryBloc extends Bloc<WishListCountryEvent, WishListCountryState> {
  final GetWishListCountryUseCase _getWishListCountryUseCase;
  final DeleteCountryUseCase _deleteCountryUseCase;
  WishListCountryBloc(this._getWishListCountryUseCase, this._deleteCountryUseCase) : super(WishListCountryState()) {
    on<GetWishListCountryEvent>(_getWishListCountry);
    on<DeleteCountryEvent>(_deleteCountry);
  }

  Future<void> _getWishListCountry(GetWishListCountryEvent event, Emitter<WishListCountryState> emit) async {
    emit(state.copyWith(status: WishListCountryStatus.loading));
    try {
      final result = await _getWishListCountryUseCase.execute();
      emit(state.copyWith(status: WishListCountryStatus.success, countries: result));
    } catch (e) {
      emit(state.copyWith(status: WishListCountryStatus.failure));
    }
  }

  Future<void> _deleteCountry(DeleteCountryEvent event, Emitter<WishListCountryState> emit) async {
    emit(state.copyWith(status: WishListCountryStatus.loading));
    try {
      await _deleteCountryUseCase.execute(event.country);
      emit(state.copyWith(status: WishListCountryStatus.success));
    } catch (e) {
      emit(state.copyWith(status: WishListCountryStatus.failure));
    }
  }
}
