class CountryEntity {
  final String name;
  final String capital;
  final String flag;
  final String population;
  final String currency;
  final String area;

  CountryEntity({
    required this.name,
    required this.capital,
    required this.flag,
    required this.population,
    required this.currency,
    required this.area,
  });

  static CountryEntity empty() {
    return CountryEntity(name: '', capital: '', flag: '', population: '', currency: '', area: '');
  }
}
