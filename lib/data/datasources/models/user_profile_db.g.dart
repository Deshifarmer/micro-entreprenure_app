// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_db.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetUserProfileCollectionCollection on Isar {
  IsarCollection<UserProfileCollection> get userProfileCollections =>
      this.collection();
}

const UserProfileCollectionSchema = CollectionSchema(
  name: r'UserProfileCollection',
  id: 6604425896111104206,
  properties: {
    r'account_details': PropertySchema(
      id: 0,
      name: r'account_details',
      type: IsarType.objectList,
      target: r'AccountDetailDB',
    ),
    r'channel': PropertySchema(
      id: 1,
      name: r'channel',
      type: IsarType.string,
    ),
    r'commission': PropertySchema(
      id: 2,
      name: r'commission',
      type: IsarType.string,
    ),
    r'date_of_birth': PropertySchema(
      id: 3,
      name: r'date_of_birth',
      type: IsarType.string,
    ),
    r'department': PropertySchema(
      id: 4,
      name: r'department',
      type: IsarType.string,
    ),
    r'designation': PropertySchema(
      id: 5,
      name: r'designation',
      type: IsarType.string,
    ),
    r'df_id': PropertySchema(
      id: 6,
      name: r'df_id',
      type: IsarType.string,
    ),
    r'email': PropertySchema(
      id: 7,
      name: r'email',
      type: IsarType.string,
    ),
    r'full_name': PropertySchema(
      id: 8,
      name: r'full_name',
      type: IsarType.string,
    ),
    r'gender': PropertySchema(
      id: 9,
      name: r'gender',
      type: IsarType.string,
    ),
    r'home_district': PropertySchema(
      id: 10,
      name: r'home_district',
      type: IsarType.string,
    ),
    r'joining_date': PropertySchema(
      id: 11,
      name: r'joining_date',
      type: IsarType.string,
    ),
    r'nid': PropertySchema(
      id: 12,
      name: r'nid',
      type: IsarType.long,
    ),
    r'permanent_address': PropertySchema(
      id: 13,
      name: r'permanent_address',
      type: IsarType.string,
    ),
    r'phone': PropertySchema(
      id: 14,
      name: r'phone',
      type: IsarType.string,
    ),
    r'photo': PropertySchema(
      id: 15,
      name: r'photo',
      type: IsarType.string,
    ),
    r'present_address': PropertySchema(
      id: 16,
      name: r'present_address',
      type: IsarType.string,
    ),
    r'previous_company': PropertySchema(
      id: 17,
      name: r'previous_company',
      type: IsarType.string,
    ),
    r'previous_designation': PropertySchema(
      id: 18,
      name: r'previous_designation',
      type: IsarType.string,
    ),
    r'target_volume': PropertySchema(
      id: 19,
      name: r'target_volume',
      type: IsarType.string,
    ),
    r'total_farmer': PropertySchema(
      id: 20,
      name: r'total_farmer',
      type: IsarType.long,
    ),
    r'total_sale': PropertySchema(
      id: 21,
      name: r'total_sale',
      type: IsarType.long,
    ),
    r'transactions': PropertySchema(
      id: 22,
      name: r'transactions',
      type: IsarType.objectList,
      target: r'TransactionDB',
    ),
    r'type': PropertySchema(
      id: 23,
      name: r'type',
      type: IsarType.long,
    ),
    r'updated_at': PropertySchema(
      id: 24,
      name: r'updated_at',
      type: IsarType.string,
    ),
    r'work_place': PropertySchema(
      id: 25,
      name: r'work_place',
      type: IsarType.string,
    )
  },
  estimateSize: _userProfileCollectionEstimateSize,
  serialize: _userProfileCollectionSerialize,
  deserialize: _userProfileCollectionDeserialize,
  deserializeProp: _userProfileCollectionDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {
    r'AccountDetailDB': AccountDetailDBSchema,
    r'TransactionDB': TransactionDBSchema
  },
  getId: _userProfileCollectionGetId,
  getLinks: _userProfileCollectionGetLinks,
  attach: _userProfileCollectionAttach,
  version: '3.1.0+1',
);

int _userProfileCollectionEstimateSize(
  UserProfileCollection object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final list = object.account_details;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[AccountDetailDB]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              AccountDetailDBSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final value = object.channel;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.commission;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.date_of_birth;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.department;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.designation;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.df_id;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.email;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.full_name;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.gender;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.home_district;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.joining_date;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.permanent_address;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.phone;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.photo;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.present_address;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.previous_company;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.previous_designation;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.target_volume;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final list = object.transactions;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[TransactionDB]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              TransactionDBSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final value = object.updated_at;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.work_place;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _userProfileCollectionSerialize(
  UserProfileCollection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObjectList<AccountDetailDB>(
    offsets[0],
    allOffsets,
    AccountDetailDBSchema.serialize,
    object.account_details,
  );
  writer.writeString(offsets[1], object.channel);
  writer.writeString(offsets[2], object.commission);
  writer.writeString(offsets[3], object.date_of_birth);
  writer.writeString(offsets[4], object.department);
  writer.writeString(offsets[5], object.designation);
  writer.writeString(offsets[6], object.df_id);
  writer.writeString(offsets[7], object.email);
  writer.writeString(offsets[8], object.full_name);
  writer.writeString(offsets[9], object.gender);
  writer.writeString(offsets[10], object.home_district);
  writer.writeString(offsets[11], object.joining_date);
  writer.writeLong(offsets[12], object.nid);
  writer.writeString(offsets[13], object.permanent_address);
  writer.writeString(offsets[14], object.phone);
  writer.writeString(offsets[15], object.photo);
  writer.writeString(offsets[16], object.present_address);
  writer.writeString(offsets[17], object.previous_company);
  writer.writeString(offsets[18], object.previous_designation);
  writer.writeString(offsets[19], object.target_volume);
  writer.writeLong(offsets[20], object.total_farmer);
  writer.writeLong(offsets[21], object.total_sale);
  writer.writeObjectList<TransactionDB>(
    offsets[22],
    allOffsets,
    TransactionDBSchema.serialize,
    object.transactions,
  );
  writer.writeLong(offsets[23], object.type);
  writer.writeString(offsets[24], object.updated_at);
  writer.writeString(offsets[25], object.work_place);
}

UserProfileCollection _userProfileCollectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = UserProfileCollection();
  object.account_details = reader.readObjectList<AccountDetailDB>(
    offsets[0],
    AccountDetailDBSchema.deserialize,
    allOffsets,
    AccountDetailDB(),
  );
  object.channel = reader.readStringOrNull(offsets[1]);
  object.commission = reader.readStringOrNull(offsets[2]);
  object.date_of_birth = reader.readStringOrNull(offsets[3]);
  object.department = reader.readStringOrNull(offsets[4]);
  object.designation = reader.readStringOrNull(offsets[5]);
  object.df_id = reader.readStringOrNull(offsets[6]);
  object.email = reader.readStringOrNull(offsets[7]);
  object.full_name = reader.readStringOrNull(offsets[8]);
  object.gender = reader.readStringOrNull(offsets[9]);
  object.home_district = reader.readStringOrNull(offsets[10]);
  object.id = id;
  object.joining_date = reader.readStringOrNull(offsets[11]);
  object.nid = reader.readLongOrNull(offsets[12]);
  object.permanent_address = reader.readStringOrNull(offsets[13]);
  object.phone = reader.readStringOrNull(offsets[14]);
  object.photo = reader.readStringOrNull(offsets[15]);
  object.present_address = reader.readStringOrNull(offsets[16]);
  object.previous_company = reader.readStringOrNull(offsets[17]);
  object.previous_designation = reader.readStringOrNull(offsets[18]);
  object.target_volume = reader.readStringOrNull(offsets[19]);
  object.total_farmer = reader.readLongOrNull(offsets[20]);
  object.total_sale = reader.readLongOrNull(offsets[21]);
  object.transactions = reader.readObjectList<TransactionDB>(
    offsets[22],
    TransactionDBSchema.deserialize,
    allOffsets,
    TransactionDB(),
  );
  object.type = reader.readLongOrNull(offsets[23]);
  object.updated_at = reader.readStringOrNull(offsets[24]);
  object.work_place = reader.readStringOrNull(offsets[25]);
  return object;
}

P _userProfileCollectionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectList<AccountDetailDB>(
        offset,
        AccountDetailDBSchema.deserialize,
        allOffsets,
        AccountDetailDB(),
      )) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readLongOrNull(offset)) as P;
    case 13:
      return (reader.readStringOrNull(offset)) as P;
    case 14:
      return (reader.readStringOrNull(offset)) as P;
    case 15:
      return (reader.readStringOrNull(offset)) as P;
    case 16:
      return (reader.readStringOrNull(offset)) as P;
    case 17:
      return (reader.readStringOrNull(offset)) as P;
    case 18:
      return (reader.readStringOrNull(offset)) as P;
    case 19:
      return (reader.readStringOrNull(offset)) as P;
    case 20:
      return (reader.readLongOrNull(offset)) as P;
    case 21:
      return (reader.readLongOrNull(offset)) as P;
    case 22:
      return (reader.readObjectList<TransactionDB>(
        offset,
        TransactionDBSchema.deserialize,
        allOffsets,
        TransactionDB(),
      )) as P;
    case 23:
      return (reader.readLongOrNull(offset)) as P;
    case 24:
      return (reader.readStringOrNull(offset)) as P;
    case 25:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _userProfileCollectionGetId(UserProfileCollection object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _userProfileCollectionGetLinks(
    UserProfileCollection object) {
  return [];
}

void _userProfileCollectionAttach(
    IsarCollection<dynamic> col, Id id, UserProfileCollection object) {
  object.id = id;
}

extension UserProfileCollectionQueryWhereSort
    on QueryBuilder<UserProfileCollection, UserProfileCollection, QWhere> {
  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension UserProfileCollectionQueryWhere on QueryBuilder<UserProfileCollection,
    UserProfileCollection, QWhereClause> {
  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterWhereClause>
      idNotEqualTo(Id id) {
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

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterWhereClause>
      idBetween(
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

extension UserProfileCollectionQueryFilter on QueryBuilder<
    UserProfileCollection, UserProfileCollection, QFilterCondition> {
  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> account_detailsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'account_details',
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> account_detailsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'account_details',
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> account_detailsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'account_details',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> account_detailsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'account_details',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> account_detailsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'account_details',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> account_detailsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'account_details',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> account_detailsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'account_details',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> account_detailsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'account_details',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> channelIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'channel',
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> channelIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'channel',
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> channelEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'channel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> channelGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'channel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> channelLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'channel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> channelBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'channel',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> channelStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'channel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> channelEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'channel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
          QAfterFilterCondition>
      channelContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'channel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
          QAfterFilterCondition>
      channelMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'channel',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> channelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'channel',
        value: '',
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> channelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'channel',
        value: '',
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> commissionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'commission',
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> commissionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'commission',
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> commissionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'commission',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> commissionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'commission',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> commissionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'commission',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> commissionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'commission',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> commissionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'commission',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> commissionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'commission',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
          QAfterFilterCondition>
      commissionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'commission',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
          QAfterFilterCondition>
      commissionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'commission',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> commissionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'commission',
        value: '',
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> commissionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'commission',
        value: '',
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> date_of_birthIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'date_of_birth',
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> date_of_birthIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'date_of_birth',
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> date_of_birthEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date_of_birth',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> date_of_birthGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'date_of_birth',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> date_of_birthLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'date_of_birth',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> date_of_birthBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'date_of_birth',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> date_of_birthStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'date_of_birth',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> date_of_birthEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'date_of_birth',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
          QAfterFilterCondition>
      date_of_birthContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'date_of_birth',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
          QAfterFilterCondition>
      date_of_birthMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'date_of_birth',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> date_of_birthIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date_of_birth',
        value: '',
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> date_of_birthIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'date_of_birth',
        value: '',
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> departmentIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'department',
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> departmentIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'department',
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> departmentEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'department',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> departmentGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'department',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> departmentLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'department',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> departmentBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'department',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> departmentStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'department',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> departmentEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'department',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
          QAfterFilterCondition>
      departmentContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'department',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
          QAfterFilterCondition>
      departmentMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'department',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> departmentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'department',
        value: '',
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> departmentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'department',
        value: '',
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> designationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'designation',
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> designationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'designation',
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> designationEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'designation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> designationGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'designation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> designationLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'designation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> designationBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'designation',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> designationStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'designation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> designationEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'designation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
          QAfterFilterCondition>
      designationContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'designation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
          QAfterFilterCondition>
      designationMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'designation',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> designationIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'designation',
        value: '',
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> designationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'designation',
        value: '',
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> df_idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'df_id',
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> df_idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'df_id',
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> df_idEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'df_id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> df_idGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'df_id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> df_idLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'df_id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> df_idBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'df_id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> df_idStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'df_id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> df_idEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'df_id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
          QAfterFilterCondition>
      df_idContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'df_id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
          QAfterFilterCondition>
      df_idMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'df_id',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> df_idIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'df_id',
        value: '',
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> df_idIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'df_id',
        value: '',
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> emailIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'email',
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> emailIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'email',
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> emailEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> emailGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> emailLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> emailBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'email',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> emailStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> emailEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
          QAfterFilterCondition>
      emailContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
          QAfterFilterCondition>
      emailMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'email',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> emailIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'email',
        value: '',
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> emailIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'email',
        value: '',
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> full_nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'full_name',
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> full_nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'full_name',
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> full_nameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'full_name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> full_nameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'full_name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> full_nameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'full_name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> full_nameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'full_name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> full_nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'full_name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> full_nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'full_name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
          QAfterFilterCondition>
      full_nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'full_name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
          QAfterFilterCondition>
      full_nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'full_name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> full_nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'full_name',
        value: '',
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> full_nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'full_name',
        value: '',
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> genderIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'gender',
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> genderIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'gender',
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> genderEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> genderGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'gender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> genderLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'gender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> genderBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'gender',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> genderStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'gender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> genderEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'gender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
          QAfterFilterCondition>
      genderContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'gender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
          QAfterFilterCondition>
      genderMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'gender',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> genderIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gender',
        value: '',
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> genderIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'gender',
        value: '',
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> home_districtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'home_district',
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> home_districtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'home_district',
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> home_districtEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'home_district',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> home_districtGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'home_district',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> home_districtLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'home_district',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> home_districtBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'home_district',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> home_districtStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'home_district',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> home_districtEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'home_district',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
          QAfterFilterCondition>
      home_districtContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'home_district',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
          QAfterFilterCondition>
      home_districtMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'home_district',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> home_districtIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'home_district',
        value: '',
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> home_districtIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'home_district',
        value: '',
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> idLessThan(
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

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> idBetween(
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

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> joining_dateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'joining_date',
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> joining_dateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'joining_date',
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> joining_dateEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'joining_date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> joining_dateGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'joining_date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> joining_dateLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'joining_date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> joining_dateBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'joining_date',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> joining_dateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'joining_date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> joining_dateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'joining_date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
          QAfterFilterCondition>
      joining_dateContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'joining_date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
          QAfterFilterCondition>
      joining_dateMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'joining_date',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> joining_dateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'joining_date',
        value: '',
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> joining_dateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'joining_date',
        value: '',
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> nidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'nid',
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> nidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'nid',
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> nidEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nid',
        value: value,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> nidGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nid',
        value: value,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> nidLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nid',
        value: value,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> nidBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> permanent_addressIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'permanent_address',
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> permanent_addressIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'permanent_address',
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> permanent_addressEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'permanent_address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> permanent_addressGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'permanent_address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> permanent_addressLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'permanent_address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> permanent_addressBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'permanent_address',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> permanent_addressStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'permanent_address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> permanent_addressEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'permanent_address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
          QAfterFilterCondition>
      permanent_addressContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'permanent_address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
          QAfterFilterCondition>
      permanent_addressMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'permanent_address',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> permanent_addressIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'permanent_address',
        value: '',
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> permanent_addressIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'permanent_address',
        value: '',
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> phoneIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'phone',
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> phoneIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'phone',
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> phoneEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> phoneGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> phoneLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> phoneBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'phone',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> phoneStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> phoneEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
          QAfterFilterCondition>
      phoneContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
          QAfterFilterCondition>
      phoneMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'phone',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> phoneIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'phone',
        value: '',
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> phoneIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'phone',
        value: '',
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> photoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'photo',
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> photoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'photo',
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> photoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'photo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> photoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'photo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> photoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'photo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> photoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'photo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> photoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'photo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> photoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'photo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
          QAfterFilterCondition>
      photoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'photo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
          QAfterFilterCondition>
      photoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'photo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> photoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'photo',
        value: '',
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> photoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'photo',
        value: '',
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> present_addressIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'present_address',
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> present_addressIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'present_address',
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> present_addressEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'present_address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> present_addressGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'present_address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> present_addressLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'present_address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> present_addressBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'present_address',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> present_addressStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'present_address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> present_addressEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'present_address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
          QAfterFilterCondition>
      present_addressContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'present_address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
          QAfterFilterCondition>
      present_addressMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'present_address',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> present_addressIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'present_address',
        value: '',
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> present_addressIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'present_address',
        value: '',
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> previous_companyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'previous_company',
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> previous_companyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'previous_company',
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> previous_companyEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'previous_company',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> previous_companyGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'previous_company',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> previous_companyLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'previous_company',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> previous_companyBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'previous_company',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> previous_companyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'previous_company',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> previous_companyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'previous_company',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
          QAfterFilterCondition>
      previous_companyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'previous_company',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
          QAfterFilterCondition>
      previous_companyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'previous_company',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> previous_companyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'previous_company',
        value: '',
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> previous_companyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'previous_company',
        value: '',
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> previous_designationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'previous_designation',
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> previous_designationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'previous_designation',
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> previous_designationEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'previous_designation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> previous_designationGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'previous_designation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> previous_designationLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'previous_designation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> previous_designationBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'previous_designation',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> previous_designationStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'previous_designation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> previous_designationEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'previous_designation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
          QAfterFilterCondition>
      previous_designationContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'previous_designation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
          QAfterFilterCondition>
      previous_designationMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'previous_designation',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> previous_designationIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'previous_designation',
        value: '',
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> previous_designationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'previous_designation',
        value: '',
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> target_volumeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'target_volume',
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> target_volumeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'target_volume',
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> target_volumeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'target_volume',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> target_volumeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'target_volume',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> target_volumeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'target_volume',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> target_volumeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'target_volume',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> target_volumeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'target_volume',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> target_volumeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'target_volume',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
          QAfterFilterCondition>
      target_volumeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'target_volume',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
          QAfterFilterCondition>
      target_volumeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'target_volume',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> target_volumeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'target_volume',
        value: '',
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> target_volumeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'target_volume',
        value: '',
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> total_farmerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'total_farmer',
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> total_farmerIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'total_farmer',
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> total_farmerEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'total_farmer',
        value: value,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> total_farmerGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'total_farmer',
        value: value,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> total_farmerLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'total_farmer',
        value: value,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> total_farmerBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'total_farmer',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> total_saleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'total_sale',
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> total_saleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'total_sale',
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> total_saleEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'total_sale',
        value: value,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> total_saleGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'total_sale',
        value: value,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> total_saleLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'total_sale',
        value: value,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> total_saleBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'total_sale',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> transactionsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'transactions',
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> transactionsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'transactions',
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> transactionsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'transactions',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> transactionsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'transactions',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> transactionsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'transactions',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> transactionsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'transactions',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> transactionsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'transactions',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> transactionsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'transactions',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> typeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'type',
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> typeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'type',
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> typeEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> typeGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> typeLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> typeBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'type',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> updated_atIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updated_at',
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> updated_atIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updated_at',
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> updated_atEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updated_at',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> updated_atGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'updated_at',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> updated_atLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'updated_at',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> updated_atBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'updated_at',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> updated_atStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'updated_at',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> updated_atEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'updated_at',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
          QAfterFilterCondition>
      updated_atContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'updated_at',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
          QAfterFilterCondition>
      updated_atMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'updated_at',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> updated_atIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updated_at',
        value: '',
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> updated_atIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'updated_at',
        value: '',
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> work_placeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'work_place',
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> work_placeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'work_place',
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> work_placeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'work_place',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> work_placeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'work_place',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> work_placeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'work_place',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> work_placeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'work_place',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> work_placeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'work_place',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> work_placeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'work_place',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
          QAfterFilterCondition>
      work_placeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'work_place',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
          QAfterFilterCondition>
      work_placeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'work_place',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> work_placeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'work_place',
        value: '',
      ));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> work_placeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'work_place',
        value: '',
      ));
    });
  }
}

extension UserProfileCollectionQueryObject on QueryBuilder<
    UserProfileCollection, UserProfileCollection, QFilterCondition> {
  QueryBuilder<UserProfileCollection, UserProfileCollection,
          QAfterFilterCondition>
      account_detailsElement(FilterQuery<AccountDetailDB> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'account_details');
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection,
      QAfterFilterCondition> transactionsElement(FilterQuery<TransactionDB> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'transactions');
    });
  }
}

extension UserProfileCollectionQueryLinks on QueryBuilder<UserProfileCollection,
    UserProfileCollection, QFilterCondition> {}

extension UserProfileCollectionQuerySortBy
    on QueryBuilder<UserProfileCollection, UserProfileCollection, QSortBy> {
  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
      sortByChannel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'channel', Sort.asc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
      sortByChannelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'channel', Sort.desc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
      sortByCommission() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'commission', Sort.asc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
      sortByCommissionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'commission', Sort.desc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
      sortByDate_of_birth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date_of_birth', Sort.asc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
      sortByDate_of_birthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date_of_birth', Sort.desc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
      sortByDepartment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'department', Sort.asc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
      sortByDepartmentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'department', Sort.desc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
      sortByDesignation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'designation', Sort.asc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
      sortByDesignationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'designation', Sort.desc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
      sortByDf_id() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'df_id', Sort.asc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
      sortByDf_idDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'df_id', Sort.desc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
      sortByEmail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.asc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
      sortByEmailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.desc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
      sortByFull_name() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'full_name', Sort.asc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
      sortByFull_nameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'full_name', Sort.desc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
      sortByGender() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gender', Sort.asc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
      sortByGenderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gender', Sort.desc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
      sortByHome_district() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'home_district', Sort.asc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
      sortByHome_districtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'home_district', Sort.desc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
      sortByJoining_date() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'joining_date', Sort.asc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
      sortByJoining_dateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'joining_date', Sort.desc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
      sortByNid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nid', Sort.asc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
      sortByNidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nid', Sort.desc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
      sortByPermanent_address() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'permanent_address', Sort.asc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
      sortByPermanent_addressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'permanent_address', Sort.desc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
      sortByPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.asc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
      sortByPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.desc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
      sortByPhoto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photo', Sort.asc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
      sortByPhotoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photo', Sort.desc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
      sortByPresent_address() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'present_address', Sort.asc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
      sortByPresent_addressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'present_address', Sort.desc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
      sortByPrevious_company() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'previous_company', Sort.asc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
      sortByPrevious_companyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'previous_company', Sort.desc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
      sortByPrevious_designation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'previous_designation', Sort.asc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
      sortByPrevious_designationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'previous_designation', Sort.desc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
      sortByTarget_volume() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'target_volume', Sort.asc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
      sortByTarget_volumeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'target_volume', Sort.desc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
      sortByTotal_farmer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total_farmer', Sort.asc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
      sortByTotal_farmerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total_farmer', Sort.desc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
      sortByTotal_sale() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total_sale', Sort.asc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
      sortByTotal_saleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total_sale', Sort.desc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
      sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
      sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
      sortByUpdated_at() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updated_at', Sort.asc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
      sortByUpdated_atDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updated_at', Sort.desc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
      sortByWork_place() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'work_place', Sort.asc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
      sortByWork_placeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'work_place', Sort.desc);
    });
  }
}

extension UserProfileCollectionQuerySortThenBy
    on QueryBuilder<UserProfileCollection, UserProfileCollection, QSortThenBy> {
  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
      thenByChannel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'channel', Sort.asc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
      thenByChannelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'channel', Sort.desc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
      thenByCommission() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'commission', Sort.asc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
      thenByCommissionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'commission', Sort.desc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
      thenByDate_of_birth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date_of_birth', Sort.asc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
      thenByDate_of_birthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date_of_birth', Sort.desc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
      thenByDepartment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'department', Sort.asc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
      thenByDepartmentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'department', Sort.desc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
      thenByDesignation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'designation', Sort.asc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
      thenByDesignationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'designation', Sort.desc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
      thenByDf_id() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'df_id', Sort.asc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
      thenByDf_idDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'df_id', Sort.desc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
      thenByEmail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.asc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
      thenByEmailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.desc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
      thenByFull_name() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'full_name', Sort.asc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
      thenByFull_nameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'full_name', Sort.desc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
      thenByGender() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gender', Sort.asc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
      thenByGenderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gender', Sort.desc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
      thenByHome_district() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'home_district', Sort.asc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
      thenByHome_districtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'home_district', Sort.desc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
      thenByJoining_date() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'joining_date', Sort.asc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
      thenByJoining_dateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'joining_date', Sort.desc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
      thenByNid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nid', Sort.asc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
      thenByNidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nid', Sort.desc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
      thenByPermanent_address() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'permanent_address', Sort.asc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
      thenByPermanent_addressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'permanent_address', Sort.desc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
      thenByPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.asc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
      thenByPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.desc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
      thenByPhoto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photo', Sort.asc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
      thenByPhotoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photo', Sort.desc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
      thenByPresent_address() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'present_address', Sort.asc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
      thenByPresent_addressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'present_address', Sort.desc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
      thenByPrevious_company() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'previous_company', Sort.asc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
      thenByPrevious_companyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'previous_company', Sort.desc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
      thenByPrevious_designation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'previous_designation', Sort.asc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
      thenByPrevious_designationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'previous_designation', Sort.desc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
      thenByTarget_volume() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'target_volume', Sort.asc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
      thenByTarget_volumeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'target_volume', Sort.desc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
      thenByTotal_farmer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total_farmer', Sort.asc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
      thenByTotal_farmerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total_farmer', Sort.desc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
      thenByTotal_sale() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total_sale', Sort.asc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
      thenByTotal_saleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total_sale', Sort.desc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
      thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
      thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
      thenByUpdated_at() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updated_at', Sort.asc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
      thenByUpdated_atDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updated_at', Sort.desc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
      thenByWork_place() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'work_place', Sort.asc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
      thenByWork_placeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'work_place', Sort.desc);
    });
  }
}

extension UserProfileCollectionQueryWhereDistinct
    on QueryBuilder<UserProfileCollection, UserProfileCollection, QDistinct> {
  QueryBuilder<UserProfileCollection, UserProfileCollection, QDistinct>
      distinctByChannel({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'channel', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QDistinct>
      distinctByCommission({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'commission', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QDistinct>
      distinctByDate_of_birth({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date_of_birth',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QDistinct>
      distinctByDepartment({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'department', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QDistinct>
      distinctByDesignation({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'designation', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QDistinct>
      distinctByDf_id({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'df_id', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QDistinct>
      distinctByEmail({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'email', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QDistinct>
      distinctByFull_name({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'full_name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QDistinct>
      distinctByGender({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'gender', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QDistinct>
      distinctByHome_district({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'home_district',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QDistinct>
      distinctByJoining_date({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'joining_date', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QDistinct>
      distinctByNid() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nid');
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QDistinct>
      distinctByPermanent_address({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'permanent_address',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QDistinct>
      distinctByPhone({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'phone', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QDistinct>
      distinctByPhoto({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'photo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QDistinct>
      distinctByPresent_address({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'present_address',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QDistinct>
      distinctByPrevious_company({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'previous_company',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QDistinct>
      distinctByPrevious_designation({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'previous_designation',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QDistinct>
      distinctByTarget_volume({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'target_volume',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QDistinct>
      distinctByTotal_farmer() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'total_farmer');
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QDistinct>
      distinctByTotal_sale() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'total_sale');
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QDistinct>
      distinctByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type');
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QDistinct>
      distinctByUpdated_at({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updated_at', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QDistinct>
      distinctByWork_place({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'work_place', caseSensitive: caseSensitive);
    });
  }
}

extension UserProfileCollectionQueryProperty on QueryBuilder<
    UserProfileCollection, UserProfileCollection, QQueryProperty> {
  QueryBuilder<UserProfileCollection, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<UserProfileCollection, List<AccountDetailDB>?, QQueryOperations>
      account_detailsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'account_details');
    });
  }

  QueryBuilder<UserProfileCollection, String?, QQueryOperations>
      channelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'channel');
    });
  }

  QueryBuilder<UserProfileCollection, String?, QQueryOperations>
      commissionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'commission');
    });
  }

  QueryBuilder<UserProfileCollection, String?, QQueryOperations>
      date_of_birthProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date_of_birth');
    });
  }

  QueryBuilder<UserProfileCollection, String?, QQueryOperations>
      departmentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'department');
    });
  }

  QueryBuilder<UserProfileCollection, String?, QQueryOperations>
      designationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'designation');
    });
  }

  QueryBuilder<UserProfileCollection, String?, QQueryOperations>
      df_idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'df_id');
    });
  }

  QueryBuilder<UserProfileCollection, String?, QQueryOperations>
      emailProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'email');
    });
  }

  QueryBuilder<UserProfileCollection, String?, QQueryOperations>
      full_nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'full_name');
    });
  }

  QueryBuilder<UserProfileCollection, String?, QQueryOperations>
      genderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'gender');
    });
  }

  QueryBuilder<UserProfileCollection, String?, QQueryOperations>
      home_districtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'home_district');
    });
  }

  QueryBuilder<UserProfileCollection, String?, QQueryOperations>
      joining_dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'joining_date');
    });
  }

  QueryBuilder<UserProfileCollection, int?, QQueryOperations> nidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nid');
    });
  }

  QueryBuilder<UserProfileCollection, String?, QQueryOperations>
      permanent_addressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'permanent_address');
    });
  }

  QueryBuilder<UserProfileCollection, String?, QQueryOperations>
      phoneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'phone');
    });
  }

  QueryBuilder<UserProfileCollection, String?, QQueryOperations>
      photoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'photo');
    });
  }

  QueryBuilder<UserProfileCollection, String?, QQueryOperations>
      present_addressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'present_address');
    });
  }

  QueryBuilder<UserProfileCollection, String?, QQueryOperations>
      previous_companyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'previous_company');
    });
  }

  QueryBuilder<UserProfileCollection, String?, QQueryOperations>
      previous_designationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'previous_designation');
    });
  }

  QueryBuilder<UserProfileCollection, String?, QQueryOperations>
      target_volumeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'target_volume');
    });
  }

  QueryBuilder<UserProfileCollection, int?, QQueryOperations>
      total_farmerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'total_farmer');
    });
  }

  QueryBuilder<UserProfileCollection, int?, QQueryOperations>
      total_saleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'total_sale');
    });
  }

  QueryBuilder<UserProfileCollection, List<TransactionDB>?, QQueryOperations>
      transactionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'transactions');
    });
  }

  QueryBuilder<UserProfileCollection, int?, QQueryOperations> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }

  QueryBuilder<UserProfileCollection, String?, QQueryOperations>
      updated_atProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updated_at');
    });
  }

  QueryBuilder<UserProfileCollection, String?, QQueryOperations>
      work_placeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'work_place');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const AccountDetailDBSchema = Schema(
  name: r'AccountDetailDB',
  id: 4531411895768428106,
  properties: {
    r'acc_number': PropertySchema(
      id: 0,
      name: r'acc_number',
      type: IsarType.string,
    ),
    r'created_at': PropertySchema(
      id: 1,
      name: r'created_at',
      type: IsarType.string,
    ),
    r'last_transaction': PropertySchema(
      id: 2,
      name: r'last_transaction',
      type: IsarType.string,
    ),
    r'last_transaction_ammount': PropertySchema(
      id: 3,
      name: r'last_transaction_ammount',
      type: IsarType.string,
    ),
    r'net_balance': PropertySchema(
      id: 4,
      name: r'net_balance',
      type: IsarType.string,
    ),
    r'total_credit': PropertySchema(
      id: 5,
      name: r'total_credit',
      type: IsarType.string,
    ),
    r'total_debit': PropertySchema(
      id: 6,
      name: r'total_debit',
      type: IsarType.string,
    ),
    r'updated_at': PropertySchema(
      id: 7,
      name: r'updated_at',
      type: IsarType.string,
    )
  },
  estimateSize: _accountDetailDBEstimateSize,
  serialize: _accountDetailDBSerialize,
  deserialize: _accountDetailDBDeserialize,
  deserializeProp: _accountDetailDBDeserializeProp,
);

int _accountDetailDBEstimateSize(
  AccountDetailDB object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.acc_number;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.created_at;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.last_transaction;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.last_transaction_ammount;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.net_balance;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.total_credit;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.total_debit;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.updated_at;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _accountDetailDBSerialize(
  AccountDetailDB object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.acc_number);
  writer.writeString(offsets[1], object.created_at);
  writer.writeString(offsets[2], object.last_transaction);
  writer.writeString(offsets[3], object.last_transaction_ammount);
  writer.writeString(offsets[4], object.net_balance);
  writer.writeString(offsets[5], object.total_credit);
  writer.writeString(offsets[6], object.total_debit);
  writer.writeString(offsets[7], object.updated_at);
}

AccountDetailDB _accountDetailDBDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AccountDetailDB();
  object.acc_number = reader.readStringOrNull(offsets[0]);
  object.created_at = reader.readStringOrNull(offsets[1]);
  object.last_transaction = reader.readStringOrNull(offsets[2]);
  object.last_transaction_ammount = reader.readStringOrNull(offsets[3]);
  object.net_balance = reader.readStringOrNull(offsets[4]);
  object.total_credit = reader.readStringOrNull(offsets[5]);
  object.total_debit = reader.readStringOrNull(offsets[6]);
  object.updated_at = reader.readStringOrNull(offsets[7]);
  return object;
}

P _accountDetailDBDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension AccountDetailDBQueryFilter
    on QueryBuilder<AccountDetailDB, AccountDetailDB, QFilterCondition> {
  QueryBuilder<AccountDetailDB, AccountDetailDB, QAfterFilterCondition>
      acc_numberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'acc_number',
      ));
    });
  }

  QueryBuilder<AccountDetailDB, AccountDetailDB, QAfterFilterCondition>
      acc_numberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'acc_number',
      ));
    });
  }

  QueryBuilder<AccountDetailDB, AccountDetailDB, QAfterFilterCondition>
      acc_numberEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'acc_number',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDetailDB, AccountDetailDB, QAfterFilterCondition>
      acc_numberGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'acc_number',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDetailDB, AccountDetailDB, QAfterFilterCondition>
      acc_numberLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'acc_number',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDetailDB, AccountDetailDB, QAfterFilterCondition>
      acc_numberBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'acc_number',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDetailDB, AccountDetailDB, QAfterFilterCondition>
      acc_numberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'acc_number',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDetailDB, AccountDetailDB, QAfterFilterCondition>
      acc_numberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'acc_number',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDetailDB, AccountDetailDB, QAfterFilterCondition>
      acc_numberContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'acc_number',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDetailDB, AccountDetailDB, QAfterFilterCondition>
      acc_numberMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'acc_number',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDetailDB, AccountDetailDB, QAfterFilterCondition>
      acc_numberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'acc_number',
        value: '',
      ));
    });
  }

  QueryBuilder<AccountDetailDB, AccountDetailDB, QAfterFilterCondition>
      acc_numberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'acc_number',
        value: '',
      ));
    });
  }

  QueryBuilder<AccountDetailDB, AccountDetailDB, QAfterFilterCondition>
      created_atIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'created_at',
      ));
    });
  }

  QueryBuilder<AccountDetailDB, AccountDetailDB, QAfterFilterCondition>
      created_atIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'created_at',
      ));
    });
  }

  QueryBuilder<AccountDetailDB, AccountDetailDB, QAfterFilterCondition>
      created_atEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'created_at',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDetailDB, AccountDetailDB, QAfterFilterCondition>
      created_atGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'created_at',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDetailDB, AccountDetailDB, QAfterFilterCondition>
      created_atLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'created_at',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDetailDB, AccountDetailDB, QAfterFilterCondition>
      created_atBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'created_at',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDetailDB, AccountDetailDB, QAfterFilterCondition>
      created_atStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'created_at',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDetailDB, AccountDetailDB, QAfterFilterCondition>
      created_atEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'created_at',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDetailDB, AccountDetailDB, QAfterFilterCondition>
      created_atContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'created_at',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDetailDB, AccountDetailDB, QAfterFilterCondition>
      created_atMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'created_at',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDetailDB, AccountDetailDB, QAfterFilterCondition>
      created_atIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'created_at',
        value: '',
      ));
    });
  }

  QueryBuilder<AccountDetailDB, AccountDetailDB, QAfterFilterCondition>
      created_atIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'created_at',
        value: '',
      ));
    });
  }

  QueryBuilder<AccountDetailDB, AccountDetailDB, QAfterFilterCondition>
      last_transactionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'last_transaction',
      ));
    });
  }

  QueryBuilder<AccountDetailDB, AccountDetailDB, QAfterFilterCondition>
      last_transactionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'last_transaction',
      ));
    });
  }

  QueryBuilder<AccountDetailDB, AccountDetailDB, QAfterFilterCondition>
      last_transactionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'last_transaction',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDetailDB, AccountDetailDB, QAfterFilterCondition>
      last_transactionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'last_transaction',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDetailDB, AccountDetailDB, QAfterFilterCondition>
      last_transactionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'last_transaction',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDetailDB, AccountDetailDB, QAfterFilterCondition>
      last_transactionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'last_transaction',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDetailDB, AccountDetailDB, QAfterFilterCondition>
      last_transactionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'last_transaction',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDetailDB, AccountDetailDB, QAfterFilterCondition>
      last_transactionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'last_transaction',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDetailDB, AccountDetailDB, QAfterFilterCondition>
      last_transactionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'last_transaction',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDetailDB, AccountDetailDB, QAfterFilterCondition>
      last_transactionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'last_transaction',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDetailDB, AccountDetailDB, QAfterFilterCondition>
      last_transactionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'last_transaction',
        value: '',
      ));
    });
  }

  QueryBuilder<AccountDetailDB, AccountDetailDB, QAfterFilterCondition>
      last_transactionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'last_transaction',
        value: '',
      ));
    });
  }

  QueryBuilder<AccountDetailDB, AccountDetailDB, QAfterFilterCondition>
      last_transaction_ammountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'last_transaction_ammount',
      ));
    });
  }

  QueryBuilder<AccountDetailDB, AccountDetailDB, QAfterFilterCondition>
      last_transaction_ammountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'last_transaction_ammount',
      ));
    });
  }

  QueryBuilder<AccountDetailDB, AccountDetailDB, QAfterFilterCondition>
      last_transaction_ammountEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'last_transaction_ammount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDetailDB, AccountDetailDB, QAfterFilterCondition>
      last_transaction_ammountGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'last_transaction_ammount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDetailDB, AccountDetailDB, QAfterFilterCondition>
      last_transaction_ammountLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'last_transaction_ammount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDetailDB, AccountDetailDB, QAfterFilterCondition>
      last_transaction_ammountBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'last_transaction_ammount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDetailDB, AccountDetailDB, QAfterFilterCondition>
      last_transaction_ammountStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'last_transaction_ammount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDetailDB, AccountDetailDB, QAfterFilterCondition>
      last_transaction_ammountEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'last_transaction_ammount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDetailDB, AccountDetailDB, QAfterFilterCondition>
      last_transaction_ammountContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'last_transaction_ammount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDetailDB, AccountDetailDB, QAfterFilterCondition>
      last_transaction_ammountMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'last_transaction_ammount',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDetailDB, AccountDetailDB, QAfterFilterCondition>
      last_transaction_ammountIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'last_transaction_ammount',
        value: '',
      ));
    });
  }

  QueryBuilder<AccountDetailDB, AccountDetailDB, QAfterFilterCondition>
      last_transaction_ammountIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'last_transaction_ammount',
        value: '',
      ));
    });
  }

  QueryBuilder<AccountDetailDB, AccountDetailDB, QAfterFilterCondition>
      net_balanceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'net_balance',
      ));
    });
  }

  QueryBuilder<AccountDetailDB, AccountDetailDB, QAfterFilterCondition>
      net_balanceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'net_balance',
      ));
    });
  }

  QueryBuilder<AccountDetailDB, AccountDetailDB, QAfterFilterCondition>
      net_balanceEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'net_balance',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDetailDB, AccountDetailDB, QAfterFilterCondition>
      net_balanceGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'net_balance',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDetailDB, AccountDetailDB, QAfterFilterCondition>
      net_balanceLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'net_balance',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDetailDB, AccountDetailDB, QAfterFilterCondition>
      net_balanceBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'net_balance',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDetailDB, AccountDetailDB, QAfterFilterCondition>
      net_balanceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'net_balance',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDetailDB, AccountDetailDB, QAfterFilterCondition>
      net_balanceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'net_balance',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDetailDB, AccountDetailDB, QAfterFilterCondition>
      net_balanceContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'net_balance',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDetailDB, AccountDetailDB, QAfterFilterCondition>
      net_balanceMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'net_balance',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDetailDB, AccountDetailDB, QAfterFilterCondition>
      net_balanceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'net_balance',
        value: '',
      ));
    });
  }

  QueryBuilder<AccountDetailDB, AccountDetailDB, QAfterFilterCondition>
      net_balanceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'net_balance',
        value: '',
      ));
    });
  }

  QueryBuilder<AccountDetailDB, AccountDetailDB, QAfterFilterCondition>
      total_creditIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'total_credit',
      ));
    });
  }

  QueryBuilder<AccountDetailDB, AccountDetailDB, QAfterFilterCondition>
      total_creditIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'total_credit',
      ));
    });
  }

  QueryBuilder<AccountDetailDB, AccountDetailDB, QAfterFilterCondition>
      total_creditEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'total_credit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDetailDB, AccountDetailDB, QAfterFilterCondition>
      total_creditGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'total_credit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDetailDB, AccountDetailDB, QAfterFilterCondition>
      total_creditLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'total_credit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDetailDB, AccountDetailDB, QAfterFilterCondition>
      total_creditBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'total_credit',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDetailDB, AccountDetailDB, QAfterFilterCondition>
      total_creditStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'total_credit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDetailDB, AccountDetailDB, QAfterFilterCondition>
      total_creditEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'total_credit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDetailDB, AccountDetailDB, QAfterFilterCondition>
      total_creditContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'total_credit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDetailDB, AccountDetailDB, QAfterFilterCondition>
      total_creditMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'total_credit',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDetailDB, AccountDetailDB, QAfterFilterCondition>
      total_creditIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'total_credit',
        value: '',
      ));
    });
  }

  QueryBuilder<AccountDetailDB, AccountDetailDB, QAfterFilterCondition>
      total_creditIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'total_credit',
        value: '',
      ));
    });
  }

  QueryBuilder<AccountDetailDB, AccountDetailDB, QAfterFilterCondition>
      total_debitIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'total_debit',
      ));
    });
  }

  QueryBuilder<AccountDetailDB, AccountDetailDB, QAfterFilterCondition>
      total_debitIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'total_debit',
      ));
    });
  }

  QueryBuilder<AccountDetailDB, AccountDetailDB, QAfterFilterCondition>
      total_debitEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'total_debit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDetailDB, AccountDetailDB, QAfterFilterCondition>
      total_debitGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'total_debit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDetailDB, AccountDetailDB, QAfterFilterCondition>
      total_debitLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'total_debit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDetailDB, AccountDetailDB, QAfterFilterCondition>
      total_debitBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'total_debit',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDetailDB, AccountDetailDB, QAfterFilterCondition>
      total_debitStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'total_debit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDetailDB, AccountDetailDB, QAfterFilterCondition>
      total_debitEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'total_debit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDetailDB, AccountDetailDB, QAfterFilterCondition>
      total_debitContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'total_debit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDetailDB, AccountDetailDB, QAfterFilterCondition>
      total_debitMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'total_debit',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDetailDB, AccountDetailDB, QAfterFilterCondition>
      total_debitIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'total_debit',
        value: '',
      ));
    });
  }

  QueryBuilder<AccountDetailDB, AccountDetailDB, QAfterFilterCondition>
      total_debitIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'total_debit',
        value: '',
      ));
    });
  }

  QueryBuilder<AccountDetailDB, AccountDetailDB, QAfterFilterCondition>
      updated_atIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updated_at',
      ));
    });
  }

  QueryBuilder<AccountDetailDB, AccountDetailDB, QAfterFilterCondition>
      updated_atIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updated_at',
      ));
    });
  }

  QueryBuilder<AccountDetailDB, AccountDetailDB, QAfterFilterCondition>
      updated_atEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updated_at',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDetailDB, AccountDetailDB, QAfterFilterCondition>
      updated_atGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'updated_at',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDetailDB, AccountDetailDB, QAfterFilterCondition>
      updated_atLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'updated_at',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDetailDB, AccountDetailDB, QAfterFilterCondition>
      updated_atBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'updated_at',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDetailDB, AccountDetailDB, QAfterFilterCondition>
      updated_atStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'updated_at',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDetailDB, AccountDetailDB, QAfterFilterCondition>
      updated_atEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'updated_at',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDetailDB, AccountDetailDB, QAfterFilterCondition>
      updated_atContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'updated_at',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDetailDB, AccountDetailDB, QAfterFilterCondition>
      updated_atMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'updated_at',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDetailDB, AccountDetailDB, QAfterFilterCondition>
      updated_atIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updated_at',
        value: '',
      ));
    });
  }

  QueryBuilder<AccountDetailDB, AccountDetailDB, QAfterFilterCondition>
      updated_atIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'updated_at',
        value: '',
      ));
    });
  }
}

extension AccountDetailDBQueryObject
    on QueryBuilder<AccountDetailDB, AccountDetailDB, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const TransactionDBSchema = Schema(
  name: r'TransactionDB',
  id: -6287571494649357327,
  properties: {
    r'amount': PropertySchema(
      id: 0,
      name: r'amount',
      type: IsarType.string,
    ),
    r'authorized_by': PropertySchema(
      id: 1,
      name: r'authorized_by',
      type: IsarType.string,
    ),
    r'cash_in_id': PropertySchema(
      id: 2,
      name: r'cash_in_id',
      type: IsarType.string,
    ),
    r'cash_out_id': PropertySchema(
      id: 3,
      name: r'cash_out_id',
      type: IsarType.string,
    ),
    r'created_at': PropertySchema(
      id: 4,
      name: r'created_at',
      type: IsarType.string,
    ),
    r'credited_to': PropertySchema(
      id: 5,
      name: r'credited_to',
      type: IsarType.string,
    ),
    r'debited_from': PropertySchema(
      id: 6,
      name: r'debited_from',
      type: IsarType.string,
    ),
    r'order_id': PropertySchema(
      id: 7,
      name: r'order_id',
      type: IsarType.string,
    ),
    r'transaction_id': PropertySchema(
      id: 8,
      name: r'transaction_id',
      type: IsarType.string,
    ),
    r'updated_at': PropertySchema(
      id: 9,
      name: r'updated_at',
      type: IsarType.string,
    )
  },
  estimateSize: _transactionDBEstimateSize,
  serialize: _transactionDBSerialize,
  deserialize: _transactionDBDeserialize,
  deserializeProp: _transactionDBDeserializeProp,
);

int _transactionDBEstimateSize(
  TransactionDB object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.amount;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.authorized_by;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.cash_in_id;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.cash_out_id;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.created_at;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.credited_to;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.debited_from;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.order_id;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.transaction_id;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.updated_at;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _transactionDBSerialize(
  TransactionDB object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.amount);
  writer.writeString(offsets[1], object.authorized_by);
  writer.writeString(offsets[2], object.cash_in_id);
  writer.writeString(offsets[3], object.cash_out_id);
  writer.writeString(offsets[4], object.created_at);
  writer.writeString(offsets[5], object.credited_to);
  writer.writeString(offsets[6], object.debited_from);
  writer.writeString(offsets[7], object.order_id);
  writer.writeString(offsets[8], object.transaction_id);
  writer.writeString(offsets[9], object.updated_at);
}

TransactionDB _transactionDBDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = TransactionDB();
  object.amount = reader.readStringOrNull(offsets[0]);
  object.authorized_by = reader.readStringOrNull(offsets[1]);
  object.cash_in_id = reader.readStringOrNull(offsets[2]);
  object.cash_out_id = reader.readStringOrNull(offsets[3]);
  object.created_at = reader.readStringOrNull(offsets[4]);
  object.credited_to = reader.readStringOrNull(offsets[5]);
  object.debited_from = reader.readStringOrNull(offsets[6]);
  object.order_id = reader.readStringOrNull(offsets[7]);
  object.transaction_id = reader.readStringOrNull(offsets[8]);
  object.updated_at = reader.readStringOrNull(offsets[9]);
  return object;
}

P _transactionDBDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension TransactionDBQueryFilter
    on QueryBuilder<TransactionDB, TransactionDB, QFilterCondition> {
  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      amountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'amount',
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      amountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'amount',
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      amountEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'amount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      amountGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'amount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      amountLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'amount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      amountBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'amount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      amountStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'amount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      amountEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'amount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      amountContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'amount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      amountMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'amount',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      amountIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'amount',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      amountIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'amount',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      authorized_byIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'authorized_by',
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      authorized_byIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'authorized_by',
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      authorized_byEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'authorized_by',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      authorized_byGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'authorized_by',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      authorized_byLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'authorized_by',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      authorized_byBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'authorized_by',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      authorized_byStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'authorized_by',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      authorized_byEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'authorized_by',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      authorized_byContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'authorized_by',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      authorized_byMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'authorized_by',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      authorized_byIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'authorized_by',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      authorized_byIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'authorized_by',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      cash_in_idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cash_in_id',
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      cash_in_idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cash_in_id',
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      cash_in_idEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cash_in_id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      cash_in_idGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cash_in_id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      cash_in_idLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cash_in_id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      cash_in_idBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cash_in_id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      cash_in_idStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'cash_in_id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      cash_in_idEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'cash_in_id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      cash_in_idContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'cash_in_id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      cash_in_idMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'cash_in_id',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      cash_in_idIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cash_in_id',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      cash_in_idIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'cash_in_id',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      cash_out_idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cash_out_id',
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      cash_out_idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cash_out_id',
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      cash_out_idEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cash_out_id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      cash_out_idGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cash_out_id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      cash_out_idLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cash_out_id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      cash_out_idBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cash_out_id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      cash_out_idStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'cash_out_id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      cash_out_idEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'cash_out_id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      cash_out_idContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'cash_out_id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      cash_out_idMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'cash_out_id',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      cash_out_idIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cash_out_id',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      cash_out_idIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'cash_out_id',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      created_atIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'created_at',
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      created_atIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'created_at',
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      created_atEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'created_at',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      created_atGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'created_at',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      created_atLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'created_at',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      created_atBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'created_at',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      created_atStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'created_at',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      created_atEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'created_at',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      created_atContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'created_at',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      created_atMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'created_at',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      created_atIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'created_at',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      created_atIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'created_at',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      credited_toIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'credited_to',
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      credited_toIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'credited_to',
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      credited_toEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'credited_to',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      credited_toGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'credited_to',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      credited_toLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'credited_to',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      credited_toBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'credited_to',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      credited_toStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'credited_to',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      credited_toEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'credited_to',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      credited_toContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'credited_to',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      credited_toMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'credited_to',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      credited_toIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'credited_to',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      credited_toIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'credited_to',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      debited_fromIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'debited_from',
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      debited_fromIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'debited_from',
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      debited_fromEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'debited_from',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      debited_fromGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'debited_from',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      debited_fromLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'debited_from',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      debited_fromBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'debited_from',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      debited_fromStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'debited_from',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      debited_fromEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'debited_from',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      debited_fromContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'debited_from',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      debited_fromMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'debited_from',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      debited_fromIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'debited_from',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      debited_fromIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'debited_from',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      order_idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'order_id',
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      order_idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'order_id',
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      order_idEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'order_id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      order_idGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'order_id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      order_idLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'order_id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      order_idBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'order_id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      order_idStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'order_id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      order_idEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'order_id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      order_idContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'order_id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      order_idMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'order_id',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      order_idIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'order_id',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      order_idIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'order_id',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      transaction_idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'transaction_id',
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      transaction_idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'transaction_id',
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      transaction_idEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'transaction_id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      transaction_idGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'transaction_id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      transaction_idLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'transaction_id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      transaction_idBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'transaction_id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      transaction_idStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'transaction_id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      transaction_idEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'transaction_id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      transaction_idContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'transaction_id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      transaction_idMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'transaction_id',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      transaction_idIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'transaction_id',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      transaction_idIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'transaction_id',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      updated_atIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updated_at',
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      updated_atIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updated_at',
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      updated_atEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updated_at',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      updated_atGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'updated_at',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      updated_atLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'updated_at',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      updated_atBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'updated_at',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      updated_atStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'updated_at',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      updated_atEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'updated_at',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      updated_atContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'updated_at',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      updated_atMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'updated_at',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      updated_atIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updated_at',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionDB, TransactionDB, QAfterFilterCondition>
      updated_atIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'updated_at',
        value: '',
      ));
    });
  }
}

extension TransactionDBQueryObject
    on QueryBuilder<TransactionDB, TransactionDB, QFilterCondition> {}
