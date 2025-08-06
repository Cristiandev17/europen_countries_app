class AppConstants {
  static const String apiUrl = 'https://restcountries.com/v3.1/';

  //Endpoints
  static const String countriesEndpoint = '/region/europe';
  static const String countryEndpoint = '/translation/';

  // Timeouts
  static const Duration connectTimeout = Duration(seconds: 15);
}
