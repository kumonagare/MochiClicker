// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upgrade_item.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetUpgradeModelCollection on Isar {
  IsarCollection<UpgradeModel> get upgradeModels => this.collection();
}

const UpgradeModelSchema = CollectionSchema(
  name: r'UpgradeModel',
  id: 6612237748035181920,
  properties: {
    r'effectRate': PropertySchema(
      id: 0,
      name: r'effectRate',
      type: IsarType.double,
    ),
    r'listCount': PropertySchema(
      id: 1,
      name: r'listCount',
      type: IsarType.long,
    ),
    r'upgradeFlag': PropertySchema(
      id: 2,
      name: r'upgradeFlag',
      type: IsarType.long,
    ),
    r'upgradeItemInfo': PropertySchema(
      id: 3,
      name: r'upgradeItemInfo',
      type: IsarType.string,
    ),
    r'upgradeItemName': PropertySchema(
      id: 4,
      name: r'upgradeItemName',
      type: IsarType.string,
    ),
    r'upgradePrice': PropertySchema(
      id: 5,
      name: r'upgradePrice',
      type: IsarType.double,
    ),
    r'upgradePriceRate': PropertySchema(
      id: 6,
      name: r'upgradePriceRate',
      type: IsarType.double,
    )
  },
  estimateSize: _upgradeModelEstimateSize,
  serialize: _upgradeModelSerialize,
  deserialize: _upgradeModelDeserialize,
  deserializeProp: _upgradeModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _upgradeModelGetId,
  getLinks: _upgradeModelGetLinks,
  attach: _upgradeModelAttach,
  version: '3.1.0',
);

int _upgradeModelEstimateSize(
  UpgradeModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.upgradeItemInfo.length * 3;
  bytesCount += 3 + object.upgradeItemName.length * 3;
  return bytesCount;
}

void _upgradeModelSerialize(
  UpgradeModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.effectRate);
  writer.writeLong(offsets[1], object.listCount);
  writer.writeLong(offsets[2], object.upgradeFlag);
  writer.writeString(offsets[3], object.upgradeItemInfo);
  writer.writeString(offsets[4], object.upgradeItemName);
  writer.writeDouble(offsets[5], object.upgradePrice);
  writer.writeDouble(offsets[6], object.upgradePriceRate);
}

UpgradeModel _upgradeModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = UpgradeModel();
  object.effectRate = reader.readDouble(offsets[0]);
  object.id = id;
  object.listCount = reader.readLong(offsets[1]);
  object.upgradeFlag = reader.readLong(offsets[2]);
  object.upgradeItemInfo = reader.readString(offsets[3]);
  object.upgradeItemName = reader.readString(offsets[4]);
  object.upgradePrice = reader.readDouble(offsets[5]);
  object.upgradePriceRate = reader.readDouble(offsets[6]);
  return object;
}

P _upgradeModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readDouble(offset)) as P;
    case 6:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _upgradeModelGetId(UpgradeModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _upgradeModelGetLinks(UpgradeModel object) {
  return [];
}

void _upgradeModelAttach(
    IsarCollection<dynamic> col, Id id, UpgradeModel object) {
  object.id = id;
}

extension UpgradeModelQueryWhereSort
    on QueryBuilder<UpgradeModel, UpgradeModel, QWhere> {
  QueryBuilder<UpgradeModel, UpgradeModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension UpgradeModelQueryWhere
    on QueryBuilder<UpgradeModel, UpgradeModel, QWhereClause> {
  QueryBuilder<UpgradeModel, UpgradeModel, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<UpgradeModel, UpgradeModel, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<UpgradeModel, UpgradeModel, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<UpgradeModel, UpgradeModel, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<UpgradeModel, UpgradeModel, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension UpgradeModelQueryFilter
    on QueryBuilder<UpgradeModel, UpgradeModel, QFilterCondition> {
  QueryBuilder<UpgradeModel, UpgradeModel, QAfterFilterCondition>
      effectRateEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'effectRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UpgradeModel, UpgradeModel, QAfterFilterCondition>
      effectRateGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'effectRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UpgradeModel, UpgradeModel, QAfterFilterCondition>
      effectRateLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'effectRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UpgradeModel, UpgradeModel, QAfterFilterCondition>
      effectRateBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'effectRate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UpgradeModel, UpgradeModel, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<UpgradeModel, UpgradeModel, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<UpgradeModel, UpgradeModel, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<UpgradeModel, UpgradeModel, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UpgradeModel, UpgradeModel, QAfterFilterCondition>
      listCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'listCount',
        value: value,
      ));
    });
  }

  QueryBuilder<UpgradeModel, UpgradeModel, QAfterFilterCondition>
      listCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'listCount',
        value: value,
      ));
    });
  }

  QueryBuilder<UpgradeModel, UpgradeModel, QAfterFilterCondition>
      listCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'listCount',
        value: value,
      ));
    });
  }

  QueryBuilder<UpgradeModel, UpgradeModel, QAfterFilterCondition>
      listCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'listCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UpgradeModel, UpgradeModel, QAfterFilterCondition>
      upgradeFlagEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'upgradeFlag',
        value: value,
      ));
    });
  }

  QueryBuilder<UpgradeModel, UpgradeModel, QAfterFilterCondition>
      upgradeFlagGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'upgradeFlag',
        value: value,
      ));
    });
  }

  QueryBuilder<UpgradeModel, UpgradeModel, QAfterFilterCondition>
      upgradeFlagLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'upgradeFlag',
        value: value,
      ));
    });
  }

  QueryBuilder<UpgradeModel, UpgradeModel, QAfterFilterCondition>
      upgradeFlagBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'upgradeFlag',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UpgradeModel, UpgradeModel, QAfterFilterCondition>
      upgradeItemInfoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'upgradeItemInfo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UpgradeModel, UpgradeModel, QAfterFilterCondition>
      upgradeItemInfoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'upgradeItemInfo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UpgradeModel, UpgradeModel, QAfterFilterCondition>
      upgradeItemInfoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'upgradeItemInfo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UpgradeModel, UpgradeModel, QAfterFilterCondition>
      upgradeItemInfoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'upgradeItemInfo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UpgradeModel, UpgradeModel, QAfterFilterCondition>
      upgradeItemInfoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'upgradeItemInfo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UpgradeModel, UpgradeModel, QAfterFilterCondition>
      upgradeItemInfoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'upgradeItemInfo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UpgradeModel, UpgradeModel, QAfterFilterCondition>
      upgradeItemInfoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'upgradeItemInfo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UpgradeModel, UpgradeModel, QAfterFilterCondition>
      upgradeItemInfoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'upgradeItemInfo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UpgradeModel, UpgradeModel, QAfterFilterCondition>
      upgradeItemInfoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'upgradeItemInfo',
        value: '',
      ));
    });
  }

  QueryBuilder<UpgradeModel, UpgradeModel, QAfterFilterCondition>
      upgradeItemInfoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'upgradeItemInfo',
        value: '',
      ));
    });
  }

  QueryBuilder<UpgradeModel, UpgradeModel, QAfterFilterCondition>
      upgradeItemNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'upgradeItemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UpgradeModel, UpgradeModel, QAfterFilterCondition>
      upgradeItemNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'upgradeItemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UpgradeModel, UpgradeModel, QAfterFilterCondition>
      upgradeItemNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'upgradeItemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UpgradeModel, UpgradeModel, QAfterFilterCondition>
      upgradeItemNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'upgradeItemName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UpgradeModel, UpgradeModel, QAfterFilterCondition>
      upgradeItemNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'upgradeItemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UpgradeModel, UpgradeModel, QAfterFilterCondition>
      upgradeItemNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'upgradeItemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UpgradeModel, UpgradeModel, QAfterFilterCondition>
      upgradeItemNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'upgradeItemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UpgradeModel, UpgradeModel, QAfterFilterCondition>
      upgradeItemNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'upgradeItemName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UpgradeModel, UpgradeModel, QAfterFilterCondition>
      upgradeItemNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'upgradeItemName',
        value: '',
      ));
    });
  }

  QueryBuilder<UpgradeModel, UpgradeModel, QAfterFilterCondition>
      upgradeItemNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'upgradeItemName',
        value: '',
      ));
    });
  }

  QueryBuilder<UpgradeModel, UpgradeModel, QAfterFilterCondition>
      upgradePriceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'upgradePrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UpgradeModel, UpgradeModel, QAfterFilterCondition>
      upgradePriceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'upgradePrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UpgradeModel, UpgradeModel, QAfterFilterCondition>
      upgradePriceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'upgradePrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UpgradeModel, UpgradeModel, QAfterFilterCondition>
      upgradePriceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'upgradePrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UpgradeModel, UpgradeModel, QAfterFilterCondition>
      upgradePriceRateEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'upgradePriceRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UpgradeModel, UpgradeModel, QAfterFilterCondition>
      upgradePriceRateGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'upgradePriceRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UpgradeModel, UpgradeModel, QAfterFilterCondition>
      upgradePriceRateLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'upgradePriceRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UpgradeModel, UpgradeModel, QAfterFilterCondition>
      upgradePriceRateBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'upgradePriceRate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension UpgradeModelQueryObject
    on QueryBuilder<UpgradeModel, UpgradeModel, QFilterCondition> {}

extension UpgradeModelQueryLinks
    on QueryBuilder<UpgradeModel, UpgradeModel, QFilterCondition> {}

extension UpgradeModelQuerySortBy
    on QueryBuilder<UpgradeModel, UpgradeModel, QSortBy> {
  QueryBuilder<UpgradeModel, UpgradeModel, QAfterSortBy> sortByEffectRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'effectRate', Sort.asc);
    });
  }

  QueryBuilder<UpgradeModel, UpgradeModel, QAfterSortBy>
      sortByEffectRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'effectRate', Sort.desc);
    });
  }

  QueryBuilder<UpgradeModel, UpgradeModel, QAfterSortBy> sortByListCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'listCount', Sort.asc);
    });
  }

  QueryBuilder<UpgradeModel, UpgradeModel, QAfterSortBy> sortByListCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'listCount', Sort.desc);
    });
  }

  QueryBuilder<UpgradeModel, UpgradeModel, QAfterSortBy> sortByUpgradeFlag() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'upgradeFlag', Sort.asc);
    });
  }

  QueryBuilder<UpgradeModel, UpgradeModel, QAfterSortBy>
      sortByUpgradeFlagDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'upgradeFlag', Sort.desc);
    });
  }

  QueryBuilder<UpgradeModel, UpgradeModel, QAfterSortBy>
      sortByUpgradeItemInfo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'upgradeItemInfo', Sort.asc);
    });
  }

  QueryBuilder<UpgradeModel, UpgradeModel, QAfterSortBy>
      sortByUpgradeItemInfoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'upgradeItemInfo', Sort.desc);
    });
  }

  QueryBuilder<UpgradeModel, UpgradeModel, QAfterSortBy>
      sortByUpgradeItemName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'upgradeItemName', Sort.asc);
    });
  }

  QueryBuilder<UpgradeModel, UpgradeModel, QAfterSortBy>
      sortByUpgradeItemNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'upgradeItemName', Sort.desc);
    });
  }

  QueryBuilder<UpgradeModel, UpgradeModel, QAfterSortBy> sortByUpgradePrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'upgradePrice', Sort.asc);
    });
  }

  QueryBuilder<UpgradeModel, UpgradeModel, QAfterSortBy>
      sortByUpgradePriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'upgradePrice', Sort.desc);
    });
  }

  QueryBuilder<UpgradeModel, UpgradeModel, QAfterSortBy>
      sortByUpgradePriceRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'upgradePriceRate', Sort.asc);
    });
  }

  QueryBuilder<UpgradeModel, UpgradeModel, QAfterSortBy>
      sortByUpgradePriceRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'upgradePriceRate', Sort.desc);
    });
  }
}

extension UpgradeModelQuerySortThenBy
    on QueryBuilder<UpgradeModel, UpgradeModel, QSortThenBy> {
  QueryBuilder<UpgradeModel, UpgradeModel, QAfterSortBy> thenByEffectRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'effectRate', Sort.asc);
    });
  }

  QueryBuilder<UpgradeModel, UpgradeModel, QAfterSortBy>
      thenByEffectRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'effectRate', Sort.desc);
    });
  }

  QueryBuilder<UpgradeModel, UpgradeModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<UpgradeModel, UpgradeModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<UpgradeModel, UpgradeModel, QAfterSortBy> thenByListCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'listCount', Sort.asc);
    });
  }

  QueryBuilder<UpgradeModel, UpgradeModel, QAfterSortBy> thenByListCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'listCount', Sort.desc);
    });
  }

  QueryBuilder<UpgradeModel, UpgradeModel, QAfterSortBy> thenByUpgradeFlag() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'upgradeFlag', Sort.asc);
    });
  }

  QueryBuilder<UpgradeModel, UpgradeModel, QAfterSortBy>
      thenByUpgradeFlagDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'upgradeFlag', Sort.desc);
    });
  }

  QueryBuilder<UpgradeModel, UpgradeModel, QAfterSortBy>
      thenByUpgradeItemInfo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'upgradeItemInfo', Sort.asc);
    });
  }

  QueryBuilder<UpgradeModel, UpgradeModel, QAfterSortBy>
      thenByUpgradeItemInfoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'upgradeItemInfo', Sort.desc);
    });
  }

  QueryBuilder<UpgradeModel, UpgradeModel, QAfterSortBy>
      thenByUpgradeItemName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'upgradeItemName', Sort.asc);
    });
  }

  QueryBuilder<UpgradeModel, UpgradeModel, QAfterSortBy>
      thenByUpgradeItemNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'upgradeItemName', Sort.desc);
    });
  }

  QueryBuilder<UpgradeModel, UpgradeModel, QAfterSortBy> thenByUpgradePrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'upgradePrice', Sort.asc);
    });
  }

  QueryBuilder<UpgradeModel, UpgradeModel, QAfterSortBy>
      thenByUpgradePriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'upgradePrice', Sort.desc);
    });
  }

  QueryBuilder<UpgradeModel, UpgradeModel, QAfterSortBy>
      thenByUpgradePriceRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'upgradePriceRate', Sort.asc);
    });
  }

  QueryBuilder<UpgradeModel, UpgradeModel, QAfterSortBy>
      thenByUpgradePriceRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'upgradePriceRate', Sort.desc);
    });
  }
}

extension UpgradeModelQueryWhereDistinct
    on QueryBuilder<UpgradeModel, UpgradeModel, QDistinct> {
  QueryBuilder<UpgradeModel, UpgradeModel, QDistinct> distinctByEffectRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'effectRate');
    });
  }

  QueryBuilder<UpgradeModel, UpgradeModel, QDistinct> distinctByListCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'listCount');
    });
  }

  QueryBuilder<UpgradeModel, UpgradeModel, QDistinct> distinctByUpgradeFlag() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'upgradeFlag');
    });
  }

  QueryBuilder<UpgradeModel, UpgradeModel, QDistinct> distinctByUpgradeItemInfo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'upgradeItemInfo',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UpgradeModel, UpgradeModel, QDistinct> distinctByUpgradeItemName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'upgradeItemName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UpgradeModel, UpgradeModel, QDistinct> distinctByUpgradePrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'upgradePrice');
    });
  }

  QueryBuilder<UpgradeModel, UpgradeModel, QDistinct>
      distinctByUpgradePriceRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'upgradePriceRate');
    });
  }
}

extension UpgradeModelQueryProperty
    on QueryBuilder<UpgradeModel, UpgradeModel, QQueryProperty> {
  QueryBuilder<UpgradeModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<UpgradeModel, double, QQueryOperations> effectRateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'effectRate');
    });
  }

  QueryBuilder<UpgradeModel, int, QQueryOperations> listCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'listCount');
    });
  }

  QueryBuilder<UpgradeModel, int, QQueryOperations> upgradeFlagProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'upgradeFlag');
    });
  }

  QueryBuilder<UpgradeModel, String, QQueryOperations>
      upgradeItemInfoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'upgradeItemInfo');
    });
  }

  QueryBuilder<UpgradeModel, String, QQueryOperations>
      upgradeItemNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'upgradeItemName');
    });
  }

  QueryBuilder<UpgradeModel, double, QQueryOperations> upgradePriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'upgradePrice');
    });
  }

  QueryBuilder<UpgradeModel, double, QQueryOperations>
      upgradePriceRateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'upgradePriceRate');
    });
  }
}
