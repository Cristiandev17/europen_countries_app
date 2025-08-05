import 'package:europen_countries_app/presentation/pages/countries.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(routes: [GoRoute(path: '/', builder: (context, state) => const CountriesScreen())]);
