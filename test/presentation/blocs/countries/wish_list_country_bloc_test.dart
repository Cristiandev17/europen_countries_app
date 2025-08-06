import 'package:bloc_test/bloc_test.dart';
import 'package:europen_countries_app/core/usecases/countries/delete_country_usecase.dart';
import 'package:europen_countries_app/core/usecases/countries/get_wish_list_country_usecase.dart';
import 'package:europen_countries_app/domain/entities/country_entity.dart';
import 'package:europen_countries_app/presentation/blocs/wish_list/wish_list_country_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Mocks para los casos de uso
class MockGetWishListCountryUseCase extends Mock implements GetWishListCountryUseCase {}

class MockDeleteCountryUseCase extends Mock implements DeleteCountryUseCase {}

// Datos de prueba
final mockWishListCountries = [
  CountryEntity(name: 'Japan', capital: 'Tokyo', population: '1000000', currency: 'JPY', area: '1000', flag: 'test_flag.png'),
  CountryEntity(name: 'Italy', capital: 'Rome', population: '1000000', currency: 'EUR', area: '1000', flag: 'test_flag.png'),
];
final mockCountryToDelete = CountryEntity(
  name: 'France',
  capital: 'Paris',
  population: '1000000',
  currency: 'EUR',
  area: '1000',
  flag: 'test_flag.png',
);

void main() {
  late MockGetWishListCountryUseCase mockGetWishListCountryUseCase;
  late MockDeleteCountryUseCase mockDeleteCountryUseCase;
  late WishListCountryBloc wishListCountryBloc;

  setUp(() {
    mockGetWishListCountryUseCase = MockGetWishListCountryUseCase();
    mockDeleteCountryUseCase = MockDeleteCountryUseCase();
    wishListCountryBloc = WishListCountryBloc(mockGetWishListCountryUseCase, mockDeleteCountryUseCase);
  });

  tearDown(() {
    wishListCountryBloc.close();
  });

  group('WishListCountryBloc', () {
    // Estado inicial
    test('initial state is WishListCountryState', () {
      expect(wishListCountryBloc.state, equals(WishListCountryState()));
    });

    // Pruebas para GetWishListCountryEvent
    group('GetWishListCountryEvent', () {
      blocTest<WishListCountryBloc, WishListCountryState>(
        'emite [loading, success] cuando la obtención de la lista es exitosa',
        build: () {
          when(() => mockGetWishListCountryUseCase.execute()).thenAnswer((_) async => mockWishListCountries);
          return wishListCountryBloc;
        },
        act: (bloc) => bloc.add(GetWishListCountryEvent()),
        expect:
            () => [
              WishListCountryState().copyWith(status: WishListCountryStatus.loading),
              WishListCountryState().copyWith(status: WishListCountryStatus.success, countries: mockWishListCountries),
            ],
        verify: (_) {
          verify(() => mockGetWishListCountryUseCase.execute()).called(1);
        },
      );

      blocTest<WishListCountryBloc, WishListCountryState>(
        'emite [loading, failure] cuando la obtención de la lista falla',
        build: () {
          when(() => mockGetWishListCountryUseCase.execute()).thenThrow(Exception('Error al obtener la lista'));
          return wishListCountryBloc;
        },
        act: (bloc) => bloc.add(GetWishListCountryEvent()),
        expect:
            () => [
              WishListCountryState().copyWith(status: WishListCountryStatus.loading),
              WishListCountryState().copyWith(status: WishListCountryStatus.failure),
            ],
      );
    });

    // Pruebas para DeleteCountryEvent
    group('DeleteCountryEvent', () {
      blocTest<WishListCountryBloc, WishListCountryState>(
        'emite [loading, success] cuando la eliminación es exitosa',
        build: () {
          when(() => mockDeleteCountryUseCase.execute(any())).thenAnswer((_) async {});
          return wishListCountryBloc;
        },
        act: (bloc) => bloc.add(DeleteCountryEvent(country: mockCountryToDelete)),
        expect:
            () => [
              WishListCountryState().copyWith(status: WishListCountryStatus.loading),
              WishListCountryState().copyWith(status: WishListCountryStatus.success),
            ],
        verify: (_) {
          verify(() => mockDeleteCountryUseCase.execute(mockCountryToDelete)).called(1);
        },
      );

      blocTest<WishListCountryBloc, WishListCountryState>(
        'emite [loading, failure] cuando la eliminación falla',
        build: () {
          when(() => mockDeleteCountryUseCase.execute(any())).thenThrow(Exception('Error al eliminar el país'));
          return wishListCountryBloc;
        },
        act: (bloc) => bloc.add(DeleteCountryEvent(country: mockCountryToDelete)),
        expect:
            () => [
              WishListCountryState().copyWith(status: WishListCountryStatus.loading),
              WishListCountryState().copyWith(status: WishListCountryStatus.failure),
            ],
      );
    });

    // Prueba de interacción entre eventos
    blocTest<WishListCountryBloc, WishListCountryState>(
      'puede manejar eventos secuenciales correctamente',
      build: () {
        when(() => mockGetWishListCountryUseCase.execute()).thenAnswer((_) async => mockWishListCountries);
        when(() => mockDeleteCountryUseCase.execute(any())).thenAnswer((_) async {});
        return wishListCountryBloc;
      },
      act: (bloc) {
        bloc.add(GetWishListCountryEvent());
        bloc.add(DeleteCountryEvent(country: mockCountryToDelete));
      },
      expect:
          () => [
            // Estados para GetWishListCountryEvent
            WishListCountryState().copyWith(status: WishListCountryStatus.loading),
            WishListCountryState().copyWith(status: WishListCountryStatus.success, countries: mockWishListCountries),
            // Estados para DeleteCountryEvent
            WishListCountryState(status: WishListCountryStatus.loading, countries: mockWishListCountries),
            WishListCountryState(status: WishListCountryStatus.success, countries: mockWishListCountries),
          ],
    );
  });
}
