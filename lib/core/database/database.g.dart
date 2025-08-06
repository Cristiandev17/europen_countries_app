// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $CountriesTable extends Countries
    with TableInfo<$CountriesTable, Country> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CountriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _capitalMeta = const VerificationMeta(
    'capital',
  );
  @override
  late final GeneratedColumn<String> capital = GeneratedColumn<String>(
    'capital',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _currencyMeta = const VerificationMeta(
    'currency',
  );
  @override
  late final GeneratedColumn<String> currency = GeneratedColumn<String>(
    'currency',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _flagMeta = const VerificationMeta('flag');
  @override
  late final GeneratedColumn<String> flag = GeneratedColumn<String>(
    'flag',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _populationMeta = const VerificationMeta(
    'population',
  );
  @override
  late final GeneratedColumn<String> population = GeneratedColumn<String>(
    'population',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 20,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _areaMeta = const VerificationMeta('area');
  @override
  late final GeneratedColumn<String> area = GeneratedColumn<String>(
    'area',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 20,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    capital,
    currency,
    flag,
    population,
    area,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'countries';
  @override
  VerificationContext validateIntegrity(
    Insertable<Country> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('capital')) {
      context.handle(
        _capitalMeta,
        capital.isAcceptableOrUnknown(data['capital']!, _capitalMeta),
      );
    } else if (isInserting) {
      context.missing(_capitalMeta);
    }
    if (data.containsKey('currency')) {
      context.handle(
        _currencyMeta,
        currency.isAcceptableOrUnknown(data['currency']!, _currencyMeta),
      );
    } else if (isInserting) {
      context.missing(_currencyMeta);
    }
    if (data.containsKey('flag')) {
      context.handle(
        _flagMeta,
        flag.isAcceptableOrUnknown(data['flag']!, _flagMeta),
      );
    } else if (isInserting) {
      context.missing(_flagMeta);
    }
    if (data.containsKey('population')) {
      context.handle(
        _populationMeta,
        population.isAcceptableOrUnknown(data['population']!, _populationMeta),
      );
    } else if (isInserting) {
      context.missing(_populationMeta);
    }
    if (data.containsKey('area')) {
      context.handle(
        _areaMeta,
        area.isAcceptableOrUnknown(data['area']!, _areaMeta),
      );
    } else if (isInserting) {
      context.missing(_areaMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Country map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Country(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      capital:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}capital'],
          )!,
      currency:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}currency'],
          )!,
      flag:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}flag'],
          )!,
      population:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}population'],
          )!,
      area:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}area'],
          )!,
    );
  }

  @override
  $CountriesTable createAlias(String alias) {
    return $CountriesTable(attachedDatabase, alias);
  }
}

class Country extends DataClass implements Insertable<Country> {
  final int id;
  final String name;
  final String capital;
  final String currency;
  final String flag;
  final String population;
  final String area;
  const Country({
    required this.id,
    required this.name,
    required this.capital,
    required this.currency,
    required this.flag,
    required this.population,
    required this.area,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['capital'] = Variable<String>(capital);
    map['currency'] = Variable<String>(currency);
    map['flag'] = Variable<String>(flag);
    map['population'] = Variable<String>(population);
    map['area'] = Variable<String>(area);
    return map;
  }

  CountriesCompanion toCompanion(bool nullToAbsent) {
    return CountriesCompanion(
      id: Value(id),
      name: Value(name),
      capital: Value(capital),
      currency: Value(currency),
      flag: Value(flag),
      population: Value(population),
      area: Value(area),
    );
  }

  factory Country.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Country(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      capital: serializer.fromJson<String>(json['capital']),
      currency: serializer.fromJson<String>(json['currency']),
      flag: serializer.fromJson<String>(json['flag']),
      population: serializer.fromJson<String>(json['population']),
      area: serializer.fromJson<String>(json['area']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'capital': serializer.toJson<String>(capital),
      'currency': serializer.toJson<String>(currency),
      'flag': serializer.toJson<String>(flag),
      'population': serializer.toJson<String>(population),
      'area': serializer.toJson<String>(area),
    };
  }

  Country copyWith({
    int? id,
    String? name,
    String? capital,
    String? currency,
    String? flag,
    String? population,
    String? area,
  }) => Country(
    id: id ?? this.id,
    name: name ?? this.name,
    capital: capital ?? this.capital,
    currency: currency ?? this.currency,
    flag: flag ?? this.flag,
    population: population ?? this.population,
    area: area ?? this.area,
  );
  Country copyWithCompanion(CountriesCompanion data) {
    return Country(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      capital: data.capital.present ? data.capital.value : this.capital,
      currency: data.currency.present ? data.currency.value : this.currency,
      flag: data.flag.present ? data.flag.value : this.flag,
      population:
          data.population.present ? data.population.value : this.population,
      area: data.area.present ? data.area.value : this.area,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Country(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('capital: $capital, ')
          ..write('currency: $currency, ')
          ..write('flag: $flag, ')
          ..write('population: $population, ')
          ..write('area: $area')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, capital, currency, flag, population, area);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Country &&
          other.id == this.id &&
          other.name == this.name &&
          other.capital == this.capital &&
          other.currency == this.currency &&
          other.flag == this.flag &&
          other.population == this.population &&
          other.area == this.area);
}

class CountriesCompanion extends UpdateCompanion<Country> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> capital;
  final Value<String> currency;
  final Value<String> flag;
  final Value<String> population;
  final Value<String> area;
  const CountriesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.capital = const Value.absent(),
    this.currency = const Value.absent(),
    this.flag = const Value.absent(),
    this.population = const Value.absent(),
    this.area = const Value.absent(),
  });
  CountriesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String capital,
    required String currency,
    required String flag,
    required String population,
    required String area,
  }) : name = Value(name),
       capital = Value(capital),
       currency = Value(currency),
       flag = Value(flag),
       population = Value(population),
       area = Value(area);
  static Insertable<Country> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? capital,
    Expression<String>? currency,
    Expression<String>? flag,
    Expression<String>? population,
    Expression<String>? area,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (capital != null) 'capital': capital,
      if (currency != null) 'currency': currency,
      if (flag != null) 'flag': flag,
      if (population != null) 'population': population,
      if (area != null) 'area': area,
    });
  }

  CountriesCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? capital,
    Value<String>? currency,
    Value<String>? flag,
    Value<String>? population,
    Value<String>? area,
  }) {
    return CountriesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      capital: capital ?? this.capital,
      currency: currency ?? this.currency,
      flag: flag ?? this.flag,
      population: population ?? this.population,
      area: area ?? this.area,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (capital.present) {
      map['capital'] = Variable<String>(capital.value);
    }
    if (currency.present) {
      map['currency'] = Variable<String>(currency.value);
    }
    if (flag.present) {
      map['flag'] = Variable<String>(flag.value);
    }
    if (population.present) {
      map['population'] = Variable<String>(population.value);
    }
    if (area.present) {
      map['area'] = Variable<String>(area.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CountriesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('capital: $capital, ')
          ..write('currency: $currency, ')
          ..write('flag: $flag, ')
          ..write('population: $population, ')
          ..write('area: $area')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CountriesTable countries = $CountriesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [countries];
}

typedef $$CountriesTableCreateCompanionBuilder =
    CountriesCompanion Function({
      Value<int> id,
      required String name,
      required String capital,
      required String currency,
      required String flag,
      required String population,
      required String area,
    });
typedef $$CountriesTableUpdateCompanionBuilder =
    CountriesCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> capital,
      Value<String> currency,
      Value<String> flag,
      Value<String> population,
      Value<String> area,
    });

class $$CountriesTableFilterComposer
    extends Composer<_$AppDatabase, $CountriesTable> {
  $$CountriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get capital => $composableBuilder(
    column: $table.capital,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get currency => $composableBuilder(
    column: $table.currency,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get flag => $composableBuilder(
    column: $table.flag,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get population => $composableBuilder(
    column: $table.population,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get area => $composableBuilder(
    column: $table.area,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CountriesTableOrderingComposer
    extends Composer<_$AppDatabase, $CountriesTable> {
  $$CountriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get capital => $composableBuilder(
    column: $table.capital,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get currency => $composableBuilder(
    column: $table.currency,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get flag => $composableBuilder(
    column: $table.flag,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get population => $composableBuilder(
    column: $table.population,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get area => $composableBuilder(
    column: $table.area,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CountriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CountriesTable> {
  $$CountriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get capital =>
      $composableBuilder(column: $table.capital, builder: (column) => column);

  GeneratedColumn<String> get currency =>
      $composableBuilder(column: $table.currency, builder: (column) => column);

  GeneratedColumn<String> get flag =>
      $composableBuilder(column: $table.flag, builder: (column) => column);

  GeneratedColumn<String> get population => $composableBuilder(
    column: $table.population,
    builder: (column) => column,
  );

  GeneratedColumn<String> get area =>
      $composableBuilder(column: $table.area, builder: (column) => column);
}

class $$CountriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CountriesTable,
          Country,
          $$CountriesTableFilterComposer,
          $$CountriesTableOrderingComposer,
          $$CountriesTableAnnotationComposer,
          $$CountriesTableCreateCompanionBuilder,
          $$CountriesTableUpdateCompanionBuilder,
          (Country, BaseReferences<_$AppDatabase, $CountriesTable, Country>),
          Country,
          PrefetchHooks Function()
        > {
  $$CountriesTableTableManager(_$AppDatabase db, $CountriesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$CountriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$CountriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$CountriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> capital = const Value.absent(),
                Value<String> currency = const Value.absent(),
                Value<String> flag = const Value.absent(),
                Value<String> population = const Value.absent(),
                Value<String> area = const Value.absent(),
              }) => CountriesCompanion(
                id: id,
                name: name,
                capital: capital,
                currency: currency,
                flag: flag,
                population: population,
                area: area,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required String capital,
                required String currency,
                required String flag,
                required String population,
                required String area,
              }) => CountriesCompanion.insert(
                id: id,
                name: name,
                capital: capital,
                currency: currency,
                flag: flag,
                population: population,
                area: area,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CountriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CountriesTable,
      Country,
      $$CountriesTableFilterComposer,
      $$CountriesTableOrderingComposer,
      $$CountriesTableAnnotationComposer,
      $$CountriesTableCreateCompanionBuilder,
      $$CountriesTableUpdateCompanionBuilder,
      (Country, BaseReferences<_$AppDatabase, $CountriesTable, Country>),
      Country,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CountriesTableTableManager get countries =>
      $$CountriesTableTableManager(_db, _db.countries);
}
