part of 'countries_bloc.dart';

sealed class CountriesState extends Equatable {
  const CountriesState();
  
  @override
  List<Object> get props => [];
}

final class CountriesInitial extends CountriesState {}
