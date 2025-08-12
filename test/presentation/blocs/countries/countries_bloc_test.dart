import 'package:bloc_test/bloc_test.dart';
import 'package:europen_countries_app/core/usecases/countries/get_countries_usecase.dart';
import 'package:europen_countries_app/core/usecases/countries/get_country_by_name_usecase.dart';
import 'package:europen_countries_app/core/usecases/countries/get_country_usecase.dart';
import 'package:europen_countries_app/core/usecases/countries/post_country_usecase.dart';
import 'package:europen_countries_app/domain/entities/country_entity.dart';
import 'package:europen_countries_app/presentation/blocs/countries/countries_bloc.dart'
    show AddWishListCountryEvent, CountriesBloc, CountriesState, CountriesStatus, GetCountriesEvent;
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Mocks para los casos de uso
class MockGetCountriesUseCase extends Mock implements GetCountriesUseCase {}

class MockPostCountryUseCase extends Mock implements PostCountryUseCase {}

class MockGetCountryUseCase extends Mock implements GetCountryUseCase {}

class MockGetCountryByNameUseCase extends Mock implements GetCountryByNameUseCase {}

class MockAddWishListCountryUseCase extends Mock implements PostCountryUseCase {}

// Datos de prueba
final mockCountries = [
  CountryEntity(name: 'Portugal', capital: 'Lisboa', population: '1000000', currency: 'EUR', area: '1000', flag: 'test_flag.png'),
  CountryEntity(name: 'Canada', capital: 'Ottawa', population: '1000000', currency: 'CAD', area: '1000', flag: 'test_flag.png'),
];
final mockFavoriteCountry = CountryEntity(
  name: 'Portugal',
  capital: 'Lisboa',
  population: '1000000',
  currency: 'EUR',
  area: '1000',
  flag: 'test_flag.png',
);

void main() {
  late MockGetCountriesUseCase mockGetCountriesUseCase;

  late MockPostCountryUseCase mockPostCountryUseCase;
  late MockGetCountryUseCase mockGetCountryUseCase;
  late MockGetCountryByNameUseCase mockGetCountryByNameUseCase;

  late CountriesBloc countriesBloc;

  setUp(() {
    mockGetCountriesUseCase = MockGetCountriesUseCase();
    mockPostCountryUseCase = MockPostCountryUseCase();
    mockGetCountryUseCase = MockGetCountryUseCase();
    mockGetCountryByNameUseCase = MockGetCountryByNameUseCase();

    countriesBloc = CountriesBloc(
      mockGetCountriesUseCase,
      mockPostCountryUseCase,
      mockGetCountryUseCase,
      mockGetCountryByNameUseCase,
    );
  });

  tearDown(() {
    countriesBloc.close();
  });

  group('CountriesBloc', () {
    // Pruebas para GetCountriesEvent
    group('GetCountriesEvent', () {
      blocTest<CountriesBloc, CountriesState>(
        'emite [loading, success] cuando GetCountriesUseCase tiene éxito',
        build: () {
          when(() => mockGetCountriesUseCase.execute()).thenAnswer((_) async => mockCountries);
          return countriesBloc;
        },
        act: (bloc) => bloc.add(GetCountriesEvent()),
        expect:
            () => [
              CountriesState(status: CountriesStatus.loading),
              CountriesState(status: CountriesStatus.success, countries: mockCountries),
            ],
      );

      blocTest<CountriesBloc, CountriesState>(
        'emite [loading, failure] cuando GetCountriesUseCase falla',
        build: () {
          when(() => mockGetCountriesUseCase.execute()).thenThrow(Exception('Error al obtener países'));
          return countriesBloc;
        },
        act: (bloc) => bloc.add(GetCountriesEvent()),
        expect: () => [CountriesState(status: CountriesStatus.loading), CountriesState(status: CountriesStatus.failure)],
      );
    });

    // Pruebas para AddFavoriteCountryEvent
    group('AddFavoriteCountryEvent', () {
      blocTest<CountriesBloc, CountriesState>(
        'emite [loading, success] cuando PostCountryUseCase tiene éxito',
        build: () {
          when(() => mockPostCountryUseCase.execute(any())).thenAnswer((_) async {});
          return countriesBloc;
        },
        act: (bloc) => bloc.add(AddWishListCountryEvent(country: mockFavoriteCountry)),
        expect: () => [CountriesState(status: CountriesStatus.loading), CountriesState(status: CountriesStatus.success)],
        verify: (_) {
          verify(() => mockPostCountryUseCase.execute(mockFavoriteCountry)).called(1);
        },
      );

      blocTest<CountriesBloc, CountriesState>(
        'emite [loading, failure] cuando PostCountryUseCase falla',
        build: () {
          when(() => mockPostCountryUseCase.execute(any())).thenThrow(Exception('Error al guardar país favorito'));
          return countriesBloc;
        },
        act: (bloc) => bloc.add(AddWishListCountryEvent(country: mockFavoriteCountry)),
        expect: () => [CountriesState(status: CountriesStatus.loading), CountriesState(status: CountriesStatus.failure)],
        verify: (_) {
          verify(() => mockPostCountryUseCase.execute(mockFavoriteCountry)).called(1);
        },
      );
    });
  });
}
