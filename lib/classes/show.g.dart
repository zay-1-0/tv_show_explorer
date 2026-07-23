// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetShowCollection on Isar {
  IsarCollection<Show> get shows => this.collection();
}

const ShowSchema = CollectionSchema(
  name: r'Show',
  id: -6908538570691309390,
  properties: {
    r'daysOfShowing': PropertySchema(
      id: 0,
      name: r'daysOfShowing',
      type: IsarType.stringList,
    ),
    r'genres': PropertySchema(
      id: 1,
      name: r'genres',
      type: IsarType.stringList,
    ),
    r'imageURL': PropertySchema(
      id: 2,
      name: r'imageURL',
      type: IsarType.string,
    ),
    r'isFavorite': PropertySchema(
      id: 3,
      name: r'isFavorite',
      type: IsarType.bool,
    ),
    r'network': PropertySchema(id: 4, name: r'network', type: IsarType.string),
    r'posterURL': PropertySchema(
      id: 5,
      name: r'posterURL',
      type: IsarType.string,
    ),
    r'rating': PropertySchema(id: 6, name: r'rating', type: IsarType.double),
    r'runTimeEnd': PropertySchema(
      id: 7,
      name: r'runTimeEnd',
      type: IsarType.long,
    ),
    r'runTimeStart': PropertySchema(
      id: 8,
      name: r'runTimeStart',
      type: IsarType.long,
    ),
    r'runtime': PropertySchema(id: 9, name: r'runtime', type: IsarType.long),
    r'status': PropertySchema(id: 10, name: r'status', type: IsarType.string),
    r'summary': PropertySchema(id: 11, name: r'summary', type: IsarType.string),
    r'timeOfShowing': PropertySchema(
      id: 12,
      name: r'timeOfShowing',
      type: IsarType.string,
    ),
    r'title': PropertySchema(id: 13, name: r'title', type: IsarType.string),
  },

  estimateSize: _showEstimateSize,
  serialize: _showSerialize,
  deserialize: _showDeserialize,
  deserializeProp: _showDeserializeProp,
  idName: r'showID',
  indexes: {
    r'isFavorite': IndexSchema(
      id: 5742774614603939776,
      name: r'isFavorite',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'isFavorite',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _showGetId,
  getLinks: _showGetLinks,
  attach: _showAttach,
  version: '3.3.2',
);

int _showEstimateSize(
  Show object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.daysOfShowing.length * 3;
  {
    for (var i = 0; i < object.daysOfShowing.length; i++) {
      final value = object.daysOfShowing[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.genres.length * 3;
  {
    for (var i = 0; i < object.genres.length; i++) {
      final value = object.genres[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.imageURL.length * 3;
  bytesCount += 3 + object.network.length * 3;
  bytesCount += 3 + object.posterURL.length * 3;
  bytesCount += 3 + object.status.length * 3;
  bytesCount += 3 + object.summary.length * 3;
  bytesCount += 3 + object.timeOfShowing.length * 3;
  bytesCount += 3 + object.title.length * 3;
  return bytesCount;
}

void _showSerialize(
  Show object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeStringList(offsets[0], object.daysOfShowing);
  writer.writeStringList(offsets[1], object.genres);
  writer.writeString(offsets[2], object.imageURL);
  writer.writeBool(offsets[3], object.isFavorite);
  writer.writeString(offsets[4], object.network);
  writer.writeString(offsets[5], object.posterURL);
  writer.writeDouble(offsets[6], object.rating);
  writer.writeLong(offsets[7], object.runTimeEnd);
  writer.writeLong(offsets[8], object.runTimeStart);
  writer.writeLong(offsets[9], object.runtime);
  writer.writeString(offsets[10], object.status);
  writer.writeString(offsets[11], object.summary);
  writer.writeString(offsets[12], object.timeOfShowing);
  writer.writeString(offsets[13], object.title);
}

Show _showDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Show(showID: id);
  object.daysOfShowing = reader.readStringList(offsets[0]) ?? [];
  object.genres = reader.readStringList(offsets[1]) ?? [];
  object.imageURL = reader.readString(offsets[2]);
  object.isFavorite = reader.readBool(offsets[3]);
  object.network = reader.readString(offsets[4]);
  object.posterURL = reader.readString(offsets[5]);
  object.rating = reader.readDouble(offsets[6]);
  object.runTimeEnd = reader.readLong(offsets[7]);
  object.runTimeStart = reader.readLong(offsets[8]);
  object.runtime = reader.readLong(offsets[9]);
  object.status = reader.readString(offsets[10]);
  object.summary = reader.readString(offsets[11]);
  object.timeOfShowing = reader.readString(offsets[12]);
  object.title = reader.readString(offsets[13]);
  return object;
}

P _showDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringList(offset) ?? []) as P;
    case 1:
      return (reader.readStringList(offset) ?? []) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readDouble(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    case 8:
      return (reader.readLong(offset)) as P;
    case 9:
      return (reader.readLong(offset)) as P;
    case 10:
      return (reader.readString(offset)) as P;
    case 11:
      return (reader.readString(offset)) as P;
    case 12:
      return (reader.readString(offset)) as P;
    case 13:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _showGetId(Show object) {
  return object.showID;
}

List<IsarLinkBase<dynamic>> _showGetLinks(Show object) {
  return [];
}

void _showAttach(IsarCollection<dynamic> col, Id id, Show object) {
  object.showID = id;
}

extension ShowQueryWhereSort on QueryBuilder<Show, Show, QWhere> {
  QueryBuilder<Show, Show, QAfterWhere> anyShowID() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<Show, Show, QAfterWhere> anyIsFavorite() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'isFavorite'),
      );
    });
  }
}

extension ShowQueryWhere on QueryBuilder<Show, Show, QWhereClause> {
  QueryBuilder<Show, Show, QAfterWhereClause> showIDEqualTo(Id showID) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(lower: showID, upper: showID),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterWhereClause> showIDNotEqualTo(Id showID) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: showID, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: showID, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: showID, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: showID, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Show, Show, QAfterWhereClause> showIDGreaterThan(
    Id showID, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: showID, includeLower: include),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterWhereClause> showIDLessThan(
    Id showID, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: showID, includeUpper: include),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterWhereClause> showIDBetween(
    Id lowerShowID,
    Id upperShowID, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerShowID,
          includeLower: includeLower,
          upper: upperShowID,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterWhereClause> isFavoriteEqualTo(
    bool isFavorite,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'isFavorite', value: [isFavorite]),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterWhereClause> isFavoriteNotEqualTo(
    bool isFavorite,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'isFavorite',
                lower: [],
                upper: [isFavorite],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'isFavorite',
                lower: [isFavorite],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'isFavorite',
                lower: [isFavorite],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'isFavorite',
                lower: [],
                upper: [isFavorite],
                includeUpper: false,
              ),
            );
      }
    });
  }
}

extension ShowQueryFilter on QueryBuilder<Show, Show, QFilterCondition> {
  QueryBuilder<Show, Show, QAfterFilterCondition> daysOfShowingElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'daysOfShowing',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition>
  daysOfShowingElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'daysOfShowing',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> daysOfShowingElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'daysOfShowing',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> daysOfShowingElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'daysOfShowing',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition>
  daysOfShowingElementStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'daysOfShowing',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> daysOfShowingElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'daysOfShowing',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> daysOfShowingElementContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'daysOfShowing',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> daysOfShowingElementMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'daysOfShowing',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition>
  daysOfShowingElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'daysOfShowing', value: ''),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition>
  daysOfShowingElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'daysOfShowing', value: ''),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> daysOfShowingLengthEqualTo(
    int length,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'daysOfShowing', length, true, length, true);
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> daysOfShowingIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'daysOfShowing', 0, true, 0, true);
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> daysOfShowingIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'daysOfShowing', 0, false, 999999, true);
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> daysOfShowingLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'daysOfShowing', 0, true, length, include);
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition>
  daysOfShowingLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'daysOfShowing', length, include, 999999, true);
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> daysOfShowingLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'daysOfShowing',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> genresElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'genres',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> genresElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'genres',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> genresElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'genres',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> genresElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'genres',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> genresElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'genres',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> genresElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'genres',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> genresElementContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'genres',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> genresElementMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'genres',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> genresElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'genres', value: ''),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> genresElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'genres', value: ''),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> genresLengthEqualTo(
    int length,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'genres', length, true, length, true);
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> genresIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'genres', 0, true, 0, true);
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> genresIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'genres', 0, false, 999999, true);
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> genresLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'genres', 0, true, length, include);
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> genresLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'genres', length, include, 999999, true);
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> genresLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'genres',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> imageURLEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'imageURL',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> imageURLGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'imageURL',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> imageURLLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'imageURL',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> imageURLBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'imageURL',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> imageURLStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'imageURL',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> imageURLEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'imageURL',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> imageURLContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'imageURL',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> imageURLMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'imageURL',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> imageURLIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'imageURL', value: ''),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> imageURLIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'imageURL', value: ''),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> isFavoriteEqualTo(
    bool value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isFavorite', value: value),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> networkEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'network',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> networkGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'network',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> networkLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'network',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> networkBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'network',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> networkStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'network',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> networkEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'network',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> networkContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'network',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> networkMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'network',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> networkIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'network', value: ''),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> networkIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'network', value: ''),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> posterURLEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'posterURL',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> posterURLGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'posterURL',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> posterURLLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'posterURL',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> posterURLBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'posterURL',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> posterURLStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'posterURL',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> posterURLEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'posterURL',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> posterURLContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'posterURL',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> posterURLMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'posterURL',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> posterURLIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'posterURL', value: ''),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> posterURLIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'posterURL', value: ''),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> ratingEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'rating',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> ratingGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'rating',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> ratingLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'rating',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> ratingBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'rating',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> runTimeEndEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'runTimeEnd', value: value),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> runTimeEndGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'runTimeEnd',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> runTimeEndLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'runTimeEnd',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> runTimeEndBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'runTimeEnd',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> runTimeStartEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'runTimeStart', value: value),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> runTimeStartGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'runTimeStart',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> runTimeStartLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'runTimeStart',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> runTimeStartBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'runTimeStart',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> runtimeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'runtime', value: value),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> runtimeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'runtime',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> runtimeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'runtime',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> runtimeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'runtime',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> showIDEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'showID', value: value),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> showIDGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'showID',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> showIDLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'showID',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> showIDBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'showID',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> statusEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'status',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> statusGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'status',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> statusLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'status',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> statusBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'status',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> statusStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'status',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> statusEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'status',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> statusContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'status',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> statusMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'status',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'status', value: ''),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'status', value: ''),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> summaryEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'summary',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> summaryGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'summary',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> summaryLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'summary',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> summaryBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'summary',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> summaryStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'summary',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> summaryEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'summary',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> summaryContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'summary',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> summaryMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'summary',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> summaryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'summary', value: ''),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> summaryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'summary', value: ''),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> timeOfShowingEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'timeOfShowing',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> timeOfShowingGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'timeOfShowing',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> timeOfShowingLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'timeOfShowing',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> timeOfShowingBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'timeOfShowing',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> timeOfShowingStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'timeOfShowing',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> timeOfShowingEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'timeOfShowing',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> timeOfShowingContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'timeOfShowing',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> timeOfShowingMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'timeOfShowing',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> timeOfShowingIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'timeOfShowing', value: ''),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> timeOfShowingIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'timeOfShowing', value: ''),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> titleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> titleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> titleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> titleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'title',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> titleContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> titleMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'title',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'title', value: ''),
      );
    });
  }

  QueryBuilder<Show, Show, QAfterFilterCondition> titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'title', value: ''),
      );
    });
  }
}

extension ShowQueryObject on QueryBuilder<Show, Show, QFilterCondition> {}

extension ShowQueryLinks on QueryBuilder<Show, Show, QFilterCondition> {}

extension ShowQuerySortBy on QueryBuilder<Show, Show, QSortBy> {
  QueryBuilder<Show, Show, QAfterSortBy> sortByImageURL() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageURL', Sort.asc);
    });
  }

  QueryBuilder<Show, Show, QAfterSortBy> sortByImageURLDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageURL', Sort.desc);
    });
  }

  QueryBuilder<Show, Show, QAfterSortBy> sortByIsFavorite() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavorite', Sort.asc);
    });
  }

  QueryBuilder<Show, Show, QAfterSortBy> sortByIsFavoriteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavorite', Sort.desc);
    });
  }

  QueryBuilder<Show, Show, QAfterSortBy> sortByNetwork() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'network', Sort.asc);
    });
  }

  QueryBuilder<Show, Show, QAfterSortBy> sortByNetworkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'network', Sort.desc);
    });
  }

  QueryBuilder<Show, Show, QAfterSortBy> sortByPosterURL() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'posterURL', Sort.asc);
    });
  }

  QueryBuilder<Show, Show, QAfterSortBy> sortByPosterURLDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'posterURL', Sort.desc);
    });
  }

  QueryBuilder<Show, Show, QAfterSortBy> sortByRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rating', Sort.asc);
    });
  }

  QueryBuilder<Show, Show, QAfterSortBy> sortByRatingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rating', Sort.desc);
    });
  }

  QueryBuilder<Show, Show, QAfterSortBy> sortByRunTimeEnd() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'runTimeEnd', Sort.asc);
    });
  }

  QueryBuilder<Show, Show, QAfterSortBy> sortByRunTimeEndDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'runTimeEnd', Sort.desc);
    });
  }

  QueryBuilder<Show, Show, QAfterSortBy> sortByRunTimeStart() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'runTimeStart', Sort.asc);
    });
  }

  QueryBuilder<Show, Show, QAfterSortBy> sortByRunTimeStartDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'runTimeStart', Sort.desc);
    });
  }

  QueryBuilder<Show, Show, QAfterSortBy> sortByRuntime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'runtime', Sort.asc);
    });
  }

  QueryBuilder<Show, Show, QAfterSortBy> sortByRuntimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'runtime', Sort.desc);
    });
  }

  QueryBuilder<Show, Show, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<Show, Show, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<Show, Show, QAfterSortBy> sortBySummary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'summary', Sort.asc);
    });
  }

  QueryBuilder<Show, Show, QAfterSortBy> sortBySummaryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'summary', Sort.desc);
    });
  }

  QueryBuilder<Show, Show, QAfterSortBy> sortByTimeOfShowing() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeOfShowing', Sort.asc);
    });
  }

  QueryBuilder<Show, Show, QAfterSortBy> sortByTimeOfShowingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeOfShowing', Sort.desc);
    });
  }

  QueryBuilder<Show, Show, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<Show, Show, QAfterSortBy> sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }
}

extension ShowQuerySortThenBy on QueryBuilder<Show, Show, QSortThenBy> {
  QueryBuilder<Show, Show, QAfterSortBy> thenByImageURL() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageURL', Sort.asc);
    });
  }

  QueryBuilder<Show, Show, QAfterSortBy> thenByImageURLDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageURL', Sort.desc);
    });
  }

  QueryBuilder<Show, Show, QAfterSortBy> thenByIsFavorite() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavorite', Sort.asc);
    });
  }

  QueryBuilder<Show, Show, QAfterSortBy> thenByIsFavoriteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavorite', Sort.desc);
    });
  }

  QueryBuilder<Show, Show, QAfterSortBy> thenByNetwork() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'network', Sort.asc);
    });
  }

  QueryBuilder<Show, Show, QAfterSortBy> thenByNetworkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'network', Sort.desc);
    });
  }

  QueryBuilder<Show, Show, QAfterSortBy> thenByPosterURL() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'posterURL', Sort.asc);
    });
  }

  QueryBuilder<Show, Show, QAfterSortBy> thenByPosterURLDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'posterURL', Sort.desc);
    });
  }

  QueryBuilder<Show, Show, QAfterSortBy> thenByRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rating', Sort.asc);
    });
  }

  QueryBuilder<Show, Show, QAfterSortBy> thenByRatingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rating', Sort.desc);
    });
  }

  QueryBuilder<Show, Show, QAfterSortBy> thenByRunTimeEnd() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'runTimeEnd', Sort.asc);
    });
  }

  QueryBuilder<Show, Show, QAfterSortBy> thenByRunTimeEndDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'runTimeEnd', Sort.desc);
    });
  }

  QueryBuilder<Show, Show, QAfterSortBy> thenByRunTimeStart() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'runTimeStart', Sort.asc);
    });
  }

  QueryBuilder<Show, Show, QAfterSortBy> thenByRunTimeStartDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'runTimeStart', Sort.desc);
    });
  }

  QueryBuilder<Show, Show, QAfterSortBy> thenByRuntime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'runtime', Sort.asc);
    });
  }

  QueryBuilder<Show, Show, QAfterSortBy> thenByRuntimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'runtime', Sort.desc);
    });
  }

  QueryBuilder<Show, Show, QAfterSortBy> thenByShowID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showID', Sort.asc);
    });
  }

  QueryBuilder<Show, Show, QAfterSortBy> thenByShowIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showID', Sort.desc);
    });
  }

  QueryBuilder<Show, Show, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<Show, Show, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<Show, Show, QAfterSortBy> thenBySummary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'summary', Sort.asc);
    });
  }

  QueryBuilder<Show, Show, QAfterSortBy> thenBySummaryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'summary', Sort.desc);
    });
  }

  QueryBuilder<Show, Show, QAfterSortBy> thenByTimeOfShowing() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeOfShowing', Sort.asc);
    });
  }

  QueryBuilder<Show, Show, QAfterSortBy> thenByTimeOfShowingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeOfShowing', Sort.desc);
    });
  }

  QueryBuilder<Show, Show, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<Show, Show, QAfterSortBy> thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }
}

extension ShowQueryWhereDistinct on QueryBuilder<Show, Show, QDistinct> {
  QueryBuilder<Show, Show, QDistinct> distinctByDaysOfShowing() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'daysOfShowing');
    });
  }

  QueryBuilder<Show, Show, QDistinct> distinctByGenres() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'genres');
    });
  }

  QueryBuilder<Show, Show, QDistinct> distinctByImageURL({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'imageURL', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Show, Show, QDistinct> distinctByIsFavorite() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isFavorite');
    });
  }

  QueryBuilder<Show, Show, QDistinct> distinctByNetwork({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'network', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Show, Show, QDistinct> distinctByPosterURL({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'posterURL', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Show, Show, QDistinct> distinctByRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rating');
    });
  }

  QueryBuilder<Show, Show, QDistinct> distinctByRunTimeEnd() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'runTimeEnd');
    });
  }

  QueryBuilder<Show, Show, QDistinct> distinctByRunTimeStart() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'runTimeStart');
    });
  }

  QueryBuilder<Show, Show, QDistinct> distinctByRuntime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'runtime');
    });
  }

  QueryBuilder<Show, Show, QDistinct> distinctByStatus({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Show, Show, QDistinct> distinctBySummary({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'summary', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Show, Show, QDistinct> distinctByTimeOfShowing({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'timeOfShowing',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<Show, Show, QDistinct> distinctByTitle({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }
}

extension ShowQueryProperty on QueryBuilder<Show, Show, QQueryProperty> {
  QueryBuilder<Show, int, QQueryOperations> showIDProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'showID');
    });
  }

  QueryBuilder<Show, List<String>, QQueryOperations> daysOfShowingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'daysOfShowing');
    });
  }

  QueryBuilder<Show, List<String>, QQueryOperations> genresProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'genres');
    });
  }

  QueryBuilder<Show, String, QQueryOperations> imageURLProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'imageURL');
    });
  }

  QueryBuilder<Show, bool, QQueryOperations> isFavoriteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isFavorite');
    });
  }

  QueryBuilder<Show, String, QQueryOperations> networkProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'network');
    });
  }

  QueryBuilder<Show, String, QQueryOperations> posterURLProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'posterURL');
    });
  }

  QueryBuilder<Show, double, QQueryOperations> ratingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rating');
    });
  }

  QueryBuilder<Show, int, QQueryOperations> runTimeEndProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'runTimeEnd');
    });
  }

  QueryBuilder<Show, int, QQueryOperations> runTimeStartProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'runTimeStart');
    });
  }

  QueryBuilder<Show, int, QQueryOperations> runtimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'runtime');
    });
  }

  QueryBuilder<Show, String, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<Show, String, QQueryOperations> summaryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'summary');
    });
  }

  QueryBuilder<Show, String, QQueryOperations> timeOfShowingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timeOfShowing');
    });
  }

  QueryBuilder<Show, String, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }
}
