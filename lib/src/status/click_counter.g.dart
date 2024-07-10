// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'click_counter.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetClickModelCollection on Isar {
  IsarCollection<ClickModel> get clickModels => this.collection();
}

const ClickModelSchema = CollectionSchema(
  name: r'ClickModel',
  id: -4060262918028761269,
  properties: {
    r'count': PropertySchema(
      id: 0,
      name: r'count',
      type: IsarType.double,
    ),
    r'mps': PropertySchema(
      id: 1,
      name: r'mps',
      type: IsarType.double,
    ),
    r'mpsFlag': PropertySchema(
      id: 2,
      name: r'mpsFlag',
      type: IsarType.long,
    ),
    r'totalCount': PropertySchema(
      id: 3,
      name: r'totalCount',
      type: IsarType.double,
    )
  },
  estimateSize: _clickModelEstimateSize,
  serialize: _clickModelSerialize,
  deserialize: _clickModelDeserialize,
  deserializeProp: _clickModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _clickModelGetId,
  getLinks: _clickModelGetLinks,
  attach: _clickModelAttach,
  version: '3.1.0',
);

int _clickModelEstimateSize(
  ClickModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _clickModelSerialize(
  ClickModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.count);
  writer.writeDouble(offsets[1], object.mps);
  writer.writeLong(offsets[2], object.mpsFlag);
  writer.writeDouble(offsets[3], object.totalCount);
}

ClickModel _clickModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ClickModel();
  object.count = reader.readDouble(offsets[0]);
  object.id = id;
  object.mps = reader.readDouble(offsets[1]);
  object.mpsFlag = reader.readLong(offsets[2]);
  object.totalCount = reader.readDouble(offsets[3]);
  return object;
}

P _clickModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readDouble(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _clickModelGetId(ClickModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _clickModelGetLinks(ClickModel object) {
  return [];
}

void _clickModelAttach(IsarCollection<dynamic> col, Id id, ClickModel object) {
  object.id = id;
}

extension ClickModelQueryWhereSort
    on QueryBuilder<ClickModel, ClickModel, QWhere> {
  QueryBuilder<ClickModel, ClickModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ClickModelQueryWhere
    on QueryBuilder<ClickModel, ClickModel, QWhereClause> {
  QueryBuilder<ClickModel, ClickModel, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ClickModel, ClickModel, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<ClickModel, ClickModel, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ClickModel, ClickModel, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ClickModel, ClickModel, QAfterWhereClause> idBetween(
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

extension ClickModelQueryFilter
    on QueryBuilder<ClickModel, ClickModel, QFilterCondition> {
  QueryBuilder<ClickModel, ClickModel, QAfterFilterCondition> countEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'count',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ClickModel, ClickModel, QAfterFilterCondition> countGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'count',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ClickModel, ClickModel, QAfterFilterCondition> countLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'count',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ClickModel, ClickModel, QAfterFilterCondition> countBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'count',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ClickModel, ClickModel, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ClickModel, ClickModel, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<ClickModel, ClickModel, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<ClickModel, ClickModel, QAfterFilterCondition> idBetween(
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

  QueryBuilder<ClickModel, ClickModel, QAfterFilterCondition> mpsEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mps',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ClickModel, ClickModel, QAfterFilterCondition> mpsGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'mps',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ClickModel, ClickModel, QAfterFilterCondition> mpsLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'mps',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ClickModel, ClickModel, QAfterFilterCondition> mpsBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'mps',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ClickModel, ClickModel, QAfterFilterCondition> mpsFlagEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mpsFlag',
        value: value,
      ));
    });
  }

  QueryBuilder<ClickModel, ClickModel, QAfterFilterCondition>
      mpsFlagGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'mpsFlag',
        value: value,
      ));
    });
  }

  QueryBuilder<ClickModel, ClickModel, QAfterFilterCondition> mpsFlagLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'mpsFlag',
        value: value,
      ));
    });
  }

  QueryBuilder<ClickModel, ClickModel, QAfterFilterCondition> mpsFlagBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'mpsFlag',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ClickModel, ClickModel, QAfterFilterCondition> totalCountEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalCount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ClickModel, ClickModel, QAfterFilterCondition>
      totalCountGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalCount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ClickModel, ClickModel, QAfterFilterCondition>
      totalCountLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalCount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ClickModel, ClickModel, QAfterFilterCondition> totalCountBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension ClickModelQueryObject
    on QueryBuilder<ClickModel, ClickModel, QFilterCondition> {}

extension ClickModelQueryLinks
    on QueryBuilder<ClickModel, ClickModel, QFilterCondition> {}

extension ClickModelQuerySortBy
    on QueryBuilder<ClickModel, ClickModel, QSortBy> {
  QueryBuilder<ClickModel, ClickModel, QAfterSortBy> sortByCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'count', Sort.asc);
    });
  }

  QueryBuilder<ClickModel, ClickModel, QAfterSortBy> sortByCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'count', Sort.desc);
    });
  }

  QueryBuilder<ClickModel, ClickModel, QAfterSortBy> sortByMps() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mps', Sort.asc);
    });
  }

  QueryBuilder<ClickModel, ClickModel, QAfterSortBy> sortByMpsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mps', Sort.desc);
    });
  }

  QueryBuilder<ClickModel, ClickModel, QAfterSortBy> sortByMpsFlag() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mpsFlag', Sort.asc);
    });
  }

  QueryBuilder<ClickModel, ClickModel, QAfterSortBy> sortByMpsFlagDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mpsFlag', Sort.desc);
    });
  }

  QueryBuilder<ClickModel, ClickModel, QAfterSortBy> sortByTotalCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCount', Sort.asc);
    });
  }

  QueryBuilder<ClickModel, ClickModel, QAfterSortBy> sortByTotalCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCount', Sort.desc);
    });
  }
}

extension ClickModelQuerySortThenBy
    on QueryBuilder<ClickModel, ClickModel, QSortThenBy> {
  QueryBuilder<ClickModel, ClickModel, QAfterSortBy> thenByCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'count', Sort.asc);
    });
  }

  QueryBuilder<ClickModel, ClickModel, QAfterSortBy> thenByCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'count', Sort.desc);
    });
  }

  QueryBuilder<ClickModel, ClickModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ClickModel, ClickModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ClickModel, ClickModel, QAfterSortBy> thenByMps() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mps', Sort.asc);
    });
  }

  QueryBuilder<ClickModel, ClickModel, QAfterSortBy> thenByMpsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mps', Sort.desc);
    });
  }

  QueryBuilder<ClickModel, ClickModel, QAfterSortBy> thenByMpsFlag() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mpsFlag', Sort.asc);
    });
  }

  QueryBuilder<ClickModel, ClickModel, QAfterSortBy> thenByMpsFlagDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mpsFlag', Sort.desc);
    });
  }

  QueryBuilder<ClickModel, ClickModel, QAfterSortBy> thenByTotalCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCount', Sort.asc);
    });
  }

  QueryBuilder<ClickModel, ClickModel, QAfterSortBy> thenByTotalCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCount', Sort.desc);
    });
  }
}

extension ClickModelQueryWhereDistinct
    on QueryBuilder<ClickModel, ClickModel, QDistinct> {
  QueryBuilder<ClickModel, ClickModel, QDistinct> distinctByCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'count');
    });
  }

  QueryBuilder<ClickModel, ClickModel, QDistinct> distinctByMps() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mps');
    });
  }

  QueryBuilder<ClickModel, ClickModel, QDistinct> distinctByMpsFlag() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mpsFlag');
    });
  }

  QueryBuilder<ClickModel, ClickModel, QDistinct> distinctByTotalCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalCount');
    });
  }
}

extension ClickModelQueryProperty
    on QueryBuilder<ClickModel, ClickModel, QQueryProperty> {
  QueryBuilder<ClickModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ClickModel, double, QQueryOperations> countProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'count');
    });
  }

  QueryBuilder<ClickModel, double, QQueryOperations> mpsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mps');
    });
  }

  QueryBuilder<ClickModel, int, QQueryOperations> mpsFlagProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mpsFlag');
    });
  }

  QueryBuilder<ClickModel, double, QQueryOperations> totalCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalCount');
    });
  }
}
