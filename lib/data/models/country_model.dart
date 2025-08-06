class CountryModel {
  final String name;
  final String capital;
  final String flag;
  final String population;
  final String currency;
  final String area;

  CountryModel.fromJson(Map<String, dynamic> json)
    : name = json['name']['common'],
      capital = json['capital'][0],
      flag = json['flags']['png'],
      population = json['population'].toString(),
      currency = json['currencies']?.values.first['name'],
      area = json['area'].toString();

  CountryModel({
    required this.name,
    required this.capital,
    required this.flag,
    required this.population,
    required this.currency,
    required this.area,
  });
}
