# europen_countries_app

Aplicación Flutter para consultar, buscar y guardar países europeos en una lista de deseos.

## Descripción

Este proyecto permite:
- Consultar la lista de países europeos.
- Buscar países por nombre.
- Guardar países en una lista de deseos (wishlist).
- Mostrar lista de deseos

## Estructura del Proyecto

- `lib/`: Código fuente principal de la aplicación.
  - `presentation/blocs/countries/`: Lógica BLoC para la gestión de países.
  - `core/usecases/countries/`: Casos de uso para operaciones con países.
  - `domain/entities/`: Entidades del dominio.
- `test/`: Pruebas unitarias y de widgets.
- `android/`, `ios/`, `linux/`, `macos/`, `windows/`, `web/`: Soporte multiplataforma.
