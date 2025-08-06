import 'package:europen_countries_app/core/services/injection_container.dart';
import 'package:europen_countries_app/core/usecases/countries/delete_country_usecase.dart';
import 'package:europen_countries_app/core/usecases/countries/get_countries_usecase.dart';
import 'package:europen_countries_app/core/usecases/countries/get_country_by_name_usecase.dart';
import 'package:europen_countries_app/core/usecases/countries/get_country_usecase.dart';
import 'package:europen_countries_app/core/usecases/countries/get_wish_list_country_usecase.dart';
import 'package:europen_countries_app/core/usecases/countries/post_country_usecase.dart';
import 'package:europen_countries_app/presentation/blocs/countries/countries_bloc.dart';
import 'package:europen_countries_app/presentation/blocs/wish_list/wish_list_country_bloc.dart';
import 'package:europen_countries_app/presentation/routes/app_router.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) => CountriesBloc(
                getIt<GetCountriesUseCase>(),
                getIt<PostCountryUseCase>(),
                getIt<GetCountryUseCase>(),
                getIt<GetCountryByNameUseCase>(),
              ),
        ),
        BlocProvider(create: (context) => WishListCountryBloc(getIt<GetWishListCountryUseCase>(), getIt<DeleteCountryUseCase>())),
      ],
      child: MaterialApp.router(
        showPerformanceOverlay: true,
        themeMode: ThemeMode.system,
        darkTheme: FlexThemeData.dark(scheme: FlexScheme.shadBlue),
        theme: FlexThemeData.light(scheme: FlexScheme.shadBlue),
        debugShowCheckedModeBanner: false,
        routerConfig: appRouter,
      ),
    );
  }
}
