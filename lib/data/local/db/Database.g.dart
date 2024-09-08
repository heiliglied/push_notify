// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Database.dart';

// ignore_for_file: type=lint
class $PushNotiTable extends PushNoti
    with TableInfo<$PushNotiTable, PushNotiData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PushNotiTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _contentsMeta =
      const VerificationMeta('contents');
  @override
  late final GeneratedColumn<String> contents = GeneratedColumn<String>(
      'contents', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<bool> status = GeneratedColumn<bool>(
      'status', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("status" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns => [id, date, title, contents, status];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'push_noti';
  @override
  VerificationContext validateIntegrity(Insertable<PushNotiData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('contents')) {
      context.handle(_contentsMeta,
          contents.isAcceptableOrUnknown(data['contents']!, _contentsMeta));
    } else if (isInserting) {
      context.missing(_contentsMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PushNotiData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PushNotiData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      contents: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}contents'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}status'])!,
    );
  }

  @override
  $PushNotiTable createAlias(String alias) {
    return $PushNotiTable(attachedDatabase, alias);
  }
}

class PushNotiData extends DataClass implements Insertable<PushNotiData> {
  final int id;
  final DateTime date;
  final String title;
  final String contents;
  final bool status;
  const PushNotiData(
      {required this.id,
      required this.date,
      required this.title,
      required this.contents,
      required this.status});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['date'] = Variable<DateTime>(date);
    map['title'] = Variable<String>(title);
    map['contents'] = Variable<String>(contents);
    map['status'] = Variable<bool>(status);
    return map;
  }

  PushNotiCompanion toCompanion(bool nullToAbsent) {
    return PushNotiCompanion(
      id: Value(id),
      date: Value(date),
      title: Value(title),
      contents: Value(contents),
      status: Value(status),
    );
  }

  factory PushNotiData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PushNotiData(
      id: serializer.fromJson<int>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
      title: serializer.fromJson<String>(json['title']),
      contents: serializer.fromJson<String>(json['contents']),
      status: serializer.fromJson<bool>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'date': serializer.toJson<DateTime>(date),
      'title': serializer.toJson<String>(title),
      'contents': serializer.toJson<String>(contents),
      'status': serializer.toJson<bool>(status),
    };
  }

  PushNotiData copyWith(
          {int? id,
          DateTime? date,
          String? title,
          String? contents,
          bool? status}) =>
      PushNotiData(
        id: id ?? this.id,
        date: date ?? this.date,
        title: title ?? this.title,
        contents: contents ?? this.contents,
        status: status ?? this.status,
      );
  @override
  String toString() {
    return (StringBuffer('PushNotiData(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('title: $title, ')
          ..write('contents: $contents, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, date, title, contents, status);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PushNotiData &&
          other.id == this.id &&
          other.date == this.date &&
          other.title == this.title &&
          other.contents == this.contents &&
          other.status == this.status);
}

class PushNotiCompanion extends UpdateCompanion<PushNotiData> {
  final Value<int> id;
  final Value<DateTime> date;
  final Value<String> title;
  final Value<String> contents;
  final Value<bool> status;
  const PushNotiCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.title = const Value.absent(),
    this.contents = const Value.absent(),
    this.status = const Value.absent(),
  });
  PushNotiCompanion.insert({
    this.id = const Value.absent(),
    required DateTime date,
    required String title,
    required String contents,
    required bool status,
  })  : date = Value(date),
        title = Value(title),
        contents = Value(contents),
        status = Value(status);
  static Insertable<PushNotiData> custom({
    Expression<int>? id,
    Expression<DateTime>? date,
    Expression<String>? title,
    Expression<String>? contents,
    Expression<bool>? status,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (title != null) 'title': title,
      if (contents != null) 'contents': contents,
      if (status != null) 'status': status,
    });
  }

  PushNotiCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? date,
      Value<String>? title,
      Value<String>? contents,
      Value<bool>? status}) {
    return PushNotiCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      title: title ?? this.title,
      contents: contents ?? this.contents,
      status: status ?? this.status,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (contents.present) {
      map['contents'] = Variable<String>(contents.value);
    }
    if (status.present) {
      map['status'] = Variable<bool>(status.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PushNotiCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('title: $title, ')
          ..write('contents: $contents, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(e);
  late final $PushNotiTable pushNoti = $PushNotiTable(this);
  late final PushNotiDao pushNotiDao = PushNotiDao(this as AppDb);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [pushNoti];
}
