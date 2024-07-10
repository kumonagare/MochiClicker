// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_item.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetItemModelCollection on Isar {
  IsarCollection<ItemModel> get itemModels => this.collection();
}

const ItemModelSchema = CollectionSchema(
  name: r'ItemModel',
  id: -5544911994646514308,
  properties: {
    r'itemCount': PropertySchema(
      id: 0,
      name: r'itemCount',
      type: IsarType.long,
    ),
    r'itemInfo': PropertySchema(
      id: 1,
      name: r'itemInfo',
      type: IsarType.string,
    ),
    r'itemName': PropertySchema(
      id: 2,
      name: r'itemName',
      type: IsarType.string,
    ),
    r'itemPrice': PropertySchema(
      id: 3,
      name: r'itemPrice',
      type: IsarType.double,
    ),
    r'itemPriceRate': PropertySchema(
      id: 4,
      name: r'itemPriceRate',
      type: IsarType.double,
    ),
    r'mpsRate': PropertySchema(
      id: 5,
      name: r'mpsRate',
      type: IsarType.double,
    )
  },
  estimateSize: _itemModelEstimateSize,
  serialize: _itemModelSerialize,
  deserialize: _itemModelDeserialize,
  deserializeProp: _itemModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _itemModelGetId,
  getLinks: _itemModelGetLinks,
  attach: _itemModelAttach,
  version: '3.1.0',
);

int _itemModelEstimateSize(
  ItemModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.itemInfo.length * 3;
  bytesCount += 3 + object.itemName.length * 3;
  return bytesCount;
}

void _itemModelSerialize(
  ItemModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.itemCount);
  writer.writeString(offsets[1], object.itemInfo);
  writer.writeString(offsets[2], object.itemName);
  writer.writeDouble(offsets[3], object.itemPrice);
  writer.writeDouble(offsets[4], object.itemPriceRate);
  writer.writeDouble(offsets[5], object.mpsRate);
}

ItemModel _itemModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ItemModel();
  object.id = id;
  object.itemCount = reader.readLong(offsets[0]);
  object.itemInfo = reader.readString(offsets[1]);
  object.itemName = reader.readString(offsets[2]);
  object.itemPrice = reader.readDouble(offsets[3]);
  object.itemPriceRate = reader.readDouble(offsets[4]);
  object.mpsRate = reader.readDouble(offsets[5]);
  return object;
}

P _itemModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readDouble(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    case 5:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _itemModelGetId(ItemModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _itemModelGetLinks(ItemModel object) {
  return [];
}

void _itemModelAttach(IsarCollection<dynamic> col, Id id, ItemModel object) {
  object.id = id;
}

extension ItemModelQueryWhereSort
    on QueryBuilder<ItemModel, ItemModel, QWhere> {
  QueryBuilder<ItemModel, ItemModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ItemModelQueryWhere
    on QueryBuilder<ItemModel, ItemModel, QWhereClause> {
  QueryBuilder<ItemModel, ItemModel, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ItemModel, ItemModel, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<ItemModel, ItemModel, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ItemModel, ItemModel, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ItemModel, ItemModel, QAfterWhereClause> idBetween(
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

extension ItemModelQueryFilter
    on QueryBuilder<ItemModel, ItemModel, QFilterCondition> {
  QueryBuilder<ItemModel, ItemModel, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ItemModel, ItemModel, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<ItemModel, ItemModel, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<ItemModel, ItemModel, QAfterFilterCondition> idBetween(
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

  QueryBuilder<ItemModel, ItemModel, QAfterFilterCondition> itemCountEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'itemCount',
        value: value,
      ));
    });
  }

  QueryBuilder<ItemModel, ItemModel, QAfterFilterCondition>
      itemCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'itemCount',
        value: value,
      ));
    });
  }

  QueryBuilder<ItemModel, ItemModel, QAfterFilterCondition> itemCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'itemCount',
        value: value,
      ));
    });
  }

  QueryBuilder<ItemModel, ItemModel, QAfterFilterCondition> itemCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'itemCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ItemModel, ItemModel, QAfterFilterCondition> itemInfoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'itemInfo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ItemModel, ItemModel, QAfterFilterCondition> itemInfoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'itemInfo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ItemModel, ItemModel, QAfterFilterCondition> itemInfoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'itemInfo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ItemModel, ItemModel, QAfterFilterCondition> itemInfoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'itemInfo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ItemModel, ItemModel, QAfterFilterCondition> itemInfoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'itemInfo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ItemModel, ItemModel, QAfterFilterCondition> itemInfoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'itemInfo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ItemModel, ItemModel, QAfterFilterCondition> itemInfoContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'itemInfo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ItemModel, ItemModel, QAfterFilterCondition> itemInfoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'itemInfo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ItemModel, ItemModel, QAfterFilterCondition> itemInfoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'itemInfo',
        value: '',
      ));
    });
  }

  QueryBuilder<ItemModel, ItemModel, QAfterFilterCondition>
      itemInfoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'itemInfo',
        value: '',
      ));
    });
  }

  QueryBuilder<ItemModel, ItemModel, QAfterFilterCondition> itemNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'itemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ItemModel, ItemModel, QAfterFilterCondition> itemNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'itemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ItemModel, ItemModel, QAfterFilterCondition> itemNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'itemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ItemModel, ItemModel, QAfterFilterCondition> itemNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'itemName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ItemModel, ItemModel, QAfterFilterCondition> itemNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'itemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ItemModel, ItemModel, QAfterFilterCondition> itemNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'itemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ItemModel, ItemModel, QAfterFilterCondition> itemNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'itemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ItemModel, ItemModel, QAfterFilterCondition> itemNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'itemName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ItemModel, ItemModel, QAfterFilterCondition> itemNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'itemName',
        value: '',
      ));
    });
  }

  QueryBuilder<ItemModel, ItemModel, QAfterFilterCondition>
      itemNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'itemName',
        value: '',
      ));
    });
  }

  QueryBuilder<ItemModel, ItemModel, QAfterFilterCondition> itemPriceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'itemPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ItemModel, ItemModel, QAfterFilterCondition>
      itemPriceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'itemPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ItemModel, ItemModel, QAfterFilterCondition> itemPriceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'itemPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ItemModel, ItemModel, QAfterFilterCondition> itemPriceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'itemPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ItemModel, ItemModel, QAfterFilterCondition>
      itemPriceRateEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'itemPriceRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ItemModel, ItemModel, QAfterFilterCondition>
      itemPriceRateGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'itemPriceRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ItemModel, ItemModel, QAfterFilterCondition>
      itemPriceRateLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'itemPriceRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ItemModel, ItemModel, QAfterFilterCondition>
      itemPriceRateBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'itemPriceRate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ItemModel, ItemModel, QAfterFilterCondition> mpsRateEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mpsRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ItemModel, ItemModel, QAfterFilterCondition> mpsRateGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'mpsRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ItemModel, ItemModel, QAfterFilterCondition> mpsRateLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'mpsRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ItemModel, ItemModel, QAfterFilterCondition> mpsRateBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'mpsRate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension ItemModelQueryObject
    on QueryBuilder<ItemModel, ItemModel, QFilterCondition> {}

extension ItemModelQueryLinks
    on QueryBuilder<ItemModel, ItemModel, QFilterCondition> {}

extension ItemModelQuerySortBy on QueryBuilder<ItemModel, ItemModel, QSortBy> {
  QueryBuilder<ItemModel, ItemModel, QAfterSortBy> sortByItemCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemCount', Sort.asc);
    });
  }

  QueryBuilder<ItemModel, ItemModel, QAfterSortBy> sortByItemCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemCount', Sort.desc);
    });
  }

  QueryBuilder<ItemModel, ItemModel, QAfterSortBy> sortByItemInfo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemInfo', Sort.asc);
    });
  }

  QueryBuilder<ItemModel, ItemModel, QAfterSortBy> sortByItemInfoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemInfo', Sort.desc);
    });
  }

  QueryBuilder<ItemModel, ItemModel, QAfterSortBy> sortByItemName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemName', Sort.asc);
    });
  }

  QueryBuilder<ItemModel, ItemModel, QAfterSortBy> sortByItemNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemName', Sort.desc);
    });
  }

  QueryBuilder<ItemModel, ItemModel, QAfterSortBy> sortByItemPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemPrice', Sort.asc);
    });
  }

  QueryBuilder<ItemModel, ItemModel, QAfterSortBy> sortByItemPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemPrice', Sort.desc);
    });
  }

  QueryBuilder<ItemModel, ItemModel, QAfterSortBy> sortByItemPriceRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemPriceRate', Sort.asc);
    });
  }

  QueryBuilder<ItemModel, ItemModel, QAfterSortBy> sortByItemPriceRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemPriceRate', Sort.desc);
    });
  }

  QueryBuilder<ItemModel, ItemModel, QAfterSortBy> sortByMpsRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mpsRate', Sort.asc);
    });
  }

  QueryBuilder<ItemModel, ItemModel, QAfterSortBy> sortByMpsRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mpsRate', Sort.desc);
    });
  }
}

extension ItemModelQuerySortThenBy
    on QueryBuilder<ItemModel, ItemModel, QSortThenBy> {
  QueryBuilder<ItemModel, ItemModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ItemModel, ItemModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ItemModel, ItemModel, QAfterSortBy> thenByItemCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemCount', Sort.asc);
    });
  }

  QueryBuilder<ItemModel, ItemModel, QAfterSortBy> thenByItemCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemCount', Sort.desc);
    });
  }

  QueryBuilder<ItemModel, ItemModel, QAfterSortBy> thenByItemInfo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemInfo', Sort.asc);
    });
  }

  QueryBuilder<ItemModel, ItemModel, QAfterSortBy> thenByItemInfoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemInfo', Sort.desc);
    });
  }

  QueryBuilder<ItemModel, ItemModel, QAfterSortBy> thenByItemName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemName', Sort.asc);
    });
  }

  QueryBuilder<ItemModel, ItemModel, QAfterSortBy> thenByItemNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemName', Sort.desc);
    });
  }

  QueryBuilder<ItemModel, ItemModel, QAfterSortBy> thenByItemPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemPrice', Sort.asc);
    });
  }

  QueryBuilder<ItemModel, ItemModel, QAfterSortBy> thenByItemPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemPrice', Sort.desc);
    });
  }

  QueryBuilder<ItemModel, ItemModel, QAfterSortBy> thenByItemPriceRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemPriceRate', Sort.asc);
    });
  }

  QueryBuilder<ItemModel, ItemModel, QAfterSortBy> thenByItemPriceRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemPriceRate', Sort.desc);
    });
  }

  QueryBuilder<ItemModel, ItemModel, QAfterSortBy> thenByMpsRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mpsRate', Sort.asc);
    });
  }

  QueryBuilder<ItemModel, ItemModel, QAfterSortBy> thenByMpsRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mpsRate', Sort.desc);
    });
  }
}

extension ItemModelQueryWhereDistinct
    on QueryBuilder<ItemModel, ItemModel, QDistinct> {
  QueryBuilder<ItemModel, ItemModel, QDistinct> distinctByItemCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'itemCount');
    });
  }

  QueryBuilder<ItemModel, ItemModel, QDistinct> distinctByItemInfo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'itemInfo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ItemModel, ItemModel, QDistinct> distinctByItemName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'itemName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ItemModel, ItemModel, QDistinct> distinctByItemPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'itemPrice');
    });
  }

  QueryBuilder<ItemModel, ItemModel, QDistinct> distinctByItemPriceRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'itemPriceRate');
    });
  }

  QueryBuilder<ItemModel, ItemModel, QDistinct> distinctByMpsRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mpsRate');
    });
  }
}

extension ItemModelQueryProperty
    on QueryBuilder<ItemModel, ItemModel, QQueryProperty> {
  QueryBuilder<ItemModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ItemModel, int, QQueryOperations> itemCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'itemCount');
    });
  }

  QueryBuilder<ItemModel, String, QQueryOperations> itemInfoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'itemInfo');
    });
  }

  QueryBuilder<ItemModel, String, QQueryOperations> itemNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'itemName');
    });
  }

  QueryBuilder<ItemModel, double, QQueryOperations> itemPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'itemPrice');
    });
  }

  QueryBuilder<ItemModel, double, QQueryOperations> itemPriceRateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'itemPriceRate');
    });
  }

  QueryBuilder<ItemModel, double, QQueryOperations> mpsRateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mpsRate');
    });
  }
}
