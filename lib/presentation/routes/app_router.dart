import 'package:europen_countries_app/core/constants/app_constants.dart';
import 'package:europen_countries_app/presentation/pages/country_detail.dart';
import 'package:europen_countries_app/presentation/pages/home.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(path: AppConstants.homeRoute, builder: (context, state) => const HomeScreen()),
    GoRoute(path: AppConstants.detailCountryRoute, builder: (context, state) => const CountryDetailScreen()),
  ],
);
