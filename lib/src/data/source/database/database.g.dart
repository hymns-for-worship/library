// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class Users extends Table with TableInfo<Users, User> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Users(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'PRIMARY KEY NOT NULL');
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _usernameMeta =
      const VerificationMeta('username');
  late final GeneratedColumn<String> username = GeneratedColumn<String>(
      'username', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _avatarMeta = const VerificationMeta('avatar');
  late final GeneratedColumn<String> avatar = GeneratedColumn<String>(
      'avatar', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _uidMeta = const VerificationMeta('uid');
  late final GeneratedColumn<String> uid = GeneratedColumn<String>(
      'uid', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _createdMeta =
      const VerificationMeta('created');
  late final GeneratedColumn<DateTime> created = GeneratedColumn<DateTime>(
      'created', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _updatedMeta =
      const VerificationMeta('updated');
  late final GeneratedColumn<DateTime> updated = GeneratedColumn<DateTime>(
      'updated', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, username, email, avatar, uid, created, updated];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(Insertable<User> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('username')) {
      context.handle(_usernameMeta,
          username.isAcceptableOrUnknown(data['username']!, _usernameMeta));
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    }
    if (data.containsKey('avatar')) {
      context.handle(_avatarMeta,
          avatar.isAcceptableOrUnknown(data['avatar']!, _avatarMeta));
    }
    if (data.containsKey('uid')) {
      context.handle(
          _uidMeta, uid.isAcceptableOrUnknown(data['uid']!, _uidMeta));
    }
    if (data.containsKey('created')) {
      context.handle(_createdMeta,
          created.isAcceptableOrUnknown(data['created']!, _createdMeta));
    } else if (isInserting) {
      context.missing(_createdMeta);
    }
    if (data.containsKey('updated')) {
      context.handle(_updatedMeta,
          updated.isAcceptableOrUnknown(data['updated']!, _updatedMeta));
    } else if (isInserting) {
      context.missing(_updatedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return User(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      username: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}username']),
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email']),
      avatar: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}avatar']),
      uid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uid']),
      created: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created'])!,
      updated: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated'])!,
    );
  }

  @override
  Users createAlias(String alias) {
    return Users(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class User extends DataClass implements Insertable<User> {
  String id;
  String name;
  String? username;
  String? email;
  String? avatar;
  String? uid;
  DateTime created;
  DateTime updated;
  User(
      {required this.id,
      required this.name,
      this.username,
      this.email,
      this.avatar,
      this.uid,
      required this.created,
      required this.updated});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || username != null) {
      map['username'] = Variable<String>(username);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || avatar != null) {
      map['avatar'] = Variable<String>(avatar);
    }
    if (!nullToAbsent || uid != null) {
      map['uid'] = Variable<String>(uid);
    }
    map['created'] = Variable<DateTime>(created);
    map['updated'] = Variable<DateTime>(updated);
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: Value(id),
      name: Value(name),
      username: username == null && nullToAbsent
          ? const Value.absent()
          : Value(username),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
      avatar:
          avatar == null && nullToAbsent ? const Value.absent() : Value(avatar),
      uid: uid == null && nullToAbsent ? const Value.absent() : Value(uid),
      created: Value(created),
      updated: Value(updated),
    );
  }

  factory User.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return User(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      username: serializer.fromJson<String?>(json['username']),
      email: serializer.fromJson<String?>(json['email']),
      avatar: serializer.fromJson<String?>(json['avatar']),
      uid: serializer.fromJson<String?>(json['uid']),
      created: serializer.fromJson<DateTime>(json['created']),
      updated: serializer.fromJson<DateTime>(json['updated']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'username': serializer.toJson<String?>(username),
      'email': serializer.toJson<String?>(email),
      'avatar': serializer.toJson<String?>(avatar),
      'uid': serializer.toJson<String?>(uid),
      'created': serializer.toJson<DateTime>(created),
      'updated': serializer.toJson<DateTime>(updated),
    };
  }

  User copyWith(
          {String? id,
          String? name,
          Value<String?> username = const Value.absent(),
          Value<String?> email = const Value.absent(),
          Value<String?> avatar = const Value.absent(),
          Value<String?> uid = const Value.absent(),
          DateTime? created,
          DateTime? updated}) =>
      User(
        id: id ?? this.id,
        name: name ?? this.name,
        username: username.present ? username.value : this.username,
        email: email.present ? email.value : this.email,
        avatar: avatar.present ? avatar.value : this.avatar,
        uid: uid.present ? uid.value : this.uid,
        created: created ?? this.created,
        updated: updated ?? this.updated,
      );
  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('username: $username, ')
          ..write('email: $email, ')
          ..write('avatar: $avatar, ')
          ..write('uid: $uid, ')
          ..write('created: $created, ')
          ..write('updated: $updated')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, username, email, avatar, uid, created, updated);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.id == this.id &&
          other.name == this.name &&
          other.username == this.username &&
          other.email == this.email &&
          other.avatar == this.avatar &&
          other.uid == this.uid &&
          other.created == this.created &&
          other.updated == this.updated);
}

class UsersCompanion extends UpdateCompanion<User> {
  Value<String> id;
  Value<String> name;
  Value<String?> username;
  Value<String?> email;
  Value<String?> avatar;
  Value<String?> uid;
  Value<DateTime> created;
  Value<DateTime> updated;
  Value<int> rowid;
  UsersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.username = const Value.absent(),
    this.email = const Value.absent(),
    this.avatar = const Value.absent(),
    this.uid = const Value.absent(),
    this.created = const Value.absent(),
    this.updated = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UsersCompanion.insert({
    required String id,
    required String name,
    this.username = const Value.absent(),
    this.email = const Value.absent(),
    this.avatar = const Value.absent(),
    this.uid = const Value.absent(),
    required DateTime created,
    required DateTime updated,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        created = Value(created),
        updated = Value(updated);
  static Insertable<User> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? username,
    Expression<String>? email,
    Expression<String>? avatar,
    Expression<String>? uid,
    Expression<DateTime>? created,
    Expression<DateTime>? updated,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (username != null) 'username': username,
      if (email != null) 'email': email,
      if (avatar != null) 'avatar': avatar,
      if (uid != null) 'uid': uid,
      if (created != null) 'created': created,
      if (updated != null) 'updated': updated,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UsersCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String?>? username,
      Value<String?>? email,
      Value<String?>? avatar,
      Value<String?>? uid,
      Value<DateTime>? created,
      Value<DateTime>? updated,
      Value<int>? rowid}) {
    return UsersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      username: username ?? this.username,
      email: email ?? this.email,
      avatar: avatar ?? this.avatar,
      uid: uid ?? this.uid,
      created: created ?? this.created,
      updated: updated ?? this.updated,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (avatar.present) {
      map['avatar'] = Variable<String>(avatar.value);
    }
    if (uid.present) {
      map['uid'] = Variable<String>(uid.value);
    }
    if (created.present) {
      map['created'] = Variable<DateTime>(created.value);
    }
    if (updated.present) {
      map['updated'] = Variable<DateTime>(updated.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('username: $username, ')
          ..write('email: $email, ')
          ..write('avatar: $avatar, ')
          ..write('uid: $uid, ')
          ..write('created: $created, ')
          ..write('updated: $updated, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class RequestCache extends Table
    with TableInfo<RequestCache, RequestCacheData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  RequestCache(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'PRIMARY KEY AUTOINCREMENT NOT NULL');
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
      'url', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _headersMeta =
      const VerificationMeta('headers');
  late final GeneratedColumn<String> headers = GeneratedColumn<String>(
      'headers', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _bodyMeta = const VerificationMeta('body');
  late final GeneratedColumn<Uint8List> body = GeneratedColumn<Uint8List>(
      'body', aliasedName, false,
      type: DriftSqlType.blob,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _createdMeta =
      const VerificationMeta('created');
  late final GeneratedColumn<DateTime> created = GeneratedColumn<DateTime>(
      'created', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _updatedMeta =
      const VerificationMeta('updated');
  late final GeneratedColumn<DateTime> updated = GeneratedColumn<DateTime>(
      'updated', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns =>
      [id, url, headers, body, created, updated];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'request_cache';
  @override
  VerificationContext validateIntegrity(Insertable<RequestCacheData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('url')) {
      context.handle(
          _urlMeta, url.isAcceptableOrUnknown(data['url']!, _urlMeta));
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    if (data.containsKey('headers')) {
      context.handle(_headersMeta,
          headers.isAcceptableOrUnknown(data['headers']!, _headersMeta));
    } else if (isInserting) {
      context.missing(_headersMeta);
    }
    if (data.containsKey('body')) {
      context.handle(
          _bodyMeta, body.isAcceptableOrUnknown(data['body']!, _bodyMeta));
    } else if (isInserting) {
      context.missing(_bodyMeta);
    }
    if (data.containsKey('created')) {
      context.handle(_createdMeta,
          created.isAcceptableOrUnknown(data['created']!, _createdMeta));
    } else if (isInserting) {
      context.missing(_createdMeta);
    }
    if (data.containsKey('updated')) {
      context.handle(_updatedMeta,
          updated.isAcceptableOrUnknown(data['updated']!, _updatedMeta));
    } else if (isInserting) {
      context.missing(_updatedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {url, headers},
      ];
  @override
  RequestCacheData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RequestCacheData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      url: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}url'])!,
      headers: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}headers'])!,
      body: attachedDatabase.typeMapping
          .read(DriftSqlType.blob, data['${effectivePrefix}body'])!,
      created: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created'])!,
      updated: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated'])!,
    );
  }

  @override
  RequestCache createAlias(String alias) {
    return RequestCache(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const ['UNIQUE(url, headers)'];
  @override
  bool get dontWriteConstraints => true;
}

class RequestCacheData extends DataClass
    implements Insertable<RequestCacheData> {
  int id;
  String url;
  String headers;
  Uint8List body;
  DateTime created;
  DateTime updated;
  RequestCacheData(
      {required this.id,
      required this.url,
      required this.headers,
      required this.body,
      required this.created,
      required this.updated});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['url'] = Variable<String>(url);
    map['headers'] = Variable<String>(headers);
    map['body'] = Variable<Uint8List>(body);
    map['created'] = Variable<DateTime>(created);
    map['updated'] = Variable<DateTime>(updated);
    return map;
  }

  RequestCacheCompanion toCompanion(bool nullToAbsent) {
    return RequestCacheCompanion(
      id: Value(id),
      url: Value(url),
      headers: Value(headers),
      body: Value(body),
      created: Value(created),
      updated: Value(updated),
    );
  }

  factory RequestCacheData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RequestCacheData(
      id: serializer.fromJson<int>(json['id']),
      url: serializer.fromJson<String>(json['url']),
      headers: serializer.fromJson<String>(json['headers']),
      body: serializer.fromJson<Uint8List>(json['body']),
      created: serializer.fromJson<DateTime>(json['created']),
      updated: serializer.fromJson<DateTime>(json['updated']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'url': serializer.toJson<String>(url),
      'headers': serializer.toJson<String>(headers),
      'body': serializer.toJson<Uint8List>(body),
      'created': serializer.toJson<DateTime>(created),
      'updated': serializer.toJson<DateTime>(updated),
    };
  }

  RequestCacheData copyWith(
          {int? id,
          String? url,
          String? headers,
          Uint8List? body,
          DateTime? created,
          DateTime? updated}) =>
      RequestCacheData(
        id: id ?? this.id,
        url: url ?? this.url,
        headers: headers ?? this.headers,
        body: body ?? this.body,
        created: created ?? this.created,
        updated: updated ?? this.updated,
      );
  @override
  String toString() {
    return (StringBuffer('RequestCacheData(')
          ..write('id: $id, ')
          ..write('url: $url, ')
          ..write('headers: $headers, ')
          ..write('body: $body, ')
          ..write('created: $created, ')
          ..write('updated: $updated')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, url, headers, $driftBlobEquality.hash(body), created, updated);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RequestCacheData &&
          other.id == this.id &&
          other.url == this.url &&
          other.headers == this.headers &&
          $driftBlobEquality.equals(other.body, this.body) &&
          other.created == this.created &&
          other.updated == this.updated);
}

class RequestCacheCompanion extends UpdateCompanion<RequestCacheData> {
  Value<int> id;
  Value<String> url;
  Value<String> headers;
  Value<Uint8List> body;
  Value<DateTime> created;
  Value<DateTime> updated;
  RequestCacheCompanion({
    this.id = const Value.absent(),
    this.url = const Value.absent(),
    this.headers = const Value.absent(),
    this.body = const Value.absent(),
    this.created = const Value.absent(),
    this.updated = const Value.absent(),
  });
  RequestCacheCompanion.insert({
    this.id = const Value.absent(),
    required String url,
    required String headers,
    required Uint8List body,
    required DateTime created,
    required DateTime updated,
  })  : url = Value(url),
        headers = Value(headers),
        body = Value(body),
        created = Value(created),
        updated = Value(updated);
  static Insertable<RequestCacheData> custom({
    Expression<int>? id,
    Expression<String>? url,
    Expression<String>? headers,
    Expression<Uint8List>? body,
    Expression<DateTime>? created,
    Expression<DateTime>? updated,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (url != null) 'url': url,
      if (headers != null) 'headers': headers,
      if (body != null) 'body': body,
      if (created != null) 'created': created,
      if (updated != null) 'updated': updated,
    });
  }

  RequestCacheCompanion copyWith(
      {Value<int>? id,
      Value<String>? url,
      Value<String>? headers,
      Value<Uint8List>? body,
      Value<DateTime>? created,
      Value<DateTime>? updated}) {
    return RequestCacheCompanion(
      id: id ?? this.id,
      url: url ?? this.url,
      headers: headers ?? this.headers,
      body: body ?? this.body,
      created: created ?? this.created,
      updated: updated ?? this.updated,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (headers.present) {
      map['headers'] = Variable<String>(headers.value);
    }
    if (body.present) {
      map['body'] = Variable<Uint8List>(body.value);
    }
    if (created.present) {
      map['created'] = Variable<DateTime>(created.value);
    }
    if (updated.present) {
      map['updated'] = Variable<DateTime>(updated.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RequestCacheCompanion(')
          ..write('id: $id, ')
          ..write('url: $url, ')
          ..write('headers: $headers, ')
          ..write('body: $body, ')
          ..write('created: $created, ')
          ..write('updated: $updated')
          ..write(')'))
        .toString();
  }
}

class OfflineQueue extends Table
    with TableInfo<OfflineQueue, OfflineQueueData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  OfflineQueue(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'PRIMARY KEY AUTOINCREMENT');
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
      'url', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _methodMeta = const VerificationMeta('method');
  late final GeneratedColumn<String> method = GeneratedColumn<String>(
      'method', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _bodyMeta = const VerificationMeta('body');
  late final GeneratedColumn<Uint8List> body = GeneratedColumn<Uint8List>(
      'body', aliasedName, true,
      type: DriftSqlType.blob,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _headersMeta =
      const VerificationMeta('headers');
  late final GeneratedColumn<String> headers = GeneratedColumn<String>(
      'headers', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _retryCountMeta =
      const VerificationMeta('retryCount');
  late final GeneratedColumn<int> retryCount = GeneratedColumn<int>(
      'retry_count', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT 0',
      defaultValue: const CustomExpression('0'));
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _userMeta = const VerificationMeta('user');
  late final GeneratedColumn<String> user = GeneratedColumn<String>(
      'user', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _createdMeta =
      const VerificationMeta('created');
  late final GeneratedColumn<DateTime> created = GeneratedColumn<DateTime>(
      'created', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _updatedMeta =
      const VerificationMeta('updated');
  late final GeneratedColumn<DateTime> updated = GeneratedColumn<DateTime>(
      'updated', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns => [
        id,
        url,
        method,
        body,
        headers,
        retryCount,
        description,
        user,
        created,
        updated
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'offline_queue';
  @override
  VerificationContext validateIntegrity(Insertable<OfflineQueueData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('url')) {
      context.handle(
          _urlMeta, url.isAcceptableOrUnknown(data['url']!, _urlMeta));
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    if (data.containsKey('method')) {
      context.handle(_methodMeta,
          method.isAcceptableOrUnknown(data['method']!, _methodMeta));
    } else if (isInserting) {
      context.missing(_methodMeta);
    }
    if (data.containsKey('body')) {
      context.handle(
          _bodyMeta, body.isAcceptableOrUnknown(data['body']!, _bodyMeta));
    }
    if (data.containsKey('headers')) {
      context.handle(_headersMeta,
          headers.isAcceptableOrUnknown(data['headers']!, _headersMeta));
    } else if (isInserting) {
      context.missing(_headersMeta);
    }
    if (data.containsKey('retry_count')) {
      context.handle(
          _retryCountMeta,
          retryCount.isAcceptableOrUnknown(
              data['retry_count']!, _retryCountMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('user')) {
      context.handle(
          _userMeta, user.isAcceptableOrUnknown(data['user']!, _userMeta));
    }
    if (data.containsKey('created')) {
      context.handle(_createdMeta,
          created.isAcceptableOrUnknown(data['created']!, _createdMeta));
    } else if (isInserting) {
      context.missing(_createdMeta);
    }
    if (data.containsKey('updated')) {
      context.handle(_updatedMeta,
          updated.isAcceptableOrUnknown(data['updated']!, _updatedMeta));
    } else if (isInserting) {
      context.missing(_updatedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  OfflineQueueData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OfflineQueueData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      url: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}url'])!,
      method: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}method'])!,
      body: attachedDatabase.typeMapping
          .read(DriftSqlType.blob, data['${effectivePrefix}body']),
      headers: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}headers'])!,
      retryCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}retry_count'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      user: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user']),
      created: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created'])!,
      updated: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated'])!,
    );
  }

  @override
  OfflineQueue createAlias(String alias) {
    return OfflineQueue(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class OfflineQueueData extends DataClass
    implements Insertable<OfflineQueueData> {
  int id;
  String url;
  String method;
  Uint8List? body;
  String headers;
  int retryCount;
  String? description;
  String? user;
  DateTime created;
  DateTime updated;
  OfflineQueueData(
      {required this.id,
      required this.url,
      required this.method,
      this.body,
      required this.headers,
      required this.retryCount,
      this.description,
      this.user,
      required this.created,
      required this.updated});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['url'] = Variable<String>(url);
    map['method'] = Variable<String>(method);
    if (!nullToAbsent || body != null) {
      map['body'] = Variable<Uint8List>(body);
    }
    map['headers'] = Variable<String>(headers);
    map['retry_count'] = Variable<int>(retryCount);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || user != null) {
      map['user'] = Variable<String>(user);
    }
    map['created'] = Variable<DateTime>(created);
    map['updated'] = Variable<DateTime>(updated);
    return map;
  }

  OfflineQueueCompanion toCompanion(bool nullToAbsent) {
    return OfflineQueueCompanion(
      id: Value(id),
      url: Value(url),
      method: Value(method),
      body: body == null && nullToAbsent ? const Value.absent() : Value(body),
      headers: Value(headers),
      retryCount: Value(retryCount),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      user: user == null && nullToAbsent ? const Value.absent() : Value(user),
      created: Value(created),
      updated: Value(updated),
    );
  }

  factory OfflineQueueData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OfflineQueueData(
      id: serializer.fromJson<int>(json['id']),
      url: serializer.fromJson<String>(json['url']),
      method: serializer.fromJson<String>(json['method']),
      body: serializer.fromJson<Uint8List?>(json['body']),
      headers: serializer.fromJson<String>(json['headers']),
      retryCount: serializer.fromJson<int>(json['retry_count']),
      description: serializer.fromJson<String?>(json['description']),
      user: serializer.fromJson<String?>(json['user']),
      created: serializer.fromJson<DateTime>(json['created']),
      updated: serializer.fromJson<DateTime>(json['updated']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'url': serializer.toJson<String>(url),
      'method': serializer.toJson<String>(method),
      'body': serializer.toJson<Uint8List?>(body),
      'headers': serializer.toJson<String>(headers),
      'retry_count': serializer.toJson<int>(retryCount),
      'description': serializer.toJson<String?>(description),
      'user': serializer.toJson<String?>(user),
      'created': serializer.toJson<DateTime>(created),
      'updated': serializer.toJson<DateTime>(updated),
    };
  }

  OfflineQueueData copyWith(
          {int? id,
          String? url,
          String? method,
          Value<Uint8List?> body = const Value.absent(),
          String? headers,
          int? retryCount,
          Value<String?> description = const Value.absent(),
          Value<String?> user = const Value.absent(),
          DateTime? created,
          DateTime? updated}) =>
      OfflineQueueData(
        id: id ?? this.id,
        url: url ?? this.url,
        method: method ?? this.method,
        body: body.present ? body.value : this.body,
        headers: headers ?? this.headers,
        retryCount: retryCount ?? this.retryCount,
        description: description.present ? description.value : this.description,
        user: user.present ? user.value : this.user,
        created: created ?? this.created,
        updated: updated ?? this.updated,
      );
  @override
  String toString() {
    return (StringBuffer('OfflineQueueData(')
          ..write('id: $id, ')
          ..write('url: $url, ')
          ..write('method: $method, ')
          ..write('body: $body, ')
          ..write('headers: $headers, ')
          ..write('retryCount: $retryCount, ')
          ..write('description: $description, ')
          ..write('user: $user, ')
          ..write('created: $created, ')
          ..write('updated: $updated')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      url,
      method,
      $driftBlobEquality.hash(body),
      headers,
      retryCount,
      description,
      user,
      created,
      updated);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OfflineQueueData &&
          other.id == this.id &&
          other.url == this.url &&
          other.method == this.method &&
          $driftBlobEquality.equals(other.body, this.body) &&
          other.headers == this.headers &&
          other.retryCount == this.retryCount &&
          other.description == this.description &&
          other.user == this.user &&
          other.created == this.created &&
          other.updated == this.updated);
}

class OfflineQueueCompanion extends UpdateCompanion<OfflineQueueData> {
  Value<int> id;
  Value<String> url;
  Value<String> method;
  Value<Uint8List?> body;
  Value<String> headers;
  Value<int> retryCount;
  Value<String?> description;
  Value<String?> user;
  Value<DateTime> created;
  Value<DateTime> updated;
  OfflineQueueCompanion({
    this.id = const Value.absent(),
    this.url = const Value.absent(),
    this.method = const Value.absent(),
    this.body = const Value.absent(),
    this.headers = const Value.absent(),
    this.retryCount = const Value.absent(),
    this.description = const Value.absent(),
    this.user = const Value.absent(),
    this.created = const Value.absent(),
    this.updated = const Value.absent(),
  });
  OfflineQueueCompanion.insert({
    this.id = const Value.absent(),
    required String url,
    required String method,
    this.body = const Value.absent(),
    required String headers,
    this.retryCount = const Value.absent(),
    this.description = const Value.absent(),
    this.user = const Value.absent(),
    required DateTime created,
    required DateTime updated,
  })  : url = Value(url),
        method = Value(method),
        headers = Value(headers),
        created = Value(created),
        updated = Value(updated);
  static Insertable<OfflineQueueData> custom({
    Expression<int>? id,
    Expression<String>? url,
    Expression<String>? method,
    Expression<Uint8List>? body,
    Expression<String>? headers,
    Expression<int>? retryCount,
    Expression<String>? description,
    Expression<String>? user,
    Expression<DateTime>? created,
    Expression<DateTime>? updated,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (url != null) 'url': url,
      if (method != null) 'method': method,
      if (body != null) 'body': body,
      if (headers != null) 'headers': headers,
      if (retryCount != null) 'retry_count': retryCount,
      if (description != null) 'description': description,
      if (user != null) 'user': user,
      if (created != null) 'created': created,
      if (updated != null) 'updated': updated,
    });
  }

  OfflineQueueCompanion copyWith(
      {Value<int>? id,
      Value<String>? url,
      Value<String>? method,
      Value<Uint8List?>? body,
      Value<String>? headers,
      Value<int>? retryCount,
      Value<String?>? description,
      Value<String?>? user,
      Value<DateTime>? created,
      Value<DateTime>? updated}) {
    return OfflineQueueCompanion(
      id: id ?? this.id,
      url: url ?? this.url,
      method: method ?? this.method,
      body: body ?? this.body,
      headers: headers ?? this.headers,
      retryCount: retryCount ?? this.retryCount,
      description: description ?? this.description,
      user: user ?? this.user,
      created: created ?? this.created,
      updated: updated ?? this.updated,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (method.present) {
      map['method'] = Variable<String>(method.value);
    }
    if (body.present) {
      map['body'] = Variable<Uint8List>(body.value);
    }
    if (headers.present) {
      map['headers'] = Variable<String>(headers.value);
    }
    if (retryCount.present) {
      map['retry_count'] = Variable<int>(retryCount.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (user.present) {
      map['user'] = Variable<String>(user.value);
    }
    if (created.present) {
      map['created'] = Variable<DateTime>(created.value);
    }
    if (updated.present) {
      map['updated'] = Variable<DateTime>(updated.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OfflineQueueCompanion(')
          ..write('id: $id, ')
          ..write('url: $url, ')
          ..write('method: $method, ')
          ..write('body: $body, ')
          ..write('headers: $headers, ')
          ..write('retryCount: $retryCount, ')
          ..write('description: $description, ')
          ..write('user: $user, ')
          ..write('created: $created, ')
          ..write('updated: $updated')
          ..write(')'))
        .toString();
  }
}

class OfflineQueueFiles extends Table
    with TableInfo<OfflineQueueFiles, OfflineQueueFile> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  OfflineQueueFiles(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'PRIMARY KEY AUTOINCREMENT');
  static const VerificationMeta _offlineQueueIdMeta =
      const VerificationMeta('offlineQueueId');
  late final GeneratedColumn<int> offlineQueueId = GeneratedColumn<int>(
      'offline_queue_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _fieldMeta = const VerificationMeta('field');
  late final GeneratedColumn<String> field = GeneratedColumn<String>(
      'field', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  late final GeneratedColumn<Uint8List> value = GeneratedColumn<Uint8List>(
      'value', aliasedName, false,
      type: DriftSqlType.blob,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns => [id, offlineQueueId, field, value];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'offline_queue_files';
  @override
  VerificationContext validateIntegrity(Insertable<OfflineQueueFile> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('offline_queue_id')) {
      context.handle(
          _offlineQueueIdMeta,
          offlineQueueId.isAcceptableOrUnknown(
              data['offline_queue_id']!, _offlineQueueIdMeta));
    } else if (isInserting) {
      context.missing(_offlineQueueIdMeta);
    }
    if (data.containsKey('field')) {
      context.handle(
          _fieldMeta, field.isAcceptableOrUnknown(data['field']!, _fieldMeta));
    } else if (isInserting) {
      context.missing(_fieldMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
          _valueMeta, value.isAcceptableOrUnknown(data['value']!, _valueMeta));
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  OfflineQueueFile map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OfflineQueueFile(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      offlineQueueId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}offline_queue_id'])!,
      field: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}field'])!,
      value: attachedDatabase.typeMapping
          .read(DriftSqlType.blob, data['${effectivePrefix}value'])!,
    );
  }

  @override
  OfflineQueueFiles createAlias(String alias) {
    return OfflineQueueFiles(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class OfflineQueueFile extends DataClass
    implements Insertable<OfflineQueueFile> {
  int id;
  int offlineQueueId;
  String field;
  Uint8List value;
  OfflineQueueFile(
      {required this.id,
      required this.offlineQueueId,
      required this.field,
      required this.value});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['offline_queue_id'] = Variable<int>(offlineQueueId);
    map['field'] = Variable<String>(field);
    map['value'] = Variable<Uint8List>(value);
    return map;
  }

  OfflineQueueFilesCompanion toCompanion(bool nullToAbsent) {
    return OfflineQueueFilesCompanion(
      id: Value(id),
      offlineQueueId: Value(offlineQueueId),
      field: Value(field),
      value: Value(value),
    );
  }

  factory OfflineQueueFile.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OfflineQueueFile(
      id: serializer.fromJson<int>(json['id']),
      offlineQueueId: serializer.fromJson<int>(json['offline_queue_id']),
      field: serializer.fromJson<String>(json['field']),
      value: serializer.fromJson<Uint8List>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'offline_queue_id': serializer.toJson<int>(offlineQueueId),
      'field': serializer.toJson<String>(field),
      'value': serializer.toJson<Uint8List>(value),
    };
  }

  OfflineQueueFile copyWith(
          {int? id, int? offlineQueueId, String? field, Uint8List? value}) =>
      OfflineQueueFile(
        id: id ?? this.id,
        offlineQueueId: offlineQueueId ?? this.offlineQueueId,
        field: field ?? this.field,
        value: value ?? this.value,
      );
  @override
  String toString() {
    return (StringBuffer('OfflineQueueFile(')
          ..write('id: $id, ')
          ..write('offlineQueueId: $offlineQueueId, ')
          ..write('field: $field, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, offlineQueueId, field, $driftBlobEquality.hash(value));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OfflineQueueFile &&
          other.id == this.id &&
          other.offlineQueueId == this.offlineQueueId &&
          other.field == this.field &&
          $driftBlobEquality.equals(other.value, this.value));
}

class OfflineQueueFilesCompanion extends UpdateCompanion<OfflineQueueFile> {
  Value<int> id;
  Value<int> offlineQueueId;
  Value<String> field;
  Value<Uint8List> value;
  OfflineQueueFilesCompanion({
    this.id = const Value.absent(),
    this.offlineQueueId = const Value.absent(),
    this.field = const Value.absent(),
    this.value = const Value.absent(),
  });
  OfflineQueueFilesCompanion.insert({
    this.id = const Value.absent(),
    required int offlineQueueId,
    required String field,
    required Uint8List value,
  })  : offlineQueueId = Value(offlineQueueId),
        field = Value(field),
        value = Value(value);
  static Insertable<OfflineQueueFile> custom({
    Expression<int>? id,
    Expression<int>? offlineQueueId,
    Expression<String>? field,
    Expression<Uint8List>? value,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (offlineQueueId != null) 'offline_queue_id': offlineQueueId,
      if (field != null) 'field': field,
      if (value != null) 'value': value,
    });
  }

  OfflineQueueFilesCompanion copyWith(
      {Value<int>? id,
      Value<int>? offlineQueueId,
      Value<String>? field,
      Value<Uint8List>? value}) {
    return OfflineQueueFilesCompanion(
      id: id ?? this.id,
      offlineQueueId: offlineQueueId ?? this.offlineQueueId,
      field: field ?? this.field,
      value: value ?? this.value,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (offlineQueueId.present) {
      map['offline_queue_id'] = Variable<int>(offlineQueueId.value);
    }
    if (field.present) {
      map['field'] = Variable<String>(field.value);
    }
    if (value.present) {
      map['value'] = Variable<Uint8List>(value.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OfflineQueueFilesCompanion(')
          ..write('id: $id, ')
          ..write('offlineQueueId: $offlineQueueId, ')
          ..write('field: $field, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }
}

class Records extends Table with TableInfo<Records, Record> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Records(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'PRIMARY KEY NOT NULL');
  static const VerificationMeta _collectionIdMeta =
      const VerificationMeta('collectionId');
  late final GeneratedColumn<String> collectionId = GeneratedColumn<String>(
      'collection_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _collectionNameMeta =
      const VerificationMeta('collectionName');
  late final GeneratedColumn<String> collectionName = GeneratedColumn<String>(
      'collection_name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _dataMeta = const VerificationMeta('data');
  late final GeneratedColumn<String> data = GeneratedColumn<String>(
      'data', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _deletedMeta =
      const VerificationMeta('deleted');
  late final GeneratedColumn<bool> deleted = GeneratedColumn<bool>(
      'deleted', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT 0',
      defaultValue: const CustomExpression('0'));
  static const VerificationMeta _syncedMeta = const VerificationMeta('synced');
  late final GeneratedColumn<bool> synced = GeneratedColumn<bool>(
      'synced', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT 0',
      defaultValue: const CustomExpression('0'));
  static const VerificationMeta _createdMeta =
      const VerificationMeta('created');
  late final GeneratedColumn<DateTime> created = GeneratedColumn<DateTime>(
      'created', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _updatedMeta =
      const VerificationMeta('updated');
  late final GeneratedColumn<DateTime> updated = GeneratedColumn<DateTime>(
      'updated', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns => [
        id,
        collectionId,
        collectionName,
        data,
        deleted,
        synced,
        created,
        updated
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'records';
  @override
  VerificationContext validateIntegrity(Insertable<Record> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('collection_id')) {
      context.handle(
          _collectionIdMeta,
          collectionId.isAcceptableOrUnknown(
              data['collection_id']!, _collectionIdMeta));
    } else if (isInserting) {
      context.missing(_collectionIdMeta);
    }
    if (data.containsKey('collection_name')) {
      context.handle(
          _collectionNameMeta,
          collectionName.isAcceptableOrUnknown(
              data['collection_name']!, _collectionNameMeta));
    } else if (isInserting) {
      context.missing(_collectionNameMeta);
    }
    if (data.containsKey('data')) {
      context.handle(
          _dataMeta, this.data.isAcceptableOrUnknown(data['data']!, _dataMeta));
    } else if (isInserting) {
      context.missing(_dataMeta);
    }
    if (data.containsKey('deleted')) {
      context.handle(_deletedMeta,
          deleted.isAcceptableOrUnknown(data['deleted']!, _deletedMeta));
    }
    if (data.containsKey('synced')) {
      context.handle(_syncedMeta,
          synced.isAcceptableOrUnknown(data['synced']!, _syncedMeta));
    }
    if (data.containsKey('created')) {
      context.handle(_createdMeta,
          created.isAcceptableOrUnknown(data['created']!, _createdMeta));
    } else if (isInserting) {
      context.missing(_createdMeta);
    }
    if (data.containsKey('updated')) {
      context.handle(_updatedMeta,
          updated.isAcceptableOrUnknown(data['updated']!, _updatedMeta));
    } else if (isInserting) {
      context.missing(_updatedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {id, collectionId, collectionName},
      ];
  @override
  Record map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Record(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      collectionId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}collection_id'])!,
      collectionName: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}collection_name'])!,
      data: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}data'])!,
      deleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}deleted'])!,
      synced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}synced'])!,
      created: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created'])!,
      updated: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated'])!,
    );
  }

  @override
  Records createAlias(String alias) {
    return Records(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints =>
      const ['UNIQUE(id, collection_id, collection_name)'];
  @override
  bool get dontWriteConstraints => true;
}

class Record extends DataClass implements Insertable<Record> {
  String id;
  String collectionId;
  String collectionName;
  String data;
  bool deleted;
  bool synced;
  DateTime created;
  DateTime updated;
  Record(
      {required this.id,
      required this.collectionId,
      required this.collectionName,
      required this.data,
      required this.deleted,
      required this.synced,
      required this.created,
      required this.updated});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['collection_id'] = Variable<String>(collectionId);
    map['collection_name'] = Variable<String>(collectionName);
    map['data'] = Variable<String>(data);
    map['deleted'] = Variable<bool>(deleted);
    map['synced'] = Variable<bool>(synced);
    map['created'] = Variable<DateTime>(created);
    map['updated'] = Variable<DateTime>(updated);
    return map;
  }

  RecordsCompanion toCompanion(bool nullToAbsent) {
    return RecordsCompanion(
      id: Value(id),
      collectionId: Value(collectionId),
      collectionName: Value(collectionName),
      data: Value(data),
      deleted: Value(deleted),
      synced: Value(synced),
      created: Value(created),
      updated: Value(updated),
    );
  }

  factory Record.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Record(
      id: serializer.fromJson<String>(json['id']),
      collectionId: serializer.fromJson<String>(json['collection_id']),
      collectionName: serializer.fromJson<String>(json['collection_name']),
      data: serializer.fromJson<String>(json['data']),
      deleted: serializer.fromJson<bool>(json['deleted']),
      synced: serializer.fromJson<bool>(json['synced']),
      created: serializer.fromJson<DateTime>(json['created']),
      updated: serializer.fromJson<DateTime>(json['updated']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'collection_id': serializer.toJson<String>(collectionId),
      'collection_name': serializer.toJson<String>(collectionName),
      'data': serializer.toJson<String>(data),
      'deleted': serializer.toJson<bool>(deleted),
      'synced': serializer.toJson<bool>(synced),
      'created': serializer.toJson<DateTime>(created),
      'updated': serializer.toJson<DateTime>(updated),
    };
  }

  Record copyWith(
          {String? id,
          String? collectionId,
          String? collectionName,
          String? data,
          bool? deleted,
          bool? synced,
          DateTime? created,
          DateTime? updated}) =>
      Record(
        id: id ?? this.id,
        collectionId: collectionId ?? this.collectionId,
        collectionName: collectionName ?? this.collectionName,
        data: data ?? this.data,
        deleted: deleted ?? this.deleted,
        synced: synced ?? this.synced,
        created: created ?? this.created,
        updated: updated ?? this.updated,
      );
  @override
  String toString() {
    return (StringBuffer('Record(')
          ..write('id: $id, ')
          ..write('collectionId: $collectionId, ')
          ..write('collectionName: $collectionName, ')
          ..write('data: $data, ')
          ..write('deleted: $deleted, ')
          ..write('synced: $synced, ')
          ..write('created: $created, ')
          ..write('updated: $updated')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, collectionId, collectionName, data,
      deleted, synced, created, updated);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Record &&
          other.id == this.id &&
          other.collectionId == this.collectionId &&
          other.collectionName == this.collectionName &&
          other.data == this.data &&
          other.deleted == this.deleted &&
          other.synced == this.synced &&
          other.created == this.created &&
          other.updated == this.updated);
}

class RecordsCompanion extends UpdateCompanion<Record> {
  Value<String> id;
  Value<String> collectionId;
  Value<String> collectionName;
  Value<String> data;
  Value<bool> deleted;
  Value<bool> synced;
  Value<DateTime> created;
  Value<DateTime> updated;
  Value<int> rowid;
  RecordsCompanion({
    this.id = const Value.absent(),
    this.collectionId = const Value.absent(),
    this.collectionName = const Value.absent(),
    this.data = const Value.absent(),
    this.deleted = const Value.absent(),
    this.synced = const Value.absent(),
    this.created = const Value.absent(),
    this.updated = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RecordsCompanion.insert({
    required String id,
    required String collectionId,
    required String collectionName,
    required String data,
    this.deleted = const Value.absent(),
    this.synced = const Value.absent(),
    required DateTime created,
    required DateTime updated,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        collectionId = Value(collectionId),
        collectionName = Value(collectionName),
        data = Value(data),
        created = Value(created),
        updated = Value(updated);
  static Insertable<Record> custom({
    Expression<String>? id,
    Expression<String>? collectionId,
    Expression<String>? collectionName,
    Expression<String>? data,
    Expression<bool>? deleted,
    Expression<bool>? synced,
    Expression<DateTime>? created,
    Expression<DateTime>? updated,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (collectionId != null) 'collection_id': collectionId,
      if (collectionName != null) 'collection_name': collectionName,
      if (data != null) 'data': data,
      if (deleted != null) 'deleted': deleted,
      if (synced != null) 'synced': synced,
      if (created != null) 'created': created,
      if (updated != null) 'updated': updated,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RecordsCompanion copyWith(
      {Value<String>? id,
      Value<String>? collectionId,
      Value<String>? collectionName,
      Value<String>? data,
      Value<bool>? deleted,
      Value<bool>? synced,
      Value<DateTime>? created,
      Value<DateTime>? updated,
      Value<int>? rowid}) {
    return RecordsCompanion(
      id: id ?? this.id,
      collectionId: collectionId ?? this.collectionId,
      collectionName: collectionName ?? this.collectionName,
      data: data ?? this.data,
      deleted: deleted ?? this.deleted,
      synced: synced ?? this.synced,
      created: created ?? this.created,
      updated: updated ?? this.updated,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (collectionId.present) {
      map['collection_id'] = Variable<String>(collectionId.value);
    }
    if (collectionName.present) {
      map['collection_name'] = Variable<String>(collectionName.value);
    }
    if (data.present) {
      map['data'] = Variable<String>(data.value);
    }
    if (deleted.present) {
      map['deleted'] = Variable<bool>(deleted.value);
    }
    if (synced.present) {
      map['synced'] = Variable<bool>(synced.value);
    }
    if (created.present) {
      map['created'] = Variable<DateTime>(created.value);
    }
    if (updated.present) {
      map['updated'] = Variable<DateTime>(updated.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecordsCompanion(')
          ..write('id: $id, ')
          ..write('collectionId: $collectionId, ')
          ..write('collectionName: $collectionName, ')
          ..write('data: $data, ')
          ..write('deleted: $deleted, ')
          ..write('synced: $synced, ')
          ..write('created: $created, ')
          ..write('updated: $updated, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class UserRecord extends DataClass {
  String id;
  String collectionId;
  String collectionName;
  bool synced;
  bool deleted;
  DateTime created;
  String? modified;
  String data;
  String? user;
  String? uid;
  UserRecord(
      {required this.id,
      required this.collectionId,
      required this.collectionName,
      required this.synced,
      required this.deleted,
      required this.created,
      this.modified,
      required this.data,
      this.user,
      this.uid});
  factory UserRecord.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserRecord(
      id: serializer.fromJson<String>(json['id']),
      collectionId: serializer.fromJson<String>(json['collection_id']),
      collectionName: serializer.fromJson<String>(json['collection_name']),
      synced: serializer.fromJson<bool>(json['synced']),
      deleted: serializer.fromJson<bool>(json['deleted']),
      created: serializer.fromJson<DateTime>(json['created']),
      modified: serializer.fromJson<String?>(json['modified']),
      data: serializer.fromJson<String>(json['data']),
      user: serializer.fromJson<String?>(json['user']),
      uid: serializer.fromJson<String?>(json['uid']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'collection_id': serializer.toJson<String>(collectionId),
      'collection_name': serializer.toJson<String>(collectionName),
      'synced': serializer.toJson<bool>(synced),
      'deleted': serializer.toJson<bool>(deleted),
      'created': serializer.toJson<DateTime>(created),
      'modified': serializer.toJson<String?>(modified),
      'data': serializer.toJson<String>(data),
      'user': serializer.toJson<String?>(user),
      'uid': serializer.toJson<String?>(uid),
    };
  }

  UserRecord copyWith(
          {String? id,
          String? collectionId,
          String? collectionName,
          bool? synced,
          bool? deleted,
          DateTime? created,
          Value<String?> modified = const Value.absent(),
          String? data,
          Value<String?> user = const Value.absent(),
          Value<String?> uid = const Value.absent()}) =>
      UserRecord(
        id: id ?? this.id,
        collectionId: collectionId ?? this.collectionId,
        collectionName: collectionName ?? this.collectionName,
        synced: synced ?? this.synced,
        deleted: deleted ?? this.deleted,
        created: created ?? this.created,
        modified: modified.present ? modified.value : this.modified,
        data: data ?? this.data,
        user: user.present ? user.value : this.user,
        uid: uid.present ? uid.value : this.uid,
      );
  @override
  String toString() {
    return (StringBuffer('UserRecord(')
          ..write('id: $id, ')
          ..write('collectionId: $collectionId, ')
          ..write('collectionName: $collectionName, ')
          ..write('synced: $synced, ')
          ..write('deleted: $deleted, ')
          ..write('created: $created, ')
          ..write('modified: $modified, ')
          ..write('data: $data, ')
          ..write('user: $user, ')
          ..write('uid: $uid')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, collectionId, collectionName, synced,
      deleted, created, modified, data, user, uid);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserRecord &&
          other.id == this.id &&
          other.collectionId == this.collectionId &&
          other.collectionName == this.collectionName &&
          other.synced == this.synced &&
          other.deleted == this.deleted &&
          other.created == this.created &&
          other.modified == this.modified &&
          other.data == this.data &&
          other.user == this.user &&
          other.uid == this.uid);
}

class UserRecords extends ViewInfo<UserRecords, UserRecord>
    implements HasResultSet {
  final String? _alias;
  @override
  final _$HfwDatabase attachedDatabase;
  UserRecords(this.attachedDatabase, [this._alias]);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        collectionId,
        collectionName,
        synced,
        deleted,
        created,
        modified,
        data,
        user,
        uid
      ];
  @override
  String get aliasedName => _alias ?? entityName;
  @override
  String get entityName => 'user_records';
  @override
  Map<SqlDialect, String> get createViewStatements => {
        SqlDialect.sqlite:
            'CREATE VIEW user_records AS SELECT id, collection_id, collection_name, synced, deleted, created, modified, data, CASE WHEN json_extract(data, \'\$.user\') IS NOT NULL THEN CAST(json_extract(data, \'\$.user\') AS TEXT) ELSE NULL END AS user, CASE WHEN json_extract(data, \'\$.uid\') IS NOT NULL THEN CAST(json_extract(data, \'\$.uid\') AS TEXT) ELSE NULL END AS uid FROM records',
      };
  @override
  UserRecords get asDslTable => this;
  @override
  UserRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserRecord(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      collectionId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}collection_id'])!,
      collectionName: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}collection_name'])!,
      synced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}synced'])!,
      deleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}deleted'])!,
      created: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created'])!,
      modified: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}modified']),
      data: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}data'])!,
      user: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user']),
      uid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uid']),
    );
  }

  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> collectionId = GeneratedColumn<String>(
      'collection_id', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> collectionName = GeneratedColumn<String>(
      'collection_name', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<bool> synced = GeneratedColumn<bool>(
      'synced', aliasedName, false,
      type: DriftSqlType.bool,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("synced" IN (0, 1))'));
  late final GeneratedColumn<bool> deleted = GeneratedColumn<bool>(
      'deleted', aliasedName, false,
      type: DriftSqlType.bool,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("deleted" IN (0, 1))'));
  late final GeneratedColumn<DateTime> created = GeneratedColumn<DateTime>(
      'created', aliasedName, false,
      type: DriftSqlType.dateTime);
  late final GeneratedColumn<String> modified = GeneratedColumn<String>(
      'modified', aliasedName, true,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> data = GeneratedColumn<String>(
      'data', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> user = GeneratedColumn<String>(
      'user', aliasedName, true,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> uid = GeneratedColumn<String>(
      'uid', aliasedName, true,
      type: DriftSqlType.string);
  @override
  UserRecords createAlias(String alias) {
    return UserRecords(attachedDatabase, alias);
  }

  @override
  Query? get query => null;
  @override
  Set<String> get readTables => const {'records'};
}

class Analytic extends DataClass {
  String id;
  String collectionId;
  String collectionName;
  bool synced;
  bool deleted;
  DateTime created;
  String? modified;
  String data;
  String? user;
  String? uid;
  String type;
  String? metadata;
  String? version;
  String? platform;
  Analytic(
      {required this.id,
      required this.collectionId,
      required this.collectionName,
      required this.synced,
      required this.deleted,
      required this.created,
      this.modified,
      required this.data,
      this.user,
      this.uid,
      required this.type,
      this.metadata,
      this.version,
      this.platform});
  factory Analytic.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Analytic(
      id: serializer.fromJson<String>(json['id']),
      collectionId: serializer.fromJson<String>(json['collection_id']),
      collectionName: serializer.fromJson<String>(json['collection_name']),
      synced: serializer.fromJson<bool>(json['synced']),
      deleted: serializer.fromJson<bool>(json['deleted']),
      created: serializer.fromJson<DateTime>(json['created']),
      modified: serializer.fromJson<String?>(json['modified']),
      data: serializer.fromJson<String>(json['data']),
      user: serializer.fromJson<String?>(json['user']),
      uid: serializer.fromJson<String?>(json['uid']),
      type: serializer.fromJson<String>(json['type']),
      metadata: serializer.fromJson<String?>(json['metadata']),
      version: serializer.fromJson<String?>(json['version']),
      platform: serializer.fromJson<String?>(json['platform']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'collection_id': serializer.toJson<String>(collectionId),
      'collection_name': serializer.toJson<String>(collectionName),
      'synced': serializer.toJson<bool>(synced),
      'deleted': serializer.toJson<bool>(deleted),
      'created': serializer.toJson<DateTime>(created),
      'modified': serializer.toJson<String?>(modified),
      'data': serializer.toJson<String>(data),
      'user': serializer.toJson<String?>(user),
      'uid': serializer.toJson<String?>(uid),
      'type': serializer.toJson<String>(type),
      'metadata': serializer.toJson<String?>(metadata),
      'version': serializer.toJson<String?>(version),
      'platform': serializer.toJson<String?>(platform),
    };
  }

  Analytic copyWith(
          {String? id,
          String? collectionId,
          String? collectionName,
          bool? synced,
          bool? deleted,
          DateTime? created,
          Value<String?> modified = const Value.absent(),
          String? data,
          Value<String?> user = const Value.absent(),
          Value<String?> uid = const Value.absent(),
          String? type,
          Value<String?> metadata = const Value.absent(),
          Value<String?> version = const Value.absent(),
          Value<String?> platform = const Value.absent()}) =>
      Analytic(
        id: id ?? this.id,
        collectionId: collectionId ?? this.collectionId,
        collectionName: collectionName ?? this.collectionName,
        synced: synced ?? this.synced,
        deleted: deleted ?? this.deleted,
        created: created ?? this.created,
        modified: modified.present ? modified.value : this.modified,
        data: data ?? this.data,
        user: user.present ? user.value : this.user,
        uid: uid.present ? uid.value : this.uid,
        type: type ?? this.type,
        metadata: metadata.present ? metadata.value : this.metadata,
        version: version.present ? version.value : this.version,
        platform: platform.present ? platform.value : this.platform,
      );
  @override
  String toString() {
    return (StringBuffer('Analytic(')
          ..write('id: $id, ')
          ..write('collectionId: $collectionId, ')
          ..write('collectionName: $collectionName, ')
          ..write('synced: $synced, ')
          ..write('deleted: $deleted, ')
          ..write('created: $created, ')
          ..write('modified: $modified, ')
          ..write('data: $data, ')
          ..write('user: $user, ')
          ..write('uid: $uid, ')
          ..write('type: $type, ')
          ..write('metadata: $metadata, ')
          ..write('version: $version, ')
          ..write('platform: $platform')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      collectionId,
      collectionName,
      synced,
      deleted,
      created,
      modified,
      data,
      user,
      uid,
      type,
      metadata,
      version,
      platform);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Analytic &&
          other.id == this.id &&
          other.collectionId == this.collectionId &&
          other.collectionName == this.collectionName &&
          other.synced == this.synced &&
          other.deleted == this.deleted &&
          other.created == this.created &&
          other.modified == this.modified &&
          other.data == this.data &&
          other.user == this.user &&
          other.uid == this.uid &&
          other.type == this.type &&
          other.metadata == this.metadata &&
          other.version == this.version &&
          other.platform == this.platform);
}

class Analytics extends ViewInfo<Analytics, Analytic> implements HasResultSet {
  final String? _alias;
  @override
  final _$HfwDatabase attachedDatabase;
  Analytics(this.attachedDatabase, [this._alias]);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        collectionId,
        collectionName,
        synced,
        deleted,
        created,
        modified,
        data,
        user,
        uid,
        type,
        metadata,
        version,
        platform
      ];
  @override
  String get aliasedName => _alias ?? entityName;
  @override
  String get entityName => 'analytics';
  @override
  Map<SqlDialect, String> get createViewStatements => {
        SqlDialect.sqlite:
            'CREATE VIEW analytics AS SELECT *, CAST(json_extract(data, \'\$.type\') AS TEXT) AS type, CASE WHEN json_extract(data, \'\$.metadata\') IS NOT NULL THEN CAST(json_extract(data, \'\$.metadata\') AS TEXT) ELSE NULL END AS metadata, CASE WHEN json_extract(data, \'\$.version\') IS NOT NULL THEN CAST(json_extract(data, \'\$.version\') AS TEXT) ELSE NULL END AS version, CASE WHEN json_extract(data, \'\$.platform\') IS NOT NULL THEN CAST(json_extract(data, \'\$.platform\') AS TEXT) ELSE NULL END AS platform FROM user_records WHERE collection_name = \'analytics\'',
      };
  @override
  Analytics get asDslTable => this;
  @override
  Analytic map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Analytic(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      collectionId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}collection_id'])!,
      collectionName: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}collection_name'])!,
      synced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}synced'])!,
      deleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}deleted'])!,
      created: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created'])!,
      modified: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}modified']),
      data: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}data'])!,
      user: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user']),
      uid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uid']),
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      metadata: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}metadata']),
      version: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}version']),
      platform: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}platform']),
    );
  }

  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> collectionId = GeneratedColumn<String>(
      'collection_id', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> collectionName = GeneratedColumn<String>(
      'collection_name', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<bool> synced = GeneratedColumn<bool>(
      'synced', aliasedName, false,
      type: DriftSqlType.bool,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("synced" IN (0, 1))'));
  late final GeneratedColumn<bool> deleted = GeneratedColumn<bool>(
      'deleted', aliasedName, false,
      type: DriftSqlType.bool,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("deleted" IN (0, 1))'));
  late final GeneratedColumn<DateTime> created = GeneratedColumn<DateTime>(
      'created', aliasedName, false,
      type: DriftSqlType.dateTime);
  late final GeneratedColumn<String> modified = GeneratedColumn<String>(
      'modified', aliasedName, true,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> data = GeneratedColumn<String>(
      'data', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> user = GeneratedColumn<String>(
      'user', aliasedName, true,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> uid = GeneratedColumn<String>(
      'uid', aliasedName, true,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> metadata = GeneratedColumn<String>(
      'metadata', aliasedName, true,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> version = GeneratedColumn<String>(
      'version', aliasedName, true,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> platform = GeneratedColumn<String>(
      'platform', aliasedName, true,
      type: DriftSqlType.string);
  @override
  Analytics createAlias(String alias) {
    return Analytics(attachedDatabase, alias);
  }

  @override
  Query? get query => null;
  @override
  Set<String> get readTables => const {'records'};
}

class UserPurchase extends DataClass {
  String id;
  String collectionId;
  String collectionName;
  bool synced;
  bool deleted;
  DateTime created;
  String? modified;
  String data;
  String? user;
  String? uid;
  String productId;
  String? platform;
  double? amount;
  String? purchaseId;
  UserPurchase(
      {required this.id,
      required this.collectionId,
      required this.collectionName,
      required this.synced,
      required this.deleted,
      required this.created,
      this.modified,
      required this.data,
      this.user,
      this.uid,
      required this.productId,
      this.platform,
      this.amount,
      this.purchaseId});
  factory UserPurchase.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserPurchase(
      id: serializer.fromJson<String>(json['id']),
      collectionId: serializer.fromJson<String>(json['collection_id']),
      collectionName: serializer.fromJson<String>(json['collection_name']),
      synced: serializer.fromJson<bool>(json['synced']),
      deleted: serializer.fromJson<bool>(json['deleted']),
      created: serializer.fromJson<DateTime>(json['created']),
      modified: serializer.fromJson<String?>(json['modified']),
      data: serializer.fromJson<String>(json['data']),
      user: serializer.fromJson<String?>(json['user']),
      uid: serializer.fromJson<String?>(json['uid']),
      productId: serializer.fromJson<String>(json['product_id']),
      platform: serializer.fromJson<String?>(json['platform']),
      amount: serializer.fromJson<double?>(json['amount']),
      purchaseId: serializer.fromJson<String?>(json['purchase_id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'collection_id': serializer.toJson<String>(collectionId),
      'collection_name': serializer.toJson<String>(collectionName),
      'synced': serializer.toJson<bool>(synced),
      'deleted': serializer.toJson<bool>(deleted),
      'created': serializer.toJson<DateTime>(created),
      'modified': serializer.toJson<String?>(modified),
      'data': serializer.toJson<String>(data),
      'user': serializer.toJson<String?>(user),
      'uid': serializer.toJson<String?>(uid),
      'product_id': serializer.toJson<String>(productId),
      'platform': serializer.toJson<String?>(platform),
      'amount': serializer.toJson<double?>(amount),
      'purchase_id': serializer.toJson<String?>(purchaseId),
    };
  }

  UserPurchase copyWith(
          {String? id,
          String? collectionId,
          String? collectionName,
          bool? synced,
          bool? deleted,
          DateTime? created,
          Value<String?> modified = const Value.absent(),
          String? data,
          Value<String?> user = const Value.absent(),
          Value<String?> uid = const Value.absent(),
          String? productId,
          Value<String?> platform = const Value.absent(),
          Value<double?> amount = const Value.absent(),
          Value<String?> purchaseId = const Value.absent()}) =>
      UserPurchase(
        id: id ?? this.id,
        collectionId: collectionId ?? this.collectionId,
        collectionName: collectionName ?? this.collectionName,
        synced: synced ?? this.synced,
        deleted: deleted ?? this.deleted,
        created: created ?? this.created,
        modified: modified.present ? modified.value : this.modified,
        data: data ?? this.data,
        user: user.present ? user.value : this.user,
        uid: uid.present ? uid.value : this.uid,
        productId: productId ?? this.productId,
        platform: platform.present ? platform.value : this.platform,
        amount: amount.present ? amount.value : this.amount,
        purchaseId: purchaseId.present ? purchaseId.value : this.purchaseId,
      );
  @override
  String toString() {
    return (StringBuffer('UserPurchase(')
          ..write('id: $id, ')
          ..write('collectionId: $collectionId, ')
          ..write('collectionName: $collectionName, ')
          ..write('synced: $synced, ')
          ..write('deleted: $deleted, ')
          ..write('created: $created, ')
          ..write('modified: $modified, ')
          ..write('data: $data, ')
          ..write('user: $user, ')
          ..write('uid: $uid, ')
          ..write('productId: $productId, ')
          ..write('platform: $platform, ')
          ..write('amount: $amount, ')
          ..write('purchaseId: $purchaseId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      collectionId,
      collectionName,
      synced,
      deleted,
      created,
      modified,
      data,
      user,
      uid,
      productId,
      platform,
      amount,
      purchaseId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserPurchase &&
          other.id == this.id &&
          other.collectionId == this.collectionId &&
          other.collectionName == this.collectionName &&
          other.synced == this.synced &&
          other.deleted == this.deleted &&
          other.created == this.created &&
          other.modified == this.modified &&
          other.data == this.data &&
          other.user == this.user &&
          other.uid == this.uid &&
          other.productId == this.productId &&
          other.platform == this.platform &&
          other.amount == this.amount &&
          other.purchaseId == this.purchaseId);
}

class UserPurchases extends ViewInfo<UserPurchases, UserPurchase>
    implements HasResultSet {
  final String? _alias;
  @override
  final _$HfwDatabase attachedDatabase;
  UserPurchases(this.attachedDatabase, [this._alias]);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        collectionId,
        collectionName,
        synced,
        deleted,
        created,
        modified,
        data,
        user,
        uid,
        productId,
        platform,
        amount,
        purchaseId
      ];
  @override
  String get aliasedName => _alias ?? entityName;
  @override
  String get entityName => 'user_purchases';
  @override
  Map<SqlDialect, String> get createViewStatements => {
        SqlDialect.sqlite:
            'CREATE VIEW user_purchases AS SELECT *, CAST(json_extract(data, \'\$.product_id\') AS TEXT) AS product_id, CASE WHEN json_extract(data, \'\$.platform\') IS NOT NULL THEN CAST(json_extract(data, \'\$.platform\') AS TEXT) ELSE NULL END AS platform, CASE WHEN json_extract(data, \'\$.amount\') IS NOT NULL THEN CAST(json_extract(data, \'\$.amount\') AS REAL) ELSE NULL END AS amount, CASE WHEN json_extract(data, \'\$.purchase_id\') IS NOT NULL THEN CAST(json_extract(data, \'\$.purchase_id\') AS TEXT) ELSE NULL END AS purchase_id FROM user_records WHERE collection_name = \'user_purchases\'',
      };
  @override
  UserPurchases get asDslTable => this;
  @override
  UserPurchase map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserPurchase(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      collectionId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}collection_id'])!,
      collectionName: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}collection_name'])!,
      synced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}synced'])!,
      deleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}deleted'])!,
      created: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created'])!,
      modified: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}modified']),
      data: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}data'])!,
      user: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user']),
      uid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uid']),
      productId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}product_id'])!,
      platform: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}platform']),
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}amount']),
      purchaseId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}purchase_id']),
    );
  }

  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> collectionId = GeneratedColumn<String>(
      'collection_id', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> collectionName = GeneratedColumn<String>(
      'collection_name', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<bool> synced = GeneratedColumn<bool>(
      'synced', aliasedName, false,
      type: DriftSqlType.bool,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("synced" IN (0, 1))'));
  late final GeneratedColumn<bool> deleted = GeneratedColumn<bool>(
      'deleted', aliasedName, false,
      type: DriftSqlType.bool,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("deleted" IN (0, 1))'));
  late final GeneratedColumn<DateTime> created = GeneratedColumn<DateTime>(
      'created', aliasedName, false,
      type: DriftSqlType.dateTime);
  late final GeneratedColumn<String> modified = GeneratedColumn<String>(
      'modified', aliasedName, true,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> data = GeneratedColumn<String>(
      'data', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> user = GeneratedColumn<String>(
      'user', aliasedName, true,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> uid = GeneratedColumn<String>(
      'uid', aliasedName, true,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> productId = GeneratedColumn<String>(
      'product_id', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> platform = GeneratedColumn<String>(
      'platform', aliasedName, true,
      type: DriftSqlType.string);
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
      'amount', aliasedName, true,
      type: DriftSqlType.double);
  late final GeneratedColumn<String> purchaseId = GeneratedColumn<String>(
      'purchase_id', aliasedName, true,
      type: DriftSqlType.string);
  @override
  UserPurchases createAlias(String alias) {
    return UserPurchases(attachedDatabase, alias);
  }

  @override
  Query? get query => null;
  @override
  Set<String> get readTables => const {'records'};
}

class UserLibraryData extends DataClass {
  String id;
  String collectionId;
  String collectionName;
  bool synced;
  bool deleted;
  DateTime created;
  String? modified;
  String data;
  String? user;
  String? uid;
  String? hymnId;
  String? playlistId;
  String? topicId;
  String? stakeholderId;
  UserLibraryData(
      {required this.id,
      required this.collectionId,
      required this.collectionName,
      required this.synced,
      required this.deleted,
      required this.created,
      this.modified,
      required this.data,
      this.user,
      this.uid,
      this.hymnId,
      this.playlistId,
      this.topicId,
      this.stakeholderId});
  factory UserLibraryData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserLibraryData(
      id: serializer.fromJson<String>(json['id']),
      collectionId: serializer.fromJson<String>(json['collection_id']),
      collectionName: serializer.fromJson<String>(json['collection_name']),
      synced: serializer.fromJson<bool>(json['synced']),
      deleted: serializer.fromJson<bool>(json['deleted']),
      created: serializer.fromJson<DateTime>(json['created']),
      modified: serializer.fromJson<String?>(json['modified']),
      data: serializer.fromJson<String>(json['data']),
      user: serializer.fromJson<String?>(json['user']),
      uid: serializer.fromJson<String?>(json['uid']),
      hymnId: serializer.fromJson<String?>(json['hymn_id']),
      playlistId: serializer.fromJson<String?>(json['playlist_id']),
      topicId: serializer.fromJson<String?>(json['topic_id']),
      stakeholderId: serializer.fromJson<String?>(json['stakeholder_id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'collection_id': serializer.toJson<String>(collectionId),
      'collection_name': serializer.toJson<String>(collectionName),
      'synced': serializer.toJson<bool>(synced),
      'deleted': serializer.toJson<bool>(deleted),
      'created': serializer.toJson<DateTime>(created),
      'modified': serializer.toJson<String?>(modified),
      'data': serializer.toJson<String>(data),
      'user': serializer.toJson<String?>(user),
      'uid': serializer.toJson<String?>(uid),
      'hymn_id': serializer.toJson<String?>(hymnId),
      'playlist_id': serializer.toJson<String?>(playlistId),
      'topic_id': serializer.toJson<String?>(topicId),
      'stakeholder_id': serializer.toJson<String?>(stakeholderId),
    };
  }

  UserLibraryData copyWith(
          {String? id,
          String? collectionId,
          String? collectionName,
          bool? synced,
          bool? deleted,
          DateTime? created,
          Value<String?> modified = const Value.absent(),
          String? data,
          Value<String?> user = const Value.absent(),
          Value<String?> uid = const Value.absent(),
          Value<String?> hymnId = const Value.absent(),
          Value<String?> playlistId = const Value.absent(),
          Value<String?> topicId = const Value.absent(),
          Value<String?> stakeholderId = const Value.absent()}) =>
      UserLibraryData(
        id: id ?? this.id,
        collectionId: collectionId ?? this.collectionId,
        collectionName: collectionName ?? this.collectionName,
        synced: synced ?? this.synced,
        deleted: deleted ?? this.deleted,
        created: created ?? this.created,
        modified: modified.present ? modified.value : this.modified,
        data: data ?? this.data,
        user: user.present ? user.value : this.user,
        uid: uid.present ? uid.value : this.uid,
        hymnId: hymnId.present ? hymnId.value : this.hymnId,
        playlistId: playlistId.present ? playlistId.value : this.playlistId,
        topicId: topicId.present ? topicId.value : this.topicId,
        stakeholderId:
            stakeholderId.present ? stakeholderId.value : this.stakeholderId,
      );
  @override
  String toString() {
    return (StringBuffer('UserLibraryData(')
          ..write('id: $id, ')
          ..write('collectionId: $collectionId, ')
          ..write('collectionName: $collectionName, ')
          ..write('synced: $synced, ')
          ..write('deleted: $deleted, ')
          ..write('created: $created, ')
          ..write('modified: $modified, ')
          ..write('data: $data, ')
          ..write('user: $user, ')
          ..write('uid: $uid, ')
          ..write('hymnId: $hymnId, ')
          ..write('playlistId: $playlistId, ')
          ..write('topicId: $topicId, ')
          ..write('stakeholderId: $stakeholderId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      collectionId,
      collectionName,
      synced,
      deleted,
      created,
      modified,
      data,
      user,
      uid,
      hymnId,
      playlistId,
      topicId,
      stakeholderId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserLibraryData &&
          other.id == this.id &&
          other.collectionId == this.collectionId &&
          other.collectionName == this.collectionName &&
          other.synced == this.synced &&
          other.deleted == this.deleted &&
          other.created == this.created &&
          other.modified == this.modified &&
          other.data == this.data &&
          other.user == this.user &&
          other.uid == this.uid &&
          other.hymnId == this.hymnId &&
          other.playlistId == this.playlistId &&
          other.topicId == this.topicId &&
          other.stakeholderId == this.stakeholderId);
}

class UserLibrary extends ViewInfo<UserLibrary, UserLibraryData>
    implements HasResultSet {
  final String? _alias;
  @override
  final _$HfwDatabase attachedDatabase;
  UserLibrary(this.attachedDatabase, [this._alias]);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        collectionId,
        collectionName,
        synced,
        deleted,
        created,
        modified,
        data,
        user,
        uid,
        hymnId,
        playlistId,
        topicId,
        stakeholderId
      ];
  @override
  String get aliasedName => _alias ?? entityName;
  @override
  String get entityName => 'user_library';
  @override
  Map<SqlDialect, String> get createViewStatements => {
        SqlDialect.sqlite:
            'CREATE VIEW user_library AS SELECT *, CASE WHEN json_extract(data, \'\$.hymn_id\') IS NOT NULL THEN CAST(json_extract(data, \'\$.hymn_id\') AS TEXT) ELSE NULL END AS hymn_id, CASE WHEN json_extract(data, \'\$.playlist_id\') IS NOT NULL THEN CAST(json_extract(data, \'\$.playlist_id\') AS TEXT) ELSE NULL END AS playlist_id, CASE WHEN json_extract(data, \'\$.topic_id\') IS NOT NULL THEN CAST(json_extract(data, \'\$.topic_id\') AS TEXT) ELSE NULL END AS topic_id, CASE WHEN json_extract(data, \'\$.stakeholder_id\') IS NOT NULL THEN CAST(json_extract(data, \'\$.stakeholder_id\') AS TEXT) ELSE NULL END AS stakeholder_id FROM user_records WHERE collection_name = \'user_library\'',
      };
  @override
  UserLibrary get asDslTable => this;
  @override
  UserLibraryData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserLibraryData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      collectionId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}collection_id'])!,
      collectionName: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}collection_name'])!,
      synced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}synced'])!,
      deleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}deleted'])!,
      created: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created'])!,
      modified: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}modified']),
      data: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}data'])!,
      user: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user']),
      uid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uid']),
      hymnId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}hymn_id']),
      playlistId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}playlist_id']),
      topicId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}topic_id']),
      stakeholderId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}stakeholder_id']),
    );
  }

  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> collectionId = GeneratedColumn<String>(
      'collection_id', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> collectionName = GeneratedColumn<String>(
      'collection_name', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<bool> synced = GeneratedColumn<bool>(
      'synced', aliasedName, false,
      type: DriftSqlType.bool,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("synced" IN (0, 1))'));
  late final GeneratedColumn<bool> deleted = GeneratedColumn<bool>(
      'deleted', aliasedName, false,
      type: DriftSqlType.bool,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("deleted" IN (0, 1))'));
  late final GeneratedColumn<DateTime> created = GeneratedColumn<DateTime>(
      'created', aliasedName, false,
      type: DriftSqlType.dateTime);
  late final GeneratedColumn<String> modified = GeneratedColumn<String>(
      'modified', aliasedName, true,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> data = GeneratedColumn<String>(
      'data', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> user = GeneratedColumn<String>(
      'user', aliasedName, true,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> uid = GeneratedColumn<String>(
      'uid', aliasedName, true,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> hymnId = GeneratedColumn<String>(
      'hymn_id', aliasedName, true,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> playlistId = GeneratedColumn<String>(
      'playlist_id', aliasedName, true,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> topicId = GeneratedColumn<String>(
      'topic_id', aliasedName, true,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> stakeholderId = GeneratedColumn<String>(
      'stakeholder_id', aliasedName, true,
      type: DriftSqlType.string);
  @override
  UserLibrary createAlias(String alias) {
    return UserLibrary(attachedDatabase, alias);
  }

  @override
  Query? get query => null;
  @override
  Set<String> get readTables => const {'records'};
}

class UserHymnLibraryData extends DataClass {
  String id;
  String collectionId;
  String collectionName;
  bool synced;
  bool deleted;
  DateTime created;
  String? modified;
  String data;
  String? user;
  String? uid;
  String hymnId;
  UserHymnLibraryData(
      {required this.id,
      required this.collectionId,
      required this.collectionName,
      required this.synced,
      required this.deleted,
      required this.created,
      this.modified,
      required this.data,
      this.user,
      this.uid,
      required this.hymnId});
  factory UserHymnLibraryData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserHymnLibraryData(
      id: serializer.fromJson<String>(json['id']),
      collectionId: serializer.fromJson<String>(json['collection_id']),
      collectionName: serializer.fromJson<String>(json['collection_name']),
      synced: serializer.fromJson<bool>(json['synced']),
      deleted: serializer.fromJson<bool>(json['deleted']),
      created: serializer.fromJson<DateTime>(json['created']),
      modified: serializer.fromJson<String?>(json['modified']),
      data: serializer.fromJson<String>(json['data']),
      user: serializer.fromJson<String?>(json['user']),
      uid: serializer.fromJson<String?>(json['uid']),
      hymnId: serializer.fromJson<String>(json['hymn_id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'collection_id': serializer.toJson<String>(collectionId),
      'collection_name': serializer.toJson<String>(collectionName),
      'synced': serializer.toJson<bool>(synced),
      'deleted': serializer.toJson<bool>(deleted),
      'created': serializer.toJson<DateTime>(created),
      'modified': serializer.toJson<String?>(modified),
      'data': serializer.toJson<String>(data),
      'user': serializer.toJson<String?>(user),
      'uid': serializer.toJson<String?>(uid),
      'hymn_id': serializer.toJson<String>(hymnId),
    };
  }

  UserHymnLibraryData copyWith(
          {String? id,
          String? collectionId,
          String? collectionName,
          bool? synced,
          bool? deleted,
          DateTime? created,
          Value<String?> modified = const Value.absent(),
          String? data,
          Value<String?> user = const Value.absent(),
          Value<String?> uid = const Value.absent(),
          String? hymnId}) =>
      UserHymnLibraryData(
        id: id ?? this.id,
        collectionId: collectionId ?? this.collectionId,
        collectionName: collectionName ?? this.collectionName,
        synced: synced ?? this.synced,
        deleted: deleted ?? this.deleted,
        created: created ?? this.created,
        modified: modified.present ? modified.value : this.modified,
        data: data ?? this.data,
        user: user.present ? user.value : this.user,
        uid: uid.present ? uid.value : this.uid,
        hymnId: hymnId ?? this.hymnId,
      );
  @override
  String toString() {
    return (StringBuffer('UserHymnLibraryData(')
          ..write('id: $id, ')
          ..write('collectionId: $collectionId, ')
          ..write('collectionName: $collectionName, ')
          ..write('synced: $synced, ')
          ..write('deleted: $deleted, ')
          ..write('created: $created, ')
          ..write('modified: $modified, ')
          ..write('data: $data, ')
          ..write('user: $user, ')
          ..write('uid: $uid, ')
          ..write('hymnId: $hymnId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, collectionId, collectionName, synced,
      deleted, created, modified, data, user, uid, hymnId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserHymnLibraryData &&
          other.id == this.id &&
          other.collectionId == this.collectionId &&
          other.collectionName == this.collectionName &&
          other.synced == this.synced &&
          other.deleted == this.deleted &&
          other.created == this.created &&
          other.modified == this.modified &&
          other.data == this.data &&
          other.user == this.user &&
          other.uid == this.uid &&
          other.hymnId == this.hymnId);
}

class UserHymnLibrary extends ViewInfo<UserHymnLibrary, UserHymnLibraryData>
    implements HasResultSet {
  final String? _alias;
  @override
  final _$HfwDatabase attachedDatabase;
  UserHymnLibrary(this.attachedDatabase, [this._alias]);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        collectionId,
        collectionName,
        synced,
        deleted,
        created,
        modified,
        data,
        user,
        uid,
        hymnId
      ];
  @override
  String get aliasedName => _alias ?? entityName;
  @override
  String get entityName => 'user_hymn_library';
  @override
  Map<SqlDialect, String> get createViewStatements => {
        SqlDialect.sqlite:
            'CREATE VIEW user_hymn_library AS SELECT *, CAST(json_extract(data, \'\$.hymn_id\') AS TEXT) AS hymn_id FROM user_records WHERE collection_name = \'user_library\' AND json_extract(data, \'\$.hymn_id\') IS NOT NULL',
      };
  @override
  UserHymnLibrary get asDslTable => this;
  @override
  UserHymnLibraryData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserHymnLibraryData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      collectionId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}collection_id'])!,
      collectionName: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}collection_name'])!,
      synced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}synced'])!,
      deleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}deleted'])!,
      created: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created'])!,
      modified: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}modified']),
      data: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}data'])!,
      user: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user']),
      uid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uid']),
      hymnId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}hymn_id'])!,
    );
  }

  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> collectionId = GeneratedColumn<String>(
      'collection_id', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> collectionName = GeneratedColumn<String>(
      'collection_name', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<bool> synced = GeneratedColumn<bool>(
      'synced', aliasedName, false,
      type: DriftSqlType.bool,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("synced" IN (0, 1))'));
  late final GeneratedColumn<bool> deleted = GeneratedColumn<bool>(
      'deleted', aliasedName, false,
      type: DriftSqlType.bool,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("deleted" IN (0, 1))'));
  late final GeneratedColumn<DateTime> created = GeneratedColumn<DateTime>(
      'created', aliasedName, false,
      type: DriftSqlType.dateTime);
  late final GeneratedColumn<String> modified = GeneratedColumn<String>(
      'modified', aliasedName, true,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> data = GeneratedColumn<String>(
      'data', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> user = GeneratedColumn<String>(
      'user', aliasedName, true,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> uid = GeneratedColumn<String>(
      'uid', aliasedName, true,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> hymnId = GeneratedColumn<String>(
      'hymn_id', aliasedName, false,
      type: DriftSqlType.string);
  @override
  UserHymnLibrary createAlias(String alias) {
    return UserHymnLibrary(attachedDatabase, alias);
  }

  @override
  Query? get query => null;
  @override
  Set<String> get readTables => const {'records'};
}

class UserStakeholderLibraryData extends DataClass {
  String id;
  String collectionId;
  String collectionName;
  bool synced;
  bool deleted;
  DateTime created;
  String? modified;
  String data;
  String? user;
  String? uid;
  String stakeholderId;
  UserStakeholderLibraryData(
      {required this.id,
      required this.collectionId,
      required this.collectionName,
      required this.synced,
      required this.deleted,
      required this.created,
      this.modified,
      required this.data,
      this.user,
      this.uid,
      required this.stakeholderId});
  factory UserStakeholderLibraryData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserStakeholderLibraryData(
      id: serializer.fromJson<String>(json['id']),
      collectionId: serializer.fromJson<String>(json['collection_id']),
      collectionName: serializer.fromJson<String>(json['collection_name']),
      synced: serializer.fromJson<bool>(json['synced']),
      deleted: serializer.fromJson<bool>(json['deleted']),
      created: serializer.fromJson<DateTime>(json['created']),
      modified: serializer.fromJson<String?>(json['modified']),
      data: serializer.fromJson<String>(json['data']),
      user: serializer.fromJson<String?>(json['user']),
      uid: serializer.fromJson<String?>(json['uid']),
      stakeholderId: serializer.fromJson<String>(json['stakeholder_id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'collection_id': serializer.toJson<String>(collectionId),
      'collection_name': serializer.toJson<String>(collectionName),
      'synced': serializer.toJson<bool>(synced),
      'deleted': serializer.toJson<bool>(deleted),
      'created': serializer.toJson<DateTime>(created),
      'modified': serializer.toJson<String?>(modified),
      'data': serializer.toJson<String>(data),
      'user': serializer.toJson<String?>(user),
      'uid': serializer.toJson<String?>(uid),
      'stakeholder_id': serializer.toJson<String>(stakeholderId),
    };
  }

  UserStakeholderLibraryData copyWith(
          {String? id,
          String? collectionId,
          String? collectionName,
          bool? synced,
          bool? deleted,
          DateTime? created,
          Value<String?> modified = const Value.absent(),
          String? data,
          Value<String?> user = const Value.absent(),
          Value<String?> uid = const Value.absent(),
          String? stakeholderId}) =>
      UserStakeholderLibraryData(
        id: id ?? this.id,
        collectionId: collectionId ?? this.collectionId,
        collectionName: collectionName ?? this.collectionName,
        synced: synced ?? this.synced,
        deleted: deleted ?? this.deleted,
        created: created ?? this.created,
        modified: modified.present ? modified.value : this.modified,
        data: data ?? this.data,
        user: user.present ? user.value : this.user,
        uid: uid.present ? uid.value : this.uid,
        stakeholderId: stakeholderId ?? this.stakeholderId,
      );
  @override
  String toString() {
    return (StringBuffer('UserStakeholderLibraryData(')
          ..write('id: $id, ')
          ..write('collectionId: $collectionId, ')
          ..write('collectionName: $collectionName, ')
          ..write('synced: $synced, ')
          ..write('deleted: $deleted, ')
          ..write('created: $created, ')
          ..write('modified: $modified, ')
          ..write('data: $data, ')
          ..write('user: $user, ')
          ..write('uid: $uid, ')
          ..write('stakeholderId: $stakeholderId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, collectionId, collectionName, synced,
      deleted, created, modified, data, user, uid, stakeholderId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserStakeholderLibraryData &&
          other.id == this.id &&
          other.collectionId == this.collectionId &&
          other.collectionName == this.collectionName &&
          other.synced == this.synced &&
          other.deleted == this.deleted &&
          other.created == this.created &&
          other.modified == this.modified &&
          other.data == this.data &&
          other.user == this.user &&
          other.uid == this.uid &&
          other.stakeholderId == this.stakeholderId);
}

class UserStakeholderLibrary
    extends ViewInfo<UserStakeholderLibrary, UserStakeholderLibraryData>
    implements HasResultSet {
  final String? _alias;
  @override
  final _$HfwDatabase attachedDatabase;
  UserStakeholderLibrary(this.attachedDatabase, [this._alias]);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        collectionId,
        collectionName,
        synced,
        deleted,
        created,
        modified,
        data,
        user,
        uid,
        stakeholderId
      ];
  @override
  String get aliasedName => _alias ?? entityName;
  @override
  String get entityName => 'user_stakeholder_library';
  @override
  Map<SqlDialect, String> get createViewStatements => {
        SqlDialect.sqlite:
            'CREATE VIEW user_stakeholder_library AS SELECT *, CAST(json_extract(data, \'\$.stakeholder_id\') AS TEXT) AS stakeholder_id FROM user_records WHERE collection_name = \'user_library\' AND json_extract(data, \'\$.stakeholder_id\') IS NOT NULL',
      };
  @override
  UserStakeholderLibrary get asDslTable => this;
  @override
  UserStakeholderLibraryData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserStakeholderLibraryData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      collectionId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}collection_id'])!,
      collectionName: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}collection_name'])!,
      synced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}synced'])!,
      deleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}deleted'])!,
      created: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created'])!,
      modified: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}modified']),
      data: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}data'])!,
      user: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user']),
      uid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uid']),
      stakeholderId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}stakeholder_id'])!,
    );
  }

  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> collectionId = GeneratedColumn<String>(
      'collection_id', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> collectionName = GeneratedColumn<String>(
      'collection_name', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<bool> synced = GeneratedColumn<bool>(
      'synced', aliasedName, false,
      type: DriftSqlType.bool,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("synced" IN (0, 1))'));
  late final GeneratedColumn<bool> deleted = GeneratedColumn<bool>(
      'deleted', aliasedName, false,
      type: DriftSqlType.bool,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("deleted" IN (0, 1))'));
  late final GeneratedColumn<DateTime> created = GeneratedColumn<DateTime>(
      'created', aliasedName, false,
      type: DriftSqlType.dateTime);
  late final GeneratedColumn<String> modified = GeneratedColumn<String>(
      'modified', aliasedName, true,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> data = GeneratedColumn<String>(
      'data', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> user = GeneratedColumn<String>(
      'user', aliasedName, true,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> uid = GeneratedColumn<String>(
      'uid', aliasedName, true,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> stakeholderId = GeneratedColumn<String>(
      'stakeholder_id', aliasedName, false,
      type: DriftSqlType.string);
  @override
  UserStakeholderLibrary createAlias(String alias) {
    return UserStakeholderLibrary(attachedDatabase, alias);
  }

  @override
  Query? get query => null;
  @override
  Set<String> get readTables => const {'records'};
}

class UserTopicLibraryData extends DataClass {
  String id;
  String collectionId;
  String collectionName;
  bool synced;
  bool deleted;
  DateTime created;
  String? modified;
  String data;
  String? user;
  String? uid;
  String topicId;
  UserTopicLibraryData(
      {required this.id,
      required this.collectionId,
      required this.collectionName,
      required this.synced,
      required this.deleted,
      required this.created,
      this.modified,
      required this.data,
      this.user,
      this.uid,
      required this.topicId});
  factory UserTopicLibraryData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserTopicLibraryData(
      id: serializer.fromJson<String>(json['id']),
      collectionId: serializer.fromJson<String>(json['collection_id']),
      collectionName: serializer.fromJson<String>(json['collection_name']),
      synced: serializer.fromJson<bool>(json['synced']),
      deleted: serializer.fromJson<bool>(json['deleted']),
      created: serializer.fromJson<DateTime>(json['created']),
      modified: serializer.fromJson<String?>(json['modified']),
      data: serializer.fromJson<String>(json['data']),
      user: serializer.fromJson<String?>(json['user']),
      uid: serializer.fromJson<String?>(json['uid']),
      topicId: serializer.fromJson<String>(json['topic_id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'collection_id': serializer.toJson<String>(collectionId),
      'collection_name': serializer.toJson<String>(collectionName),
      'synced': serializer.toJson<bool>(synced),
      'deleted': serializer.toJson<bool>(deleted),
      'created': serializer.toJson<DateTime>(created),
      'modified': serializer.toJson<String?>(modified),
      'data': serializer.toJson<String>(data),
      'user': serializer.toJson<String?>(user),
      'uid': serializer.toJson<String?>(uid),
      'topic_id': serializer.toJson<String>(topicId),
    };
  }

  UserTopicLibraryData copyWith(
          {String? id,
          String? collectionId,
          String? collectionName,
          bool? synced,
          bool? deleted,
          DateTime? created,
          Value<String?> modified = const Value.absent(),
          String? data,
          Value<String?> user = const Value.absent(),
          Value<String?> uid = const Value.absent(),
          String? topicId}) =>
      UserTopicLibraryData(
        id: id ?? this.id,
        collectionId: collectionId ?? this.collectionId,
        collectionName: collectionName ?? this.collectionName,
        synced: synced ?? this.synced,
        deleted: deleted ?? this.deleted,
        created: created ?? this.created,
        modified: modified.present ? modified.value : this.modified,
        data: data ?? this.data,
        user: user.present ? user.value : this.user,
        uid: uid.present ? uid.value : this.uid,
        topicId: topicId ?? this.topicId,
      );
  @override
  String toString() {
    return (StringBuffer('UserTopicLibraryData(')
          ..write('id: $id, ')
          ..write('collectionId: $collectionId, ')
          ..write('collectionName: $collectionName, ')
          ..write('synced: $synced, ')
          ..write('deleted: $deleted, ')
          ..write('created: $created, ')
          ..write('modified: $modified, ')
          ..write('data: $data, ')
          ..write('user: $user, ')
          ..write('uid: $uid, ')
          ..write('topicId: $topicId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, collectionId, collectionName, synced,
      deleted, created, modified, data, user, uid, topicId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserTopicLibraryData &&
          other.id == this.id &&
          other.collectionId == this.collectionId &&
          other.collectionName == this.collectionName &&
          other.synced == this.synced &&
          other.deleted == this.deleted &&
          other.created == this.created &&
          other.modified == this.modified &&
          other.data == this.data &&
          other.user == this.user &&
          other.uid == this.uid &&
          other.topicId == this.topicId);
}

class UserTopicLibrary extends ViewInfo<UserTopicLibrary, UserTopicLibraryData>
    implements HasResultSet {
  final String? _alias;
  @override
  final _$HfwDatabase attachedDatabase;
  UserTopicLibrary(this.attachedDatabase, [this._alias]);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        collectionId,
        collectionName,
        synced,
        deleted,
        created,
        modified,
        data,
        user,
        uid,
        topicId
      ];
  @override
  String get aliasedName => _alias ?? entityName;
  @override
  String get entityName => 'user_topic_library';
  @override
  Map<SqlDialect, String> get createViewStatements => {
        SqlDialect.sqlite:
            'CREATE VIEW user_topic_library AS SELECT *, CAST(json_extract(data, \'\$.topic_id\') AS TEXT) AS topic_id FROM user_records WHERE collection_name = \'user_library\' AND json_extract(data, \'\$.topic_id\') IS NOT NULL',
      };
  @override
  UserTopicLibrary get asDslTable => this;
  @override
  UserTopicLibraryData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserTopicLibraryData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      collectionId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}collection_id'])!,
      collectionName: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}collection_name'])!,
      synced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}synced'])!,
      deleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}deleted'])!,
      created: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created'])!,
      modified: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}modified']),
      data: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}data'])!,
      user: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user']),
      uid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uid']),
      topicId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}topic_id'])!,
    );
  }

  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> collectionId = GeneratedColumn<String>(
      'collection_id', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> collectionName = GeneratedColumn<String>(
      'collection_name', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<bool> synced = GeneratedColumn<bool>(
      'synced', aliasedName, false,
      type: DriftSqlType.bool,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("synced" IN (0, 1))'));
  late final GeneratedColumn<bool> deleted = GeneratedColumn<bool>(
      'deleted', aliasedName, false,
      type: DriftSqlType.bool,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("deleted" IN (0, 1))'));
  late final GeneratedColumn<DateTime> created = GeneratedColumn<DateTime>(
      'created', aliasedName, false,
      type: DriftSqlType.dateTime);
  late final GeneratedColumn<String> modified = GeneratedColumn<String>(
      'modified', aliasedName, true,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> data = GeneratedColumn<String>(
      'data', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> user = GeneratedColumn<String>(
      'user', aliasedName, true,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> uid = GeneratedColumn<String>(
      'uid', aliasedName, true,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> topicId = GeneratedColumn<String>(
      'topic_id', aliasedName, false,
      type: DriftSqlType.string);
  @override
  UserTopicLibrary createAlias(String alias) {
    return UserTopicLibrary(attachedDatabase, alias);
  }

  @override
  Query? get query => null;
  @override
  Set<String> get readTables => const {'records'};
}

class UserPlaylistLibraryData extends DataClass {
  String id;
  String collectionId;
  String collectionName;
  bool synced;
  bool deleted;
  DateTime created;
  String? modified;
  String data;
  String? user;
  String? uid;
  String playlistId;
  UserPlaylistLibraryData(
      {required this.id,
      required this.collectionId,
      required this.collectionName,
      required this.synced,
      required this.deleted,
      required this.created,
      this.modified,
      required this.data,
      this.user,
      this.uid,
      required this.playlistId});
  factory UserPlaylistLibraryData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserPlaylistLibraryData(
      id: serializer.fromJson<String>(json['id']),
      collectionId: serializer.fromJson<String>(json['collection_id']),
      collectionName: serializer.fromJson<String>(json['collection_name']),
      synced: serializer.fromJson<bool>(json['synced']),
      deleted: serializer.fromJson<bool>(json['deleted']),
      created: serializer.fromJson<DateTime>(json['created']),
      modified: serializer.fromJson<String?>(json['modified']),
      data: serializer.fromJson<String>(json['data']),
      user: serializer.fromJson<String?>(json['user']),
      uid: serializer.fromJson<String?>(json['uid']),
      playlistId: serializer.fromJson<String>(json['playlist_id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'collection_id': serializer.toJson<String>(collectionId),
      'collection_name': serializer.toJson<String>(collectionName),
      'synced': serializer.toJson<bool>(synced),
      'deleted': serializer.toJson<bool>(deleted),
      'created': serializer.toJson<DateTime>(created),
      'modified': serializer.toJson<String?>(modified),
      'data': serializer.toJson<String>(data),
      'user': serializer.toJson<String?>(user),
      'uid': serializer.toJson<String?>(uid),
      'playlist_id': serializer.toJson<String>(playlistId),
    };
  }

  UserPlaylistLibraryData copyWith(
          {String? id,
          String? collectionId,
          String? collectionName,
          bool? synced,
          bool? deleted,
          DateTime? created,
          Value<String?> modified = const Value.absent(),
          String? data,
          Value<String?> user = const Value.absent(),
          Value<String?> uid = const Value.absent(),
          String? playlistId}) =>
      UserPlaylistLibraryData(
        id: id ?? this.id,
        collectionId: collectionId ?? this.collectionId,
        collectionName: collectionName ?? this.collectionName,
        synced: synced ?? this.synced,
        deleted: deleted ?? this.deleted,
        created: created ?? this.created,
        modified: modified.present ? modified.value : this.modified,
        data: data ?? this.data,
        user: user.present ? user.value : this.user,
        uid: uid.present ? uid.value : this.uid,
        playlistId: playlistId ?? this.playlistId,
      );
  @override
  String toString() {
    return (StringBuffer('UserPlaylistLibraryData(')
          ..write('id: $id, ')
          ..write('collectionId: $collectionId, ')
          ..write('collectionName: $collectionName, ')
          ..write('synced: $synced, ')
          ..write('deleted: $deleted, ')
          ..write('created: $created, ')
          ..write('modified: $modified, ')
          ..write('data: $data, ')
          ..write('user: $user, ')
          ..write('uid: $uid, ')
          ..write('playlistId: $playlistId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, collectionId, collectionName, synced,
      deleted, created, modified, data, user, uid, playlistId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserPlaylistLibraryData &&
          other.id == this.id &&
          other.collectionId == this.collectionId &&
          other.collectionName == this.collectionName &&
          other.synced == this.synced &&
          other.deleted == this.deleted &&
          other.created == this.created &&
          other.modified == this.modified &&
          other.data == this.data &&
          other.user == this.user &&
          other.uid == this.uid &&
          other.playlistId == this.playlistId);
}

class UserPlaylistLibrary
    extends ViewInfo<UserPlaylistLibrary, UserPlaylistLibraryData>
    implements HasResultSet {
  final String? _alias;
  @override
  final _$HfwDatabase attachedDatabase;
  UserPlaylistLibrary(this.attachedDatabase, [this._alias]);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        collectionId,
        collectionName,
        synced,
        deleted,
        created,
        modified,
        data,
        user,
        uid,
        playlistId
      ];
  @override
  String get aliasedName => _alias ?? entityName;
  @override
  String get entityName => 'user_playlist_library';
  @override
  Map<SqlDialect, String> get createViewStatements => {
        SqlDialect.sqlite:
            'CREATE VIEW user_playlist_library AS SELECT *, CAST(json_extract(data, \'\$.playlist_id\') AS TEXT) AS playlist_id FROM user_records WHERE collection_name = \'user_library\' AND json_extract(data, \'\$.playlist_id\') IS NOT NULL',
      };
  @override
  UserPlaylistLibrary get asDslTable => this;
  @override
  UserPlaylistLibraryData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserPlaylistLibraryData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      collectionId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}collection_id'])!,
      collectionName: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}collection_name'])!,
      synced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}synced'])!,
      deleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}deleted'])!,
      created: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created'])!,
      modified: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}modified']),
      data: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}data'])!,
      user: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user']),
      uid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uid']),
      playlistId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}playlist_id'])!,
    );
  }

  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> collectionId = GeneratedColumn<String>(
      'collection_id', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> collectionName = GeneratedColumn<String>(
      'collection_name', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<bool> synced = GeneratedColumn<bool>(
      'synced', aliasedName, false,
      type: DriftSqlType.bool,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("synced" IN (0, 1))'));
  late final GeneratedColumn<bool> deleted = GeneratedColumn<bool>(
      'deleted', aliasedName, false,
      type: DriftSqlType.bool,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("deleted" IN (0, 1))'));
  late final GeneratedColumn<DateTime> created = GeneratedColumn<DateTime>(
      'created', aliasedName, false,
      type: DriftSqlType.dateTime);
  late final GeneratedColumn<String> modified = GeneratedColumn<String>(
      'modified', aliasedName, true,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> data = GeneratedColumn<String>(
      'data', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> user = GeneratedColumn<String>(
      'user', aliasedName, true,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> uid = GeneratedColumn<String>(
      'uid', aliasedName, true,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> playlistId = GeneratedColumn<String>(
      'playlist_id', aliasedName, false,
      type: DriftSqlType.string);
  @override
  UserPlaylistLibrary createAlias(String alias) {
    return UserPlaylistLibrary(attachedDatabase, alias);
  }

  @override
  Query? get query => null;
  @override
  Set<String> get readTables => const {'records'};
}

class LocalPlaylistItem extends DataClass {
  String id;
  String collectionId;
  String collectionName;
  bool synced;
  bool deleted;
  DateTime created;
  String? modified;
  String data;
  String? user;
  String? uid;
  String? playlistId;
  String? image;
  String? parts;
  String? color;
  String? notes;
  String? text;
  double? order;
  LocalPlaylistItem(
      {required this.id,
      required this.collectionId,
      required this.collectionName,
      required this.synced,
      required this.deleted,
      required this.created,
      this.modified,
      required this.data,
      this.user,
      this.uid,
      this.playlistId,
      this.image,
      this.parts,
      this.color,
      this.notes,
      this.text,
      this.order});
  factory LocalPlaylistItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocalPlaylistItem(
      id: serializer.fromJson<String>(json['id']),
      collectionId: serializer.fromJson<String>(json['collection_id']),
      collectionName: serializer.fromJson<String>(json['collection_name']),
      synced: serializer.fromJson<bool>(json['synced']),
      deleted: serializer.fromJson<bool>(json['deleted']),
      created: serializer.fromJson<DateTime>(json['created']),
      modified: serializer.fromJson<String?>(json['modified']),
      data: serializer.fromJson<String>(json['data']),
      user: serializer.fromJson<String?>(json['user']),
      uid: serializer.fromJson<String?>(json['uid']),
      playlistId: serializer.fromJson<String?>(json['playlist_id']),
      image: serializer.fromJson<String?>(json['image']),
      parts: serializer.fromJson<String?>(json['parts']),
      color: serializer.fromJson<String?>(json['color']),
      notes: serializer.fromJson<String?>(json['notes']),
      text: serializer.fromJson<String?>(json['text']),
      order: serializer.fromJson<double?>(json['order']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'collection_id': serializer.toJson<String>(collectionId),
      'collection_name': serializer.toJson<String>(collectionName),
      'synced': serializer.toJson<bool>(synced),
      'deleted': serializer.toJson<bool>(deleted),
      'created': serializer.toJson<DateTime>(created),
      'modified': serializer.toJson<String?>(modified),
      'data': serializer.toJson<String>(data),
      'user': serializer.toJson<String?>(user),
      'uid': serializer.toJson<String?>(uid),
      'playlist_id': serializer.toJson<String?>(playlistId),
      'image': serializer.toJson<String?>(image),
      'parts': serializer.toJson<String?>(parts),
      'color': serializer.toJson<String?>(color),
      'notes': serializer.toJson<String?>(notes),
      'text': serializer.toJson<String?>(text),
      'order': serializer.toJson<double?>(order),
    };
  }

  LocalPlaylistItem copyWith(
          {String? id,
          String? collectionId,
          String? collectionName,
          bool? synced,
          bool? deleted,
          DateTime? created,
          Value<String?> modified = const Value.absent(),
          String? data,
          Value<String?> user = const Value.absent(),
          Value<String?> uid = const Value.absent(),
          Value<String?> playlistId = const Value.absent(),
          Value<String?> image = const Value.absent(),
          Value<String?> parts = const Value.absent(),
          Value<String?> color = const Value.absent(),
          Value<String?> notes = const Value.absent(),
          Value<String?> text = const Value.absent(),
          Value<double?> order = const Value.absent()}) =>
      LocalPlaylistItem(
        id: id ?? this.id,
        collectionId: collectionId ?? this.collectionId,
        collectionName: collectionName ?? this.collectionName,
        synced: synced ?? this.synced,
        deleted: deleted ?? this.deleted,
        created: created ?? this.created,
        modified: modified.present ? modified.value : this.modified,
        data: data ?? this.data,
        user: user.present ? user.value : this.user,
        uid: uid.present ? uid.value : this.uid,
        playlistId: playlistId.present ? playlistId.value : this.playlistId,
        image: image.present ? image.value : this.image,
        parts: parts.present ? parts.value : this.parts,
        color: color.present ? color.value : this.color,
        notes: notes.present ? notes.value : this.notes,
        text: text.present ? text.value : this.text,
        order: order.present ? order.value : this.order,
      );
  @override
  String toString() {
    return (StringBuffer('LocalPlaylistItem(')
          ..write('id: $id, ')
          ..write('collectionId: $collectionId, ')
          ..write('collectionName: $collectionName, ')
          ..write('synced: $synced, ')
          ..write('deleted: $deleted, ')
          ..write('created: $created, ')
          ..write('modified: $modified, ')
          ..write('data: $data, ')
          ..write('user: $user, ')
          ..write('uid: $uid, ')
          ..write('playlistId: $playlistId, ')
          ..write('image: $image, ')
          ..write('parts: $parts, ')
          ..write('color: $color, ')
          ..write('notes: $notes, ')
          ..write('text: $text, ')
          ..write('order: $order')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      collectionId,
      collectionName,
      synced,
      deleted,
      created,
      modified,
      data,
      user,
      uid,
      playlistId,
      image,
      parts,
      color,
      notes,
      text,
      order);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocalPlaylistItem &&
          other.id == this.id &&
          other.collectionId == this.collectionId &&
          other.collectionName == this.collectionName &&
          other.synced == this.synced &&
          other.deleted == this.deleted &&
          other.created == this.created &&
          other.modified == this.modified &&
          other.data == this.data &&
          other.user == this.user &&
          other.uid == this.uid &&
          other.playlistId == this.playlistId &&
          other.image == this.image &&
          other.parts == this.parts &&
          other.color == this.color &&
          other.notes == this.notes &&
          other.text == this.text &&
          other.order == this.order);
}

class LocalPlaylistItems extends ViewInfo<LocalPlaylistItems, LocalPlaylistItem>
    implements HasResultSet {
  final String? _alias;
  @override
  final _$HfwDatabase attachedDatabase;
  LocalPlaylistItems(this.attachedDatabase, [this._alias]);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        collectionId,
        collectionName,
        synced,
        deleted,
        created,
        modified,
        data,
        user,
        uid,
        playlistId,
        image,
        parts,
        color,
        notes,
        text,
        order
      ];
  @override
  String get aliasedName => _alias ?? entityName;
  @override
  String get entityName => 'local_playlist_items';
  @override
  Map<SqlDialect, String> get createViewStatements => {
        SqlDialect.sqlite:
            'CREATE VIEW local_playlist_items AS SELECT *, json_extract(data, \'\$.playlist_id\') AS playlist_id, CASE WHEN json_extract(data, \'\$.image\') IS NOT NULL THEN CAST(json_extract(data, \'\$.image\') AS TEXT) ELSE NULL END AS image, CASE WHEN json_extract(data, \'\$.parts\') IS NOT NULL THEN CAST(json_extract(data, \'\$.parts\') AS TEXT) ELSE NULL END AS parts, CASE WHEN json_extract(data, \'\$.color\') IS NOT NULL THEN CAST(json_extract(data, \'\$.color\') AS TEXT) ELSE NULL END AS color, CASE WHEN json_extract(data, \'\$.notes\') IS NOT NULL THEN CAST(json_extract(data, \'\$.notes\') AS TEXT) ELSE NULL END AS notes, CASE WHEN json_extract(data, \'\$.text\') IS NOT NULL THEN CAST(json_extract(data, \'\$.text\') AS TEXT) ELSE NULL END AS text, CASE WHEN json_extract(data, \'\$.order\') IS NOT NULL THEN CAST(json_extract(data, \'\$.order\') AS REAL) ELSE NULL END AS "order" FROM user_records WHERE collection_name = \'playlist_items\' OR collection_name = \'public_playlist_items\'',
      };
  @override
  LocalPlaylistItems get asDslTable => this;
  @override
  LocalPlaylistItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalPlaylistItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      collectionId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}collection_id'])!,
      collectionName: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}collection_name'])!,
      synced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}synced'])!,
      deleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}deleted'])!,
      created: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created'])!,
      modified: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}modified']),
      data: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}data'])!,
      user: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user']),
      uid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uid']),
      playlistId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}playlist_id']),
      image: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image']),
      parts: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}parts']),
      color: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}color']),
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      text: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}text']),
      order: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}order']),
    );
  }

  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> collectionId = GeneratedColumn<String>(
      'collection_id', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> collectionName = GeneratedColumn<String>(
      'collection_name', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<bool> synced = GeneratedColumn<bool>(
      'synced', aliasedName, false,
      type: DriftSqlType.bool,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("synced" IN (0, 1))'));
  late final GeneratedColumn<bool> deleted = GeneratedColumn<bool>(
      'deleted', aliasedName, false,
      type: DriftSqlType.bool,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("deleted" IN (0, 1))'));
  late final GeneratedColumn<DateTime> created = GeneratedColumn<DateTime>(
      'created', aliasedName, false,
      type: DriftSqlType.dateTime);
  late final GeneratedColumn<String> modified = GeneratedColumn<String>(
      'modified', aliasedName, true,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> data = GeneratedColumn<String>(
      'data', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> user = GeneratedColumn<String>(
      'user', aliasedName, true,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> uid = GeneratedColumn<String>(
      'uid', aliasedName, true,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> playlistId = GeneratedColumn<String>(
      'playlist_id', aliasedName, true,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
      'image', aliasedName, true,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> parts = GeneratedColumn<String>(
      'parts', aliasedName, true,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> color = GeneratedColumn<String>(
      'color', aliasedName, true,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> text = GeneratedColumn<String>(
      'text', aliasedName, true,
      type: DriftSqlType.string);
  late final GeneratedColumn<double> order = GeneratedColumn<double>(
      'order', aliasedName, true,
      type: DriftSqlType.double);
  @override
  LocalPlaylistItems createAlias(String alias) {
    return LocalPlaylistItems(attachedDatabase, alias);
  }

  @override
  Query? get query => null;
  @override
  Set<String> get readTables => const {'records'};
}

class PlaylistItem extends DataClass {
  String id;
  String collectionId;
  String collectionName;
  bool synced;
  bool deleted;
  DateTime created;
  String? modified;
  String data;
  String? user;
  String? uid;
  String? playlistId;
  String? image;
  String? parts;
  String? color;
  String? notes;
  String? text;
  double? order;
  PlaylistItem(
      {required this.id,
      required this.collectionId,
      required this.collectionName,
      required this.synced,
      required this.deleted,
      required this.created,
      this.modified,
      required this.data,
      this.user,
      this.uid,
      this.playlistId,
      this.image,
      this.parts,
      this.color,
      this.notes,
      this.text,
      this.order});
  factory PlaylistItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PlaylistItem(
      id: serializer.fromJson<String>(json['id']),
      collectionId: serializer.fromJson<String>(json['collection_id']),
      collectionName: serializer.fromJson<String>(json['collection_name']),
      synced: serializer.fromJson<bool>(json['synced']),
      deleted: serializer.fromJson<bool>(json['deleted']),
      created: serializer.fromJson<DateTime>(json['created']),
      modified: serializer.fromJson<String?>(json['modified']),
      data: serializer.fromJson<String>(json['data']),
      user: serializer.fromJson<String?>(json['user']),
      uid: serializer.fromJson<String?>(json['uid']),
      playlistId: serializer.fromJson<String?>(json['playlist_id']),
      image: serializer.fromJson<String?>(json['image']),
      parts: serializer.fromJson<String?>(json['parts']),
      color: serializer.fromJson<String?>(json['color']),
      notes: serializer.fromJson<String?>(json['notes']),
      text: serializer.fromJson<String?>(json['text']),
      order: serializer.fromJson<double?>(json['order']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'collection_id': serializer.toJson<String>(collectionId),
      'collection_name': serializer.toJson<String>(collectionName),
      'synced': serializer.toJson<bool>(synced),
      'deleted': serializer.toJson<bool>(deleted),
      'created': serializer.toJson<DateTime>(created),
      'modified': serializer.toJson<String?>(modified),
      'data': serializer.toJson<String>(data),
      'user': serializer.toJson<String?>(user),
      'uid': serializer.toJson<String?>(uid),
      'playlist_id': serializer.toJson<String?>(playlistId),
      'image': serializer.toJson<String?>(image),
      'parts': serializer.toJson<String?>(parts),
      'color': serializer.toJson<String?>(color),
      'notes': serializer.toJson<String?>(notes),
      'text': serializer.toJson<String?>(text),
      'order': serializer.toJson<double?>(order),
    };
  }

  PlaylistItem copyWith(
          {String? id,
          String? collectionId,
          String? collectionName,
          bool? synced,
          bool? deleted,
          DateTime? created,
          Value<String?> modified = const Value.absent(),
          String? data,
          Value<String?> user = const Value.absent(),
          Value<String?> uid = const Value.absent(),
          Value<String?> playlistId = const Value.absent(),
          Value<String?> image = const Value.absent(),
          Value<String?> parts = const Value.absent(),
          Value<String?> color = const Value.absent(),
          Value<String?> notes = const Value.absent(),
          Value<String?> text = const Value.absent(),
          Value<double?> order = const Value.absent()}) =>
      PlaylistItem(
        id: id ?? this.id,
        collectionId: collectionId ?? this.collectionId,
        collectionName: collectionName ?? this.collectionName,
        synced: synced ?? this.synced,
        deleted: deleted ?? this.deleted,
        created: created ?? this.created,
        modified: modified.present ? modified.value : this.modified,
        data: data ?? this.data,
        user: user.present ? user.value : this.user,
        uid: uid.present ? uid.value : this.uid,
        playlistId: playlistId.present ? playlistId.value : this.playlistId,
        image: image.present ? image.value : this.image,
        parts: parts.present ? parts.value : this.parts,
        color: color.present ? color.value : this.color,
        notes: notes.present ? notes.value : this.notes,
        text: text.present ? text.value : this.text,
        order: order.present ? order.value : this.order,
      );
  @override
  String toString() {
    return (StringBuffer('PlaylistItem(')
          ..write('id: $id, ')
          ..write('collectionId: $collectionId, ')
          ..write('collectionName: $collectionName, ')
          ..write('synced: $synced, ')
          ..write('deleted: $deleted, ')
          ..write('created: $created, ')
          ..write('modified: $modified, ')
          ..write('data: $data, ')
          ..write('user: $user, ')
          ..write('uid: $uid, ')
          ..write('playlistId: $playlistId, ')
          ..write('image: $image, ')
          ..write('parts: $parts, ')
          ..write('color: $color, ')
          ..write('notes: $notes, ')
          ..write('text: $text, ')
          ..write('order: $order')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      collectionId,
      collectionName,
      synced,
      deleted,
      created,
      modified,
      data,
      user,
      uid,
      playlistId,
      image,
      parts,
      color,
      notes,
      text,
      order);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PlaylistItem &&
          other.id == this.id &&
          other.collectionId == this.collectionId &&
          other.collectionName == this.collectionName &&
          other.synced == this.synced &&
          other.deleted == this.deleted &&
          other.created == this.created &&
          other.modified == this.modified &&
          other.data == this.data &&
          other.user == this.user &&
          other.uid == this.uid &&
          other.playlistId == this.playlistId &&
          other.image == this.image &&
          other.parts == this.parts &&
          other.color == this.color &&
          other.notes == this.notes &&
          other.text == this.text &&
          other.order == this.order);
}

class PlaylistItems extends ViewInfo<PlaylistItems, PlaylistItem>
    implements HasResultSet {
  final String? _alias;
  @override
  final _$HfwDatabase attachedDatabase;
  PlaylistItems(this.attachedDatabase, [this._alias]);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        collectionId,
        collectionName,
        synced,
        deleted,
        created,
        modified,
        data,
        user,
        uid,
        playlistId,
        image,
        parts,
        color,
        notes,
        text,
        order
      ];
  @override
  String get aliasedName => _alias ?? entityName;
  @override
  String get entityName => 'playlist_items';
  @override
  Map<SqlDialect, String> get createViewStatements => {
        SqlDialect.sqlite:
            'CREATE VIEW playlist_items AS SELECT * FROM local_playlist_items WHERE collection_name = \'playlist_items\'',
      };
  @override
  PlaylistItems get asDslTable => this;
  @override
  PlaylistItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PlaylistItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      collectionId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}collection_id'])!,
      collectionName: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}collection_name'])!,
      synced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}synced'])!,
      deleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}deleted'])!,
      created: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created'])!,
      modified: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}modified']),
      data: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}data'])!,
      user: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user']),
      uid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uid']),
      playlistId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}playlist_id']),
      image: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image']),
      parts: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}parts']),
      color: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}color']),
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      text: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}text']),
      order: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}order']),
    );
  }

  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> collectionId = GeneratedColumn<String>(
      'collection_id', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> collectionName = GeneratedColumn<String>(
      'collection_name', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<bool> synced = GeneratedColumn<bool>(
      'synced', aliasedName, false,
      type: DriftSqlType.bool,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("synced" IN (0, 1))'));
  late final GeneratedColumn<bool> deleted = GeneratedColumn<bool>(
      'deleted', aliasedName, false,
      type: DriftSqlType.bool,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("deleted" IN (0, 1))'));
  late final GeneratedColumn<DateTime> created = GeneratedColumn<DateTime>(
      'created', aliasedName, false,
      type: DriftSqlType.dateTime);
  late final GeneratedColumn<String> modified = GeneratedColumn<String>(
      'modified', aliasedName, true,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> data = GeneratedColumn<String>(
      'data', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> user = GeneratedColumn<String>(
      'user', aliasedName, true,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> uid = GeneratedColumn<String>(
      'uid', aliasedName, true,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> playlistId = GeneratedColumn<String>(
      'playlist_id', aliasedName, true,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
      'image', aliasedName, true,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> parts = GeneratedColumn<String>(
      'parts', aliasedName, true,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> color = GeneratedColumn<String>(
      'color', aliasedName, true,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> text = GeneratedColumn<String>(
      'text', aliasedName, true,
      type: DriftSqlType.string);
  late final GeneratedColumn<double> order = GeneratedColumn<double>(
      'order', aliasedName, true,
      type: DriftSqlType.double);
  @override
  PlaylistItems createAlias(String alias) {
    return PlaylistItems(attachedDatabase, alias);
  }

  @override
  Query? get query => null;
  @override
  Set<String> get readTables => const {'records'};
}

class PublicPlaylistItem extends DataClass {
  String id;
  String collectionId;
  String collectionName;
  bool synced;
  bool deleted;
  DateTime created;
  String? modified;
  String data;
  String? user;
  String? uid;
  String? playlistId;
  String? image;
  String? parts;
  String? color;
  String? notes;
  String? text;
  double? order;
  PublicPlaylistItem(
      {required this.id,
      required this.collectionId,
      required this.collectionName,
      required this.synced,
      required this.deleted,
      required this.created,
      this.modified,
      required this.data,
      this.user,
      this.uid,
      this.playlistId,
      this.image,
      this.parts,
      this.color,
      this.notes,
      this.text,
      this.order});
  factory PublicPlaylistItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PublicPlaylistItem(
      id: serializer.fromJson<String>(json['id']),
      collectionId: serializer.fromJson<String>(json['collection_id']),
      collectionName: serializer.fromJson<String>(json['collection_name']),
      synced: serializer.fromJson<bool>(json['synced']),
      deleted: serializer.fromJson<bool>(json['deleted']),
      created: serializer.fromJson<DateTime>(json['created']),
      modified: serializer.fromJson<String?>(json['modified']),
      data: serializer.fromJson<String>(json['data']),
      user: serializer.fromJson<String?>(json['user']),
      uid: serializer.fromJson<String?>(json['uid']),
      playlistId: serializer.fromJson<String?>(json['playlist_id']),
      image: serializer.fromJson<String?>(json['image']),
      parts: serializer.fromJson<String?>(json['parts']),
      color: serializer.fromJson<String?>(json['color']),
      notes: serializer.fromJson<String?>(json['notes']),
      text: serializer.fromJson<String?>(json['text']),
      order: serializer.fromJson<double?>(json['order']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'collection_id': serializer.toJson<String>(collectionId),
      'collection_name': serializer.toJson<String>(collectionName),
      'synced': serializer.toJson<bool>(synced),
      'deleted': serializer.toJson<bool>(deleted),
      'created': serializer.toJson<DateTime>(created),
      'modified': serializer.toJson<String?>(modified),
      'data': serializer.toJson<String>(data),
      'user': serializer.toJson<String?>(user),
      'uid': serializer.toJson<String?>(uid),
      'playlist_id': serializer.toJson<String?>(playlistId),
      'image': serializer.toJson<String?>(image),
      'parts': serializer.toJson<String?>(parts),
      'color': serializer.toJson<String?>(color),
      'notes': serializer.toJson<String?>(notes),
      'text': serializer.toJson<String?>(text),
      'order': serializer.toJson<double?>(order),
    };
  }

  PublicPlaylistItem copyWith(
          {String? id,
          String? collectionId,
          String? collectionName,
          bool? synced,
          bool? deleted,
          DateTime? created,
          Value<String?> modified = const Value.absent(),
          String? data,
          Value<String?> user = const Value.absent(),
          Value<String?> uid = const Value.absent(),
          Value<String?> playlistId = const Value.absent(),
          Value<String?> image = const Value.absent(),
          Value<String?> parts = const Value.absent(),
          Value<String?> color = const Value.absent(),
          Value<String?> notes = const Value.absent(),
          Value<String?> text = const Value.absent(),
          Value<double?> order = const Value.absent()}) =>
      PublicPlaylistItem(
        id: id ?? this.id,
        collectionId: collectionId ?? this.collectionId,
        collectionName: collectionName ?? this.collectionName,
        synced: synced ?? this.synced,
        deleted: deleted ?? this.deleted,
        created: created ?? this.created,
        modified: modified.present ? modified.value : this.modified,
        data: data ?? this.data,
        user: user.present ? user.value : this.user,
        uid: uid.present ? uid.value : this.uid,
        playlistId: playlistId.present ? playlistId.value : this.playlistId,
        image: image.present ? image.value : this.image,
        parts: parts.present ? parts.value : this.parts,
        color: color.present ? color.value : this.color,
        notes: notes.present ? notes.value : this.notes,
        text: text.present ? text.value : this.text,
        order: order.present ? order.value : this.order,
      );
  @override
  String toString() {
    return (StringBuffer('PublicPlaylistItem(')
          ..write('id: $id, ')
          ..write('collectionId: $collectionId, ')
          ..write('collectionName: $collectionName, ')
          ..write('synced: $synced, ')
          ..write('deleted: $deleted, ')
          ..write('created: $created, ')
          ..write('modified: $modified, ')
          ..write('data: $data, ')
          ..write('user: $user, ')
          ..write('uid: $uid, ')
          ..write('playlistId: $playlistId, ')
          ..write('image: $image, ')
          ..write('parts: $parts, ')
          ..write('color: $color, ')
          ..write('notes: $notes, ')
          ..write('text: $text, ')
          ..write('order: $order')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      collectionId,
      collectionName,
      synced,
      deleted,
      created,
      modified,
      data,
      user,
      uid,
      playlistId,
      image,
      parts,
      color,
      notes,
      text,
      order);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PublicPlaylistItem &&
          other.id == this.id &&
          other.collectionId == this.collectionId &&
          other.collectionName == this.collectionName &&
          other.synced == this.synced &&
          other.deleted == this.deleted &&
          other.created == this.created &&
          other.modified == this.modified &&
          other.data == this.data &&
          other.user == this.user &&
          other.uid == this.uid &&
          other.playlistId == this.playlistId &&
          other.image == this.image &&
          other.parts == this.parts &&
          other.color == this.color &&
          other.notes == this.notes &&
          other.text == this.text &&
          other.order == this.order);
}

class PublicPlaylistItems
    extends ViewInfo<PublicPlaylistItems, PublicPlaylistItem>
    implements HasResultSet {
  final String? _alias;
  @override
  final _$HfwDatabase attachedDatabase;
  PublicPlaylistItems(this.attachedDatabase, [this._alias]);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        collectionId,
        collectionName,
        synced,
        deleted,
        created,
        modified,
        data,
        user,
        uid,
        playlistId,
        image,
        parts,
        color,
        notes,
        text,
        order
      ];
  @override
  String get aliasedName => _alias ?? entityName;
  @override
  String get entityName => 'public_playlist_items';
  @override
  Map<SqlDialect, String> get createViewStatements => {
        SqlDialect.sqlite:
            'CREATE VIEW public_playlist_items AS SELECT * FROM local_playlist_items WHERE collection_name = \'public_playlist_items\' OR(collection_name = \'playlist_items\' AND playlist.public = 1)AND EXISTS (SELECT * FROM playlists AS playlist WHERE playlist.id = playlist_id AND playlist.public = 1)',
      };
  @override
  PublicPlaylistItems get asDslTable => this;
  @override
  PublicPlaylistItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PublicPlaylistItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      collectionId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}collection_id'])!,
      collectionName: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}collection_name'])!,
      synced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}synced'])!,
      deleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}deleted'])!,
      created: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created'])!,
      modified: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}modified']),
      data: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}data'])!,
      user: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user']),
      uid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uid']),
      playlistId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}playlist_id']),
      image: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image']),
      parts: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}parts']),
      color: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}color']),
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      text: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}text']),
      order: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}order']),
    );
  }

  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> collectionId = GeneratedColumn<String>(
      'collection_id', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> collectionName = GeneratedColumn<String>(
      'collection_name', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<bool> synced = GeneratedColumn<bool>(
      'synced', aliasedName, false,
      type: DriftSqlType.bool,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("synced" IN (0, 1))'));
  late final GeneratedColumn<bool> deleted = GeneratedColumn<bool>(
      'deleted', aliasedName, false,
      type: DriftSqlType.bool,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("deleted" IN (0, 1))'));
  late final GeneratedColumn<DateTime> created = GeneratedColumn<DateTime>(
      'created', aliasedName, false,
      type: DriftSqlType.dateTime);
  late final GeneratedColumn<String> modified = GeneratedColumn<String>(
      'modified', aliasedName, true,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> data = GeneratedColumn<String>(
      'data', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> user = GeneratedColumn<String>(
      'user', aliasedName, true,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> uid = GeneratedColumn<String>(
      'uid', aliasedName, true,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> playlistId = GeneratedColumn<String>(
      'playlist_id', aliasedName, true,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
      'image', aliasedName, true,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> parts = GeneratedColumn<String>(
      'parts', aliasedName, true,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> color = GeneratedColumn<String>(
      'color', aliasedName, true,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> text = GeneratedColumn<String>(
      'text', aliasedName, true,
      type: DriftSqlType.string);
  late final GeneratedColumn<double> order = GeneratedColumn<double>(
      'order', aliasedName, true,
      type: DriftSqlType.double);
  @override
  PublicPlaylistItems createAlias(String alias) {
    return PublicPlaylistItems(attachedDatabase, alias);
  }

  @override
  Query? get query => null;
  @override
  Set<String> get readTables => const {'records'};
}

class LocalPlaylist extends DataClass {
  String id;
  String collectionId;
  String collectionName;
  bool synced;
  bool deleted;
  DateTime created;
  String? modified;
  String data;
  String? user;
  String? uid;
  String? name;
  String? description;
  bool? public;
  bool? medly;
  DateTime? event;
  LocalPlaylist(
      {required this.id,
      required this.collectionId,
      required this.collectionName,
      required this.synced,
      required this.deleted,
      required this.created,
      this.modified,
      required this.data,
      this.user,
      this.uid,
      this.name,
      this.description,
      this.public,
      this.medly,
      this.event});
  factory LocalPlaylist.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocalPlaylist(
      id: serializer.fromJson<String>(json['id']),
      collectionId: serializer.fromJson<String>(json['collection_id']),
      collectionName: serializer.fromJson<String>(json['collection_name']),
      synced: serializer.fromJson<bool>(json['synced']),
      deleted: serializer.fromJson<bool>(json['deleted']),
      created: serializer.fromJson<DateTime>(json['created']),
      modified: serializer.fromJson<String?>(json['modified']),
      data: serializer.fromJson<String>(json['data']),
      user: serializer.fromJson<String?>(json['user']),
      uid: serializer.fromJson<String?>(json['uid']),
      name: serializer.fromJson<String?>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      public: serializer.fromJson<bool?>(json['public']),
      medly: serializer.fromJson<bool?>(json['medly']),
      event: serializer.fromJson<DateTime?>(json['event']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'collection_id': serializer.toJson<String>(collectionId),
      'collection_name': serializer.toJson<String>(collectionName),
      'synced': serializer.toJson<bool>(synced),
      'deleted': serializer.toJson<bool>(deleted),
      'created': serializer.toJson<DateTime>(created),
      'modified': serializer.toJson<String?>(modified),
      'data': serializer.toJson<String>(data),
      'user': serializer.toJson<String?>(user),
      'uid': serializer.toJson<String?>(uid),
      'name': serializer.toJson<String?>(name),
      'description': serializer.toJson<String?>(description),
      'public': serializer.toJson<bool?>(public),
      'medly': serializer.toJson<bool?>(medly),
      'event': serializer.toJson<DateTime?>(event),
    };
  }

  LocalPlaylist copyWith(
          {String? id,
          String? collectionId,
          String? collectionName,
          bool? synced,
          bool? deleted,
          DateTime? created,
          Value<String?> modified = const Value.absent(),
          String? data,
          Value<String?> user = const Value.absent(),
          Value<String?> uid = const Value.absent(),
          Value<String?> name = const Value.absent(),
          Value<String?> description = const Value.absent(),
          Value<bool?> public = const Value.absent(),
          Value<bool?> medly = const Value.absent(),
          Value<DateTime?> event = const Value.absent()}) =>
      LocalPlaylist(
        id: id ?? this.id,
        collectionId: collectionId ?? this.collectionId,
        collectionName: collectionName ?? this.collectionName,
        synced: synced ?? this.synced,
        deleted: deleted ?? this.deleted,
        created: created ?? this.created,
        modified: modified.present ? modified.value : this.modified,
        data: data ?? this.data,
        user: user.present ? user.value : this.user,
        uid: uid.present ? uid.value : this.uid,
        name: name.present ? name.value : this.name,
        description: description.present ? description.value : this.description,
        public: public.present ? public.value : this.public,
        medly: medly.present ? medly.value : this.medly,
        event: event.present ? event.value : this.event,
      );
  @override
  String toString() {
    return (StringBuffer('LocalPlaylist(')
          ..write('id: $id, ')
          ..write('collectionId: $collectionId, ')
          ..write('collectionName: $collectionName, ')
          ..write('synced: $synced, ')
          ..write('deleted: $deleted, ')
          ..write('created: $created, ')
          ..write('modified: $modified, ')
          ..write('data: $data, ')
          ..write('user: $user, ')
          ..write('uid: $uid, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('public: $public, ')
          ..write('medly: $medly, ')
          ..write('event: $event')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      collectionId,
      collectionName,
      synced,
      deleted,
      created,
      modified,
      data,
      user,
      uid,
      name,
      description,
      public,
      medly,
      event);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocalPlaylist &&
          other.id == this.id &&
          other.collectionId == this.collectionId &&
          other.collectionName == this.collectionName &&
          other.synced == this.synced &&
          other.deleted == this.deleted &&
          other.created == this.created &&
          other.modified == this.modified &&
          other.data == this.data &&
          other.user == this.user &&
          other.uid == this.uid &&
          other.name == this.name &&
          other.description == this.description &&
          other.public == this.public &&
          other.medly == this.medly &&
          other.event == this.event);
}

class LocalPlaylists extends ViewInfo<LocalPlaylists, LocalPlaylist>
    implements HasResultSet {
  final String? _alias;
  @override
  final _$HfwDatabase attachedDatabase;
  LocalPlaylists(this.attachedDatabase, [this._alias]);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        collectionId,
        collectionName,
        synced,
        deleted,
        created,
        modified,
        data,
        user,
        uid,
        name,
        description,
        public,
        medly,
        event
      ];
  @override
  String get aliasedName => _alias ?? entityName;
  @override
  String get entityName => 'local_playlists';
  @override
  Map<SqlDialect, String> get createViewStatements => {
        SqlDialect.sqlite:
            'CREATE VIEW local_playlists AS SELECT *, json_extract(data, \'\$.name\') AS name, CASE WHEN json_extract(data, \'\$.description\') IS NOT NULL THEN CAST(json_extract(data, \'\$.description\') AS TEXT) ELSE NULL END AS description, CASE WHEN json_extract(data, \'\$.public\') IS NOT NULL THEN CAST(json_extract(data, \'\$.public\') AS INT) ELSE NULL END AS public, CASE WHEN json_extract(data, \'\$.medly\') IS NOT NULL THEN CAST(json_extract(data, \'\$.medly\') AS INT) ELSE NULL END AS medly, CASE WHEN json_extract(data, \'\$.event\') IS NOT NULL THEN CAST(json_extract(data, \'\$.event\') AS TEXT) ELSE NULL END AS event FROM user_records WHERE collection_name = \'playlists\' OR collection_name = \'public_playlists\'',
      };
  @override
  LocalPlaylists get asDslTable => this;
  @override
  LocalPlaylist map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalPlaylist(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      collectionId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}collection_id'])!,
      collectionName: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}collection_name'])!,
      synced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}synced'])!,
      deleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}deleted'])!,
      created: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created'])!,
      modified: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}modified']),
      data: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}data'])!,
      user: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user']),
      uid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uid']),
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name']),
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      public: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}public']),
      medly: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}medly']),
      event: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}event']),
    );
  }

  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> collectionId = GeneratedColumn<String>(
      'collection_id', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> collectionName = GeneratedColumn<String>(
      'collection_name', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<bool> synced = GeneratedColumn<bool>(
      'synced', aliasedName, false,
      type: DriftSqlType.bool,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("synced" IN (0, 1))'));
  late final GeneratedColumn<bool> deleted = GeneratedColumn<bool>(
      'deleted', aliasedName, false,
      type: DriftSqlType.bool,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("deleted" IN (0, 1))'));
  late final GeneratedColumn<DateTime> created = GeneratedColumn<DateTime>(
      'created', aliasedName, false,
      type: DriftSqlType.dateTime);
  late final GeneratedColumn<String> modified = GeneratedColumn<String>(
      'modified', aliasedName, true,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> data = GeneratedColumn<String>(
      'data', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> user = GeneratedColumn<String>(
      'user', aliasedName, true,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> uid = GeneratedColumn<String>(
      'uid', aliasedName, true,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, true,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string);
  late final GeneratedColumn<bool> public = GeneratedColumn<bool>(
      'public', aliasedName, true,
      type: DriftSqlType.bool,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("public" IN (0, 1))'));
  late final GeneratedColumn<bool> medly = GeneratedColumn<bool>(
      'medly', aliasedName, true,
      type: DriftSqlType.bool,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("medly" IN (0, 1))'));
  late final GeneratedColumn<DateTime> event = GeneratedColumn<DateTime>(
      'event', aliasedName, true,
      type: DriftSqlType.dateTime);
  @override
  LocalPlaylists createAlias(String alias) {
    return LocalPlaylists(attachedDatabase, alias);
  }

  @override
  Query? get query => null;
  @override
  Set<String> get readTables => const {'records'};
}

class Playlist extends DataClass {
  String id;
  String collectionId;
  String collectionName;
  bool synced;
  bool deleted;
  DateTime created;
  String? modified;
  String data;
  String? user;
  String? uid;
  String? name;
  String? description;
  bool? public;
  bool? medly;
  DateTime? event;
  Playlist(
      {required this.id,
      required this.collectionId,
      required this.collectionName,
      required this.synced,
      required this.deleted,
      required this.created,
      this.modified,
      required this.data,
      this.user,
      this.uid,
      this.name,
      this.description,
      this.public,
      this.medly,
      this.event});
  factory Playlist.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Playlist(
      id: serializer.fromJson<String>(json['id']),
      collectionId: serializer.fromJson<String>(json['collection_id']),
      collectionName: serializer.fromJson<String>(json['collection_name']),
      synced: serializer.fromJson<bool>(json['synced']),
      deleted: serializer.fromJson<bool>(json['deleted']),
      created: serializer.fromJson<DateTime>(json['created']),
      modified: serializer.fromJson<String?>(json['modified']),
      data: serializer.fromJson<String>(json['data']),
      user: serializer.fromJson<String?>(json['user']),
      uid: serializer.fromJson<String?>(json['uid']),
      name: serializer.fromJson<String?>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      public: serializer.fromJson<bool?>(json['public']),
      medly: serializer.fromJson<bool?>(json['medly']),
      event: serializer.fromJson<DateTime?>(json['event']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'collection_id': serializer.toJson<String>(collectionId),
      'collection_name': serializer.toJson<String>(collectionName),
      'synced': serializer.toJson<bool>(synced),
      'deleted': serializer.toJson<bool>(deleted),
      'created': serializer.toJson<DateTime>(created),
      'modified': serializer.toJson<String?>(modified),
      'data': serializer.toJson<String>(data),
      'user': serializer.toJson<String?>(user),
      'uid': serializer.toJson<String?>(uid),
      'name': serializer.toJson<String?>(name),
      'description': serializer.toJson<String?>(description),
      'public': serializer.toJson<bool?>(public),
      'medly': serializer.toJson<bool?>(medly),
      'event': serializer.toJson<DateTime?>(event),
    };
  }

  Playlist copyWith(
          {String? id,
          String? collectionId,
          String? collectionName,
          bool? synced,
          bool? deleted,
          DateTime? created,
          Value<String?> modified = const Value.absent(),
          String? data,
          Value<String?> user = const Value.absent(),
          Value<String?> uid = const Value.absent(),
          Value<String?> name = const Value.absent(),
          Value<String?> description = const Value.absent(),
          Value<bool?> public = const Value.absent(),
          Value<bool?> medly = const Value.absent(),
          Value<DateTime?> event = const Value.absent()}) =>
      Playlist(
        id: id ?? this.id,
        collectionId: collectionId ?? this.collectionId,
        collectionName: collectionName ?? this.collectionName,
        synced: synced ?? this.synced,
        deleted: deleted ?? this.deleted,
        created: created ?? this.created,
        modified: modified.present ? modified.value : this.modified,
        data: data ?? this.data,
        user: user.present ? user.value : this.user,
        uid: uid.present ? uid.value : this.uid,
        name: name.present ? name.value : this.name,
        description: description.present ? description.value : this.description,
        public: public.present ? public.value : this.public,
        medly: medly.present ? medly.value : this.medly,
        event: event.present ? event.value : this.event,
      );
  @override
  String toString() {
    return (StringBuffer('Playlist(')
          ..write('id: $id, ')
          ..write('collectionId: $collectionId, ')
          ..write('collectionName: $collectionName, ')
          ..write('synced: $synced, ')
          ..write('deleted: $deleted, ')
          ..write('created: $created, ')
          ..write('modified: $modified, ')
          ..write('data: $data, ')
          ..write('user: $user, ')
          ..write('uid: $uid, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('public: $public, ')
          ..write('medly: $medly, ')
          ..write('event: $event')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      collectionId,
      collectionName,
      synced,
      deleted,
      created,
      modified,
      data,
      user,
      uid,
      name,
      description,
      public,
      medly,
      event);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Playlist &&
          other.id == this.id &&
          other.collectionId == this.collectionId &&
          other.collectionName == this.collectionName &&
          other.synced == this.synced &&
          other.deleted == this.deleted &&
          other.created == this.created &&
          other.modified == this.modified &&
          other.data == this.data &&
          other.user == this.user &&
          other.uid == this.uid &&
          other.name == this.name &&
          other.description == this.description &&
          other.public == this.public &&
          other.medly == this.medly &&
          other.event == this.event);
}

class Playlists extends ViewInfo<Playlists, Playlist> implements HasResultSet {
  final String? _alias;
  @override
  final _$HfwDatabase attachedDatabase;
  Playlists(this.attachedDatabase, [this._alias]);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        collectionId,
        collectionName,
        synced,
        deleted,
        created,
        modified,
        data,
        user,
        uid,
        name,
        description,
        public,
        medly,
        event
      ];
  @override
  String get aliasedName => _alias ?? entityName;
  @override
  String get entityName => 'playlists';
  @override
  Map<SqlDialect, String> get createViewStatements => {
        SqlDialect.sqlite:
            'CREATE VIEW playlists AS SELECT * FROM local_playlists WHERE collection_name = \'playlists\'',
      };
  @override
  Playlists get asDslTable => this;
  @override
  Playlist map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Playlist(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      collectionId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}collection_id'])!,
      collectionName: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}collection_name'])!,
      synced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}synced'])!,
      deleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}deleted'])!,
      created: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created'])!,
      modified: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}modified']),
      data: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}data'])!,
      user: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user']),
      uid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uid']),
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name']),
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      public: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}public']),
      medly: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}medly']),
      event: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}event']),
    );
  }

  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> collectionId = GeneratedColumn<String>(
      'collection_id', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> collectionName = GeneratedColumn<String>(
      'collection_name', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<bool> synced = GeneratedColumn<bool>(
      'synced', aliasedName, false,
      type: DriftSqlType.bool,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("synced" IN (0, 1))'));
  late final GeneratedColumn<bool> deleted = GeneratedColumn<bool>(
      'deleted', aliasedName, false,
      type: DriftSqlType.bool,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("deleted" IN (0, 1))'));
  late final GeneratedColumn<DateTime> created = GeneratedColumn<DateTime>(
      'created', aliasedName, false,
      type: DriftSqlType.dateTime);
  late final GeneratedColumn<String> modified = GeneratedColumn<String>(
      'modified', aliasedName, true,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> data = GeneratedColumn<String>(
      'data', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> user = GeneratedColumn<String>(
      'user', aliasedName, true,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> uid = GeneratedColumn<String>(
      'uid', aliasedName, true,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, true,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string);
  late final GeneratedColumn<bool> public = GeneratedColumn<bool>(
      'public', aliasedName, true,
      type: DriftSqlType.bool,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("public" IN (0, 1))'));
  late final GeneratedColumn<bool> medly = GeneratedColumn<bool>(
      'medly', aliasedName, true,
      type: DriftSqlType.bool,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("medly" IN (0, 1))'));
  late final GeneratedColumn<DateTime> event = GeneratedColumn<DateTime>(
      'event', aliasedName, true,
      type: DriftSqlType.dateTime);
  @override
  Playlists createAlias(String alias) {
    return Playlists(attachedDatabase, alias);
  }

  @override
  Query? get query => null;
  @override
  Set<String> get readTables => const {'records'};
}

class PublicPlaylist extends DataClass {
  String id;
  String collectionId;
  String collectionName;
  bool synced;
  bool deleted;
  DateTime created;
  String? modified;
  String data;
  String? user;
  String? uid;
  String? name;
  String? description;
  bool? public;
  bool? medly;
  DateTime? event;
  PublicPlaylist(
      {required this.id,
      required this.collectionId,
      required this.collectionName,
      required this.synced,
      required this.deleted,
      required this.created,
      this.modified,
      required this.data,
      this.user,
      this.uid,
      this.name,
      this.description,
      this.public,
      this.medly,
      this.event});
  factory PublicPlaylist.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PublicPlaylist(
      id: serializer.fromJson<String>(json['id']),
      collectionId: serializer.fromJson<String>(json['collection_id']),
      collectionName: serializer.fromJson<String>(json['collection_name']),
      synced: serializer.fromJson<bool>(json['synced']),
      deleted: serializer.fromJson<bool>(json['deleted']),
      created: serializer.fromJson<DateTime>(json['created']),
      modified: serializer.fromJson<String?>(json['modified']),
      data: serializer.fromJson<String>(json['data']),
      user: serializer.fromJson<String?>(json['user']),
      uid: serializer.fromJson<String?>(json['uid']),
      name: serializer.fromJson<String?>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      public: serializer.fromJson<bool?>(json['public']),
      medly: serializer.fromJson<bool?>(json['medly']),
      event: serializer.fromJson<DateTime?>(json['event']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'collection_id': serializer.toJson<String>(collectionId),
      'collection_name': serializer.toJson<String>(collectionName),
      'synced': serializer.toJson<bool>(synced),
      'deleted': serializer.toJson<bool>(deleted),
      'created': serializer.toJson<DateTime>(created),
      'modified': serializer.toJson<String?>(modified),
      'data': serializer.toJson<String>(data),
      'user': serializer.toJson<String?>(user),
      'uid': serializer.toJson<String?>(uid),
      'name': serializer.toJson<String?>(name),
      'description': serializer.toJson<String?>(description),
      'public': serializer.toJson<bool?>(public),
      'medly': serializer.toJson<bool?>(medly),
      'event': serializer.toJson<DateTime?>(event),
    };
  }

  PublicPlaylist copyWith(
          {String? id,
          String? collectionId,
          String? collectionName,
          bool? synced,
          bool? deleted,
          DateTime? created,
          Value<String?> modified = const Value.absent(),
          String? data,
          Value<String?> user = const Value.absent(),
          Value<String?> uid = const Value.absent(),
          Value<String?> name = const Value.absent(),
          Value<String?> description = const Value.absent(),
          Value<bool?> public = const Value.absent(),
          Value<bool?> medly = const Value.absent(),
          Value<DateTime?> event = const Value.absent()}) =>
      PublicPlaylist(
        id: id ?? this.id,
        collectionId: collectionId ?? this.collectionId,
        collectionName: collectionName ?? this.collectionName,
        synced: synced ?? this.synced,
        deleted: deleted ?? this.deleted,
        created: created ?? this.created,
        modified: modified.present ? modified.value : this.modified,
        data: data ?? this.data,
        user: user.present ? user.value : this.user,
        uid: uid.present ? uid.value : this.uid,
        name: name.present ? name.value : this.name,
        description: description.present ? description.value : this.description,
        public: public.present ? public.value : this.public,
        medly: medly.present ? medly.value : this.medly,
        event: event.present ? event.value : this.event,
      );
  @override
  String toString() {
    return (StringBuffer('PublicPlaylist(')
          ..write('id: $id, ')
          ..write('collectionId: $collectionId, ')
          ..write('collectionName: $collectionName, ')
          ..write('synced: $synced, ')
          ..write('deleted: $deleted, ')
          ..write('created: $created, ')
          ..write('modified: $modified, ')
          ..write('data: $data, ')
          ..write('user: $user, ')
          ..write('uid: $uid, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('public: $public, ')
          ..write('medly: $medly, ')
          ..write('event: $event')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      collectionId,
      collectionName,
      synced,
      deleted,
      created,
      modified,
      data,
      user,
      uid,
      name,
      description,
      public,
      medly,
      event);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PublicPlaylist &&
          other.id == this.id &&
          other.collectionId == this.collectionId &&
          other.collectionName == this.collectionName &&
          other.synced == this.synced &&
          other.deleted == this.deleted &&
          other.created == this.created &&
          other.modified == this.modified &&
          other.data == this.data &&
          other.user == this.user &&
          other.uid == this.uid &&
          other.name == this.name &&
          other.description == this.description &&
          other.public == this.public &&
          other.medly == this.medly &&
          other.event == this.event);
}

class PublicPlaylists extends ViewInfo<PublicPlaylists, PublicPlaylist>
    implements HasResultSet {
  final String? _alias;
  @override
  final _$HfwDatabase attachedDatabase;
  PublicPlaylists(this.attachedDatabase, [this._alias]);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        collectionId,
        collectionName,
        synced,
        deleted,
        created,
        modified,
        data,
        user,
        uid,
        name,
        description,
        public,
        medly,
        event
      ];
  @override
  String get aliasedName => _alias ?? entityName;
  @override
  String get entityName => 'public_playlists';
  @override
  Map<SqlDialect, String> get createViewStatements => {
        SqlDialect.sqlite:
            'CREATE VIEW public_playlists AS SELECT * FROM local_playlists WHERE collection_name = \'public_playlists\' OR(collection_name = \'playlists\' AND public = 1)',
      };
  @override
  PublicPlaylists get asDslTable => this;
  @override
  PublicPlaylist map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PublicPlaylist(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      collectionId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}collection_id'])!,
      collectionName: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}collection_name'])!,
      synced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}synced'])!,
      deleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}deleted'])!,
      created: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created'])!,
      modified: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}modified']),
      data: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}data'])!,
      user: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user']),
      uid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uid']),
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name']),
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      public: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}public']),
      medly: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}medly']),
      event: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}event']),
    );
  }

  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> collectionId = GeneratedColumn<String>(
      'collection_id', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> collectionName = GeneratedColumn<String>(
      'collection_name', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<bool> synced = GeneratedColumn<bool>(
      'synced', aliasedName, false,
      type: DriftSqlType.bool,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("synced" IN (0, 1))'));
  late final GeneratedColumn<bool> deleted = GeneratedColumn<bool>(
      'deleted', aliasedName, false,
      type: DriftSqlType.bool,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("deleted" IN (0, 1))'));
  late final GeneratedColumn<DateTime> created = GeneratedColumn<DateTime>(
      'created', aliasedName, false,
      type: DriftSqlType.dateTime);
  late final GeneratedColumn<String> modified = GeneratedColumn<String>(
      'modified', aliasedName, true,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> data = GeneratedColumn<String>(
      'data', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> user = GeneratedColumn<String>(
      'user', aliasedName, true,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> uid = GeneratedColumn<String>(
      'uid', aliasedName, true,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, true,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string);
  late final GeneratedColumn<bool> public = GeneratedColumn<bool>(
      'public', aliasedName, true,
      type: DriftSqlType.bool,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("public" IN (0, 1))'));
  late final GeneratedColumn<bool> medly = GeneratedColumn<bool>(
      'medly', aliasedName, true,
      type: DriftSqlType.bool,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("medly" IN (0, 1))'));
  late final GeneratedColumn<DateTime> event = GeneratedColumn<DateTime>(
      'event', aliasedName, true,
      type: DriftSqlType.dateTime);
  @override
  PublicPlaylists createAlias(String alias) {
    return PublicPlaylists(attachedDatabase, alias);
  }

  @override
  Query? get query => null;
  @override
  Set<String> get readTables => const {'records'};
}

class PlaylistsFts extends Table
    with
        TableInfo<PlaylistsFts, PlaylistsFt>,
        VirtualTableInfo<PlaylistsFts, PlaylistsFt> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  PlaylistsFts(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: '');
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: '');
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: '');
  @override
  List<GeneratedColumn> get $columns => [id, name, description];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'playlists_fts';
  @override
  VerificationContext validateIntegrity(Insertable<PlaylistsFt> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  PlaylistsFt map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PlaylistsFt(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
    );
  }

  @override
  PlaylistsFts createAlias(String alias) {
    return PlaylistsFts(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
  @override
  String get moduleAndArgs => 'fts5(content=playlists, id, name, description)';
}

class PlaylistsFt extends DataClass implements Insertable<PlaylistsFt> {
  String id;
  String name;
  String description;
  PlaylistsFt(
      {required this.id, required this.name, required this.description});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    return map;
  }

  PlaylistsFtsCompanion toCompanion(bool nullToAbsent) {
    return PlaylistsFtsCompanion(
      id: Value(id),
      name: Value(name),
      description: Value(description),
    );
  }

  factory PlaylistsFt.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PlaylistsFt(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
    };
  }

  PlaylistsFt copyWith({String? id, String? name, String? description}) =>
      PlaylistsFt(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
      );
  @override
  String toString() {
    return (StringBuffer('PlaylistsFt(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, description);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PlaylistsFt &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description);
}

class PlaylistsFtsCompanion extends UpdateCompanion<PlaylistsFt> {
  Value<String> id;
  Value<String> name;
  Value<String> description;
  Value<int> rowid;
  PlaylistsFtsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PlaylistsFtsCompanion.insert({
    required String id,
    required String name,
    required String description,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        description = Value(description);
  static Insertable<PlaylistsFt> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PlaylistsFtsCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String>? description,
      Value<int>? rowid}) {
    return PlaylistsFtsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlaylistsFtsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class PublicPlaylistsFts extends Table
    with
        TableInfo<PublicPlaylistsFts, PublicPlaylistsFt>,
        VirtualTableInfo<PublicPlaylistsFts, PublicPlaylistsFt> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  PublicPlaylistsFts(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: '');
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: '');
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: '');
  @override
  List<GeneratedColumn> get $columns => [id, name, description];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'public_playlists_fts';
  @override
  VerificationContext validateIntegrity(Insertable<PublicPlaylistsFt> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  PublicPlaylistsFt map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PublicPlaylistsFt(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
    );
  }

  @override
  PublicPlaylistsFts createAlias(String alias) {
    return PublicPlaylistsFts(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
  @override
  String get moduleAndArgs =>
      'fts5(content=public_playlists, id, name, description)';
}

class PublicPlaylistsFt extends DataClass
    implements Insertable<PublicPlaylistsFt> {
  String id;
  String name;
  String description;
  PublicPlaylistsFt(
      {required this.id, required this.name, required this.description});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    return map;
  }

  PublicPlaylistsFtsCompanion toCompanion(bool nullToAbsent) {
    return PublicPlaylistsFtsCompanion(
      id: Value(id),
      name: Value(name),
      description: Value(description),
    );
  }

  factory PublicPlaylistsFt.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PublicPlaylistsFt(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
    };
  }

  PublicPlaylistsFt copyWith({String? id, String? name, String? description}) =>
      PublicPlaylistsFt(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
      );
  @override
  String toString() {
    return (StringBuffer('PublicPlaylistsFt(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, description);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PublicPlaylistsFt &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description);
}

class PublicPlaylistsFtsCompanion extends UpdateCompanion<PublicPlaylistsFt> {
  Value<String> id;
  Value<String> name;
  Value<String> description;
  Value<int> rowid;
  PublicPlaylistsFtsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PublicPlaylistsFtsCompanion.insert({
    required String id,
    required String name,
    required String description,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        description = Value(description);
  static Insertable<PublicPlaylistsFt> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PublicPlaylistsFtsCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String>? description,
      Value<int>? rowid}) {
    return PublicPlaylistsFtsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PublicPlaylistsFtsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class HymnPortions extends Table with TableInfo<HymnPortions, HymnPortion> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  HymnPortions(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'PRIMARY KEY AUTOINCREMENT');
  static const VerificationMeta _portionIdMeta =
      const VerificationMeta('portionId');
  late final GeneratedColumn<String> portionId = GeneratedColumn<String>(
      'portionId', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _hymnIdMeta = const VerificationMeta('hymnId');
  late final GeneratedColumn<String> hymnId = GeneratedColumn<String>(
      'hymnId', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _createdMeta =
      const VerificationMeta('created');
  late final GeneratedColumn<DateTime> created = GeneratedColumn<DateTime>(
      'created', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _updatedMeta =
      const VerificationMeta('updated');
  late final GeneratedColumn<DateTime> updated = GeneratedColumn<DateTime>(
      'updated', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns =>
      [id, portionId, hymnId, created, updated];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'hymn_portions';
  @override
  VerificationContext validateIntegrity(Insertable<HymnPortion> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('portionId')) {
      context.handle(_portionIdMeta,
          portionId.isAcceptableOrUnknown(data['portionId']!, _portionIdMeta));
    } else if (isInserting) {
      context.missing(_portionIdMeta);
    }
    if (data.containsKey('hymnId')) {
      context.handle(_hymnIdMeta,
          hymnId.isAcceptableOrUnknown(data['hymnId']!, _hymnIdMeta));
    } else if (isInserting) {
      context.missing(_hymnIdMeta);
    }
    if (data.containsKey('created')) {
      context.handle(_createdMeta,
          created.isAcceptableOrUnknown(data['created']!, _createdMeta));
    } else if (isInserting) {
      context.missing(_createdMeta);
    }
    if (data.containsKey('updated')) {
      context.handle(_updatedMeta,
          updated.isAcceptableOrUnknown(data['updated']!, _updatedMeta));
    } else if (isInserting) {
      context.missing(_updatedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {portionId, hymnId},
      ];
  @override
  HymnPortion map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HymnPortion(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      portionId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}portionId'])!,
      hymnId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}hymnId'])!,
      created: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created'])!,
      updated: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated'])!,
    );
  }

  @override
  HymnPortions createAlias(String alias) {
    return HymnPortions(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const ['UNIQUE(portionId, hymnId)'];
  @override
  bool get dontWriteConstraints => true;
}

class HymnPortion extends DataClass implements Insertable<HymnPortion> {
  int id;
  String portionId;
  String hymnId;
  DateTime created;
  DateTime updated;
  HymnPortion(
      {required this.id,
      required this.portionId,
      required this.hymnId,
      required this.created,
      required this.updated});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['portionId'] = Variable<String>(portionId);
    map['hymnId'] = Variable<String>(hymnId);
    map['created'] = Variable<DateTime>(created);
    map['updated'] = Variable<DateTime>(updated);
    return map;
  }

  HymnPortionsCompanion toCompanion(bool nullToAbsent) {
    return HymnPortionsCompanion(
      id: Value(id),
      portionId: Value(portionId),
      hymnId: Value(hymnId),
      created: Value(created),
      updated: Value(updated),
    );
  }

  factory HymnPortion.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HymnPortion(
      id: serializer.fromJson<int>(json['id']),
      portionId: serializer.fromJson<String>(json['portionId']),
      hymnId: serializer.fromJson<String>(json['hymnId']),
      created: serializer.fromJson<DateTime>(json['created']),
      updated: serializer.fromJson<DateTime>(json['updated']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'portionId': serializer.toJson<String>(portionId),
      'hymnId': serializer.toJson<String>(hymnId),
      'created': serializer.toJson<DateTime>(created),
      'updated': serializer.toJson<DateTime>(updated),
    };
  }

  HymnPortion copyWith(
          {int? id,
          String? portionId,
          String? hymnId,
          DateTime? created,
          DateTime? updated}) =>
      HymnPortion(
        id: id ?? this.id,
        portionId: portionId ?? this.portionId,
        hymnId: hymnId ?? this.hymnId,
        created: created ?? this.created,
        updated: updated ?? this.updated,
      );
  @override
  String toString() {
    return (StringBuffer('HymnPortion(')
          ..write('id: $id, ')
          ..write('portionId: $portionId, ')
          ..write('hymnId: $hymnId, ')
          ..write('created: $created, ')
          ..write('updated: $updated')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, portionId, hymnId, created, updated);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HymnPortion &&
          other.id == this.id &&
          other.portionId == this.portionId &&
          other.hymnId == this.hymnId &&
          other.created == this.created &&
          other.updated == this.updated);
}

class HymnPortionsCompanion extends UpdateCompanion<HymnPortion> {
  Value<int> id;
  Value<String> portionId;
  Value<String> hymnId;
  Value<DateTime> created;
  Value<DateTime> updated;
  HymnPortionsCompanion({
    this.id = const Value.absent(),
    this.portionId = const Value.absent(),
    this.hymnId = const Value.absent(),
    this.created = const Value.absent(),
    this.updated = const Value.absent(),
  });
  HymnPortionsCompanion.insert({
    this.id = const Value.absent(),
    required String portionId,
    required String hymnId,
    required DateTime created,
    required DateTime updated,
  })  : portionId = Value(portionId),
        hymnId = Value(hymnId),
        created = Value(created),
        updated = Value(updated);
  static Insertable<HymnPortion> custom({
    Expression<int>? id,
    Expression<String>? portionId,
    Expression<String>? hymnId,
    Expression<DateTime>? created,
    Expression<DateTime>? updated,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (portionId != null) 'portionId': portionId,
      if (hymnId != null) 'hymnId': hymnId,
      if (created != null) 'created': created,
      if (updated != null) 'updated': updated,
    });
  }

  HymnPortionsCompanion copyWith(
      {Value<int>? id,
      Value<String>? portionId,
      Value<String>? hymnId,
      Value<DateTime>? created,
      Value<DateTime>? updated}) {
    return HymnPortionsCompanion(
      id: id ?? this.id,
      portionId: portionId ?? this.portionId,
      hymnId: hymnId ?? this.hymnId,
      created: created ?? this.created,
      updated: updated ?? this.updated,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (portionId.present) {
      map['portionId'] = Variable<String>(portionId.value);
    }
    if (hymnId.present) {
      map['hymnId'] = Variable<String>(hymnId.value);
    }
    if (created.present) {
      map['created'] = Variable<DateTime>(created.value);
    }
    if (updated.present) {
      map['updated'] = Variable<DateTime>(updated.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HymnPortionsCompanion(')
          ..write('id: $id, ')
          ..write('portionId: $portionId, ')
          ..write('hymnId: $hymnId, ')
          ..write('created: $created, ')
          ..write('updated: $updated')
          ..write(')'))
        .toString();
  }
}

class Hymns extends Table with TableInfo<Hymns, Hymn> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Hymns(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'PRIMARY KEY NOT NULL');
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _numberMeta = const VerificationMeta('number');
  late final GeneratedColumn<String> number = GeneratedColumn<String>(
      'number', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _tuneNameMeta =
      const VerificationMeta('tuneName');
  late final GeneratedColumn<String> tuneName = GeneratedColumn<String>(
      'tuneName', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _startingKeyMeta =
      const VerificationMeta('startingKey');
  late final GeneratedColumn<String> startingKey = GeneratedColumn<String>(
      'startingKey', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _beatPatternMeta =
      const VerificationMeta('beatPattern');
  late final GeneratedColumn<String> beatPattern = GeneratedColumn<String>(
      'beatPattern', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _startingPitchMeta =
      const VerificationMeta('startingPitch');
  late final GeneratedColumn<String> startingPitch = GeneratedColumn<String>(
      'startingPitch', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _startingBeatMeta =
      const VerificationMeta('startingBeat');
  late final GeneratedColumn<String> startingBeat = GeneratedColumn<String>(
      'startingBeat', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _startingPitchDirectionMeta =
      const VerificationMeta('startingPitchDirection');
  late final GeneratedColumn<String> startingPitchDirection =
      GeneratedColumn<String>('startingPitchDirection', aliasedName, true,
          type: DriftSqlType.string,
          requiredDuringInsert: false,
          $customConstraints: '');
  static const VerificationMeta _timeSignatureMeta =
      const VerificationMeta('timeSignature');
  late final GeneratedColumn<String> timeSignature = GeneratedColumn<String>(
      'timeSignature', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _complexTimeSignatureMeta =
      const VerificationMeta('complexTimeSignature');
  late final GeneratedColumn<String> complexTimeSignature =
      GeneratedColumn<String>('complexTimeSignature', aliasedName, true,
          type: DriftSqlType.string,
          requiredDuringInsert: false,
          $customConstraints: '');
  static const VerificationMeta _createdMeta =
      const VerificationMeta('created');
  late final GeneratedColumn<DateTime> created = GeneratedColumn<DateTime>(
      'created', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _updatedMeta =
      const VerificationMeta('updated');
  late final GeneratedColumn<DateTime> updated = GeneratedColumn<DateTime>(
      'updated', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        number,
        tuneName,
        startingKey,
        beatPattern,
        startingPitch,
        startingBeat,
        startingPitchDirection,
        timeSignature,
        complexTimeSignature,
        created,
        updated
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'hymns';
  @override
  VerificationContext validateIntegrity(Insertable<Hymn> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('number')) {
      context.handle(_numberMeta,
          number.isAcceptableOrUnknown(data['number']!, _numberMeta));
    } else if (isInserting) {
      context.missing(_numberMeta);
    }
    if (data.containsKey('tuneName')) {
      context.handle(_tuneNameMeta,
          tuneName.isAcceptableOrUnknown(data['tuneName']!, _tuneNameMeta));
    }
    if (data.containsKey('startingKey')) {
      context.handle(
          _startingKeyMeta,
          startingKey.isAcceptableOrUnknown(
              data['startingKey']!, _startingKeyMeta));
    }
    if (data.containsKey('beatPattern')) {
      context.handle(
          _beatPatternMeta,
          beatPattern.isAcceptableOrUnknown(
              data['beatPattern']!, _beatPatternMeta));
    }
    if (data.containsKey('startingPitch')) {
      context.handle(
          _startingPitchMeta,
          startingPitch.isAcceptableOrUnknown(
              data['startingPitch']!, _startingPitchMeta));
    }
    if (data.containsKey('startingBeat')) {
      context.handle(
          _startingBeatMeta,
          startingBeat.isAcceptableOrUnknown(
              data['startingBeat']!, _startingBeatMeta));
    }
    if (data.containsKey('startingPitchDirection')) {
      context.handle(
          _startingPitchDirectionMeta,
          startingPitchDirection.isAcceptableOrUnknown(
              data['startingPitchDirection']!, _startingPitchDirectionMeta));
    }
    if (data.containsKey('timeSignature')) {
      context.handle(
          _timeSignatureMeta,
          timeSignature.isAcceptableOrUnknown(
              data['timeSignature']!, _timeSignatureMeta));
    }
    if (data.containsKey('complexTimeSignature')) {
      context.handle(
          _complexTimeSignatureMeta,
          complexTimeSignature.isAcceptableOrUnknown(
              data['complexTimeSignature']!, _complexTimeSignatureMeta));
    }
    if (data.containsKey('created')) {
      context.handle(_createdMeta,
          created.isAcceptableOrUnknown(data['created']!, _createdMeta));
    } else if (isInserting) {
      context.missing(_createdMeta);
    }
    if (data.containsKey('updated')) {
      context.handle(_updatedMeta,
          updated.isAcceptableOrUnknown(data['updated']!, _updatedMeta));
    } else if (isInserting) {
      context.missing(_updatedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {title, number},
      ];
  @override
  Hymn map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Hymn(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      number: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}number'])!,
      tuneName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tuneName']),
      startingKey: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}startingKey']),
      beatPattern: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}beatPattern']),
      startingPitch: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}startingPitch']),
      startingBeat: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}startingBeat']),
      startingPitchDirection: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}startingPitchDirection']),
      timeSignature: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}timeSignature']),
      complexTimeSignature: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}complexTimeSignature']),
      created: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created'])!,
      updated: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated'])!,
    );
  }

  @override
  Hymns createAlias(String alias) {
    return Hymns(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const ['UNIQUE(title, number)'];
  @override
  bool get dontWriteConstraints => true;
}

class Hymn extends DataClass implements Insertable<Hymn> {
  String id;
  String title;
  String number;
  String? tuneName;
  String? startingKey;
  String? beatPattern;
  String? startingPitch;
  String? startingBeat;
  String? startingPitchDirection;
  String? timeSignature;
  String? complexTimeSignature;
  DateTime created;
  DateTime updated;
  Hymn(
      {required this.id,
      required this.title,
      required this.number,
      this.tuneName,
      this.startingKey,
      this.beatPattern,
      this.startingPitch,
      this.startingBeat,
      this.startingPitchDirection,
      this.timeSignature,
      this.complexTimeSignature,
      required this.created,
      required this.updated});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['number'] = Variable<String>(number);
    if (!nullToAbsent || tuneName != null) {
      map['tuneName'] = Variable<String>(tuneName);
    }
    if (!nullToAbsent || startingKey != null) {
      map['startingKey'] = Variable<String>(startingKey);
    }
    if (!nullToAbsent || beatPattern != null) {
      map['beatPattern'] = Variable<String>(beatPattern);
    }
    if (!nullToAbsent || startingPitch != null) {
      map['startingPitch'] = Variable<String>(startingPitch);
    }
    if (!nullToAbsent || startingBeat != null) {
      map['startingBeat'] = Variable<String>(startingBeat);
    }
    if (!nullToAbsent || startingPitchDirection != null) {
      map['startingPitchDirection'] = Variable<String>(startingPitchDirection);
    }
    if (!nullToAbsent || timeSignature != null) {
      map['timeSignature'] = Variable<String>(timeSignature);
    }
    if (!nullToAbsent || complexTimeSignature != null) {
      map['complexTimeSignature'] = Variable<String>(complexTimeSignature);
    }
    map['created'] = Variable<DateTime>(created);
    map['updated'] = Variable<DateTime>(updated);
    return map;
  }

  HymnsCompanion toCompanion(bool nullToAbsent) {
    return HymnsCompanion(
      id: Value(id),
      title: Value(title),
      number: Value(number),
      tuneName: tuneName == null && nullToAbsent
          ? const Value.absent()
          : Value(tuneName),
      startingKey: startingKey == null && nullToAbsent
          ? const Value.absent()
          : Value(startingKey),
      beatPattern: beatPattern == null && nullToAbsent
          ? const Value.absent()
          : Value(beatPattern),
      startingPitch: startingPitch == null && nullToAbsent
          ? const Value.absent()
          : Value(startingPitch),
      startingBeat: startingBeat == null && nullToAbsent
          ? const Value.absent()
          : Value(startingBeat),
      startingPitchDirection: startingPitchDirection == null && nullToAbsent
          ? const Value.absent()
          : Value(startingPitchDirection),
      timeSignature: timeSignature == null && nullToAbsent
          ? const Value.absent()
          : Value(timeSignature),
      complexTimeSignature: complexTimeSignature == null && nullToAbsent
          ? const Value.absent()
          : Value(complexTimeSignature),
      created: Value(created),
      updated: Value(updated),
    );
  }

  factory Hymn.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Hymn(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      number: serializer.fromJson<String>(json['number']),
      tuneName: serializer.fromJson<String?>(json['tuneName']),
      startingKey: serializer.fromJson<String?>(json['startingKey']),
      beatPattern: serializer.fromJson<String?>(json['beatPattern']),
      startingPitch: serializer.fromJson<String?>(json['startingPitch']),
      startingBeat: serializer.fromJson<String?>(json['startingBeat']),
      startingPitchDirection:
          serializer.fromJson<String?>(json['startingPitchDirection']),
      timeSignature: serializer.fromJson<String?>(json['timeSignature']),
      complexTimeSignature:
          serializer.fromJson<String?>(json['complexTimeSignature']),
      created: serializer.fromJson<DateTime>(json['created']),
      updated: serializer.fromJson<DateTime>(json['updated']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'number': serializer.toJson<String>(number),
      'tuneName': serializer.toJson<String?>(tuneName),
      'startingKey': serializer.toJson<String?>(startingKey),
      'beatPattern': serializer.toJson<String?>(beatPattern),
      'startingPitch': serializer.toJson<String?>(startingPitch),
      'startingBeat': serializer.toJson<String?>(startingBeat),
      'startingPitchDirection':
          serializer.toJson<String?>(startingPitchDirection),
      'timeSignature': serializer.toJson<String?>(timeSignature),
      'complexTimeSignature': serializer.toJson<String?>(complexTimeSignature),
      'created': serializer.toJson<DateTime>(created),
      'updated': serializer.toJson<DateTime>(updated),
    };
  }

  Hymn copyWith(
          {String? id,
          String? title,
          String? number,
          Value<String?> tuneName = const Value.absent(),
          Value<String?> startingKey = const Value.absent(),
          Value<String?> beatPattern = const Value.absent(),
          Value<String?> startingPitch = const Value.absent(),
          Value<String?> startingBeat = const Value.absent(),
          Value<String?> startingPitchDirection = const Value.absent(),
          Value<String?> timeSignature = const Value.absent(),
          Value<String?> complexTimeSignature = const Value.absent(),
          DateTime? created,
          DateTime? updated}) =>
      Hymn(
        id: id ?? this.id,
        title: title ?? this.title,
        number: number ?? this.number,
        tuneName: tuneName.present ? tuneName.value : this.tuneName,
        startingKey: startingKey.present ? startingKey.value : this.startingKey,
        beatPattern: beatPattern.present ? beatPattern.value : this.beatPattern,
        startingPitch:
            startingPitch.present ? startingPitch.value : this.startingPitch,
        startingBeat:
            startingBeat.present ? startingBeat.value : this.startingBeat,
        startingPitchDirection: startingPitchDirection.present
            ? startingPitchDirection.value
            : this.startingPitchDirection,
        timeSignature:
            timeSignature.present ? timeSignature.value : this.timeSignature,
        complexTimeSignature: complexTimeSignature.present
            ? complexTimeSignature.value
            : this.complexTimeSignature,
        created: created ?? this.created,
        updated: updated ?? this.updated,
      );
  @override
  String toString() {
    return (StringBuffer('Hymn(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('number: $number, ')
          ..write('tuneName: $tuneName, ')
          ..write('startingKey: $startingKey, ')
          ..write('beatPattern: $beatPattern, ')
          ..write('startingPitch: $startingPitch, ')
          ..write('startingBeat: $startingBeat, ')
          ..write('startingPitchDirection: $startingPitchDirection, ')
          ..write('timeSignature: $timeSignature, ')
          ..write('complexTimeSignature: $complexTimeSignature, ')
          ..write('created: $created, ')
          ..write('updated: $updated')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      title,
      number,
      tuneName,
      startingKey,
      beatPattern,
      startingPitch,
      startingBeat,
      startingPitchDirection,
      timeSignature,
      complexTimeSignature,
      created,
      updated);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Hymn &&
          other.id == this.id &&
          other.title == this.title &&
          other.number == this.number &&
          other.tuneName == this.tuneName &&
          other.startingKey == this.startingKey &&
          other.beatPattern == this.beatPattern &&
          other.startingPitch == this.startingPitch &&
          other.startingBeat == this.startingBeat &&
          other.startingPitchDirection == this.startingPitchDirection &&
          other.timeSignature == this.timeSignature &&
          other.complexTimeSignature == this.complexTimeSignature &&
          other.created == this.created &&
          other.updated == this.updated);
}

class HymnsCompanion extends UpdateCompanion<Hymn> {
  Value<String> id;
  Value<String> title;
  Value<String> number;
  Value<String?> tuneName;
  Value<String?> startingKey;
  Value<String?> beatPattern;
  Value<String?> startingPitch;
  Value<String?> startingBeat;
  Value<String?> startingPitchDirection;
  Value<String?> timeSignature;
  Value<String?> complexTimeSignature;
  Value<DateTime> created;
  Value<DateTime> updated;
  Value<int> rowid;
  HymnsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.number = const Value.absent(),
    this.tuneName = const Value.absent(),
    this.startingKey = const Value.absent(),
    this.beatPattern = const Value.absent(),
    this.startingPitch = const Value.absent(),
    this.startingBeat = const Value.absent(),
    this.startingPitchDirection = const Value.absent(),
    this.timeSignature = const Value.absent(),
    this.complexTimeSignature = const Value.absent(),
    this.created = const Value.absent(),
    this.updated = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  HymnsCompanion.insert({
    required String id,
    required String title,
    required String number,
    this.tuneName = const Value.absent(),
    this.startingKey = const Value.absent(),
    this.beatPattern = const Value.absent(),
    this.startingPitch = const Value.absent(),
    this.startingBeat = const Value.absent(),
    this.startingPitchDirection = const Value.absent(),
    this.timeSignature = const Value.absent(),
    this.complexTimeSignature = const Value.absent(),
    required DateTime created,
    required DateTime updated,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        title = Value(title),
        number = Value(number),
        created = Value(created),
        updated = Value(updated);
  static Insertable<Hymn> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? number,
    Expression<String>? tuneName,
    Expression<String>? startingKey,
    Expression<String>? beatPattern,
    Expression<String>? startingPitch,
    Expression<String>? startingBeat,
    Expression<String>? startingPitchDirection,
    Expression<String>? timeSignature,
    Expression<String>? complexTimeSignature,
    Expression<DateTime>? created,
    Expression<DateTime>? updated,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (number != null) 'number': number,
      if (tuneName != null) 'tuneName': tuneName,
      if (startingKey != null) 'startingKey': startingKey,
      if (beatPattern != null) 'beatPattern': beatPattern,
      if (startingPitch != null) 'startingPitch': startingPitch,
      if (startingBeat != null) 'startingBeat': startingBeat,
      if (startingPitchDirection != null)
        'startingPitchDirection': startingPitchDirection,
      if (timeSignature != null) 'timeSignature': timeSignature,
      if (complexTimeSignature != null)
        'complexTimeSignature': complexTimeSignature,
      if (created != null) 'created': created,
      if (updated != null) 'updated': updated,
      if (rowid != null) 'rowid': rowid,
    });
  }

  HymnsCompanion copyWith(
      {Value<String>? id,
      Value<String>? title,
      Value<String>? number,
      Value<String?>? tuneName,
      Value<String?>? startingKey,
      Value<String?>? beatPattern,
      Value<String?>? startingPitch,
      Value<String?>? startingBeat,
      Value<String?>? startingPitchDirection,
      Value<String?>? timeSignature,
      Value<String?>? complexTimeSignature,
      Value<DateTime>? created,
      Value<DateTime>? updated,
      Value<int>? rowid}) {
    return HymnsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      number: number ?? this.number,
      tuneName: tuneName ?? this.tuneName,
      startingKey: startingKey ?? this.startingKey,
      beatPattern: beatPattern ?? this.beatPattern,
      startingPitch: startingPitch ?? this.startingPitch,
      startingBeat: startingBeat ?? this.startingBeat,
      startingPitchDirection:
          startingPitchDirection ?? this.startingPitchDirection,
      timeSignature: timeSignature ?? this.timeSignature,
      complexTimeSignature: complexTimeSignature ?? this.complexTimeSignature,
      created: created ?? this.created,
      updated: updated ?? this.updated,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (number.present) {
      map['number'] = Variable<String>(number.value);
    }
    if (tuneName.present) {
      map['tuneName'] = Variable<String>(tuneName.value);
    }
    if (startingKey.present) {
      map['startingKey'] = Variable<String>(startingKey.value);
    }
    if (beatPattern.present) {
      map['beatPattern'] = Variable<String>(beatPattern.value);
    }
    if (startingPitch.present) {
      map['startingPitch'] = Variable<String>(startingPitch.value);
    }
    if (startingBeat.present) {
      map['startingBeat'] = Variable<String>(startingBeat.value);
    }
    if (startingPitchDirection.present) {
      map['startingPitchDirection'] =
          Variable<String>(startingPitchDirection.value);
    }
    if (timeSignature.present) {
      map['timeSignature'] = Variable<String>(timeSignature.value);
    }
    if (complexTimeSignature.present) {
      map['complexTimeSignature'] =
          Variable<String>(complexTimeSignature.value);
    }
    if (created.present) {
      map['created'] = Variable<DateTime>(created.value);
    }
    if (updated.present) {
      map['updated'] = Variable<DateTime>(updated.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HymnsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('number: $number, ')
          ..write('tuneName: $tuneName, ')
          ..write('startingKey: $startingKey, ')
          ..write('beatPattern: $beatPattern, ')
          ..write('startingPitch: $startingPitch, ')
          ..write('startingBeat: $startingBeat, ')
          ..write('startingPitchDirection: $startingPitchDirection, ')
          ..write('timeSignature: $timeSignature, ')
          ..write('complexTimeSignature: $complexTimeSignature, ')
          ..write('created: $created, ')
          ..write('updated: $updated, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class Portions extends Table with TableInfo<Portions, Portion> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Portions(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'PRIMARY KEY NOT NULL');
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _lyricsMeta = const VerificationMeta('lyrics');
  late final GeneratedColumn<String> lyrics = GeneratedColumn<String>(
      'lyrics', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _hymnPortionIdMeta =
      const VerificationMeta('hymnPortionId');
  late final GeneratedColumn<String> hymnPortionId = GeneratedColumn<String>(
      'hymnPortionId', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _createdMeta =
      const VerificationMeta('created');
  late final GeneratedColumn<DateTime> created = GeneratedColumn<DateTime>(
      'created', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _updatedMeta =
      const VerificationMeta('updated');
  late final GeneratedColumn<DateTime> updated = GeneratedColumn<DateTime>(
      'updated', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, lyrics, hymnPortionId, created, updated];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'portions';
  @override
  VerificationContext validateIntegrity(Insertable<Portion> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('lyrics')) {
      context.handle(_lyricsMeta,
          lyrics.isAcceptableOrUnknown(data['lyrics']!, _lyricsMeta));
    } else if (isInserting) {
      context.missing(_lyricsMeta);
    }
    if (data.containsKey('hymnPortionId')) {
      context.handle(
          _hymnPortionIdMeta,
          hymnPortionId.isAcceptableOrUnknown(
              data['hymnPortionId']!, _hymnPortionIdMeta));
    }
    if (data.containsKey('created')) {
      context.handle(_createdMeta,
          created.isAcceptableOrUnknown(data['created']!, _createdMeta));
    } else if (isInserting) {
      context.missing(_createdMeta);
    }
    if (data.containsKey('updated')) {
      context.handle(_updatedMeta,
          updated.isAcceptableOrUnknown(data['updated']!, _updatedMeta));
    } else if (isInserting) {
      context.missing(_updatedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {name, lyrics, hymnPortionId},
      ];
  @override
  Portion map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Portion(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      lyrics: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}lyrics'])!,
      hymnPortionId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}hymnPortionId']),
      created: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created'])!,
      updated: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated'])!,
    );
  }

  @override
  Portions createAlias(String alias) {
    return Portions(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints =>
      const ['UNIQUE(name, lyrics, hymnPortionId)'];
  @override
  bool get dontWriteConstraints => true;
}

class Portion extends DataClass implements Insertable<Portion> {
  String id;
  String name;
  String lyrics;
  String? hymnPortionId;
  DateTime created;
  DateTime updated;
  Portion(
      {required this.id,
      required this.name,
      required this.lyrics,
      this.hymnPortionId,
      required this.created,
      required this.updated});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['lyrics'] = Variable<String>(lyrics);
    if (!nullToAbsent || hymnPortionId != null) {
      map['hymnPortionId'] = Variable<String>(hymnPortionId);
    }
    map['created'] = Variable<DateTime>(created);
    map['updated'] = Variable<DateTime>(updated);
    return map;
  }

  PortionsCompanion toCompanion(bool nullToAbsent) {
    return PortionsCompanion(
      id: Value(id),
      name: Value(name),
      lyrics: Value(lyrics),
      hymnPortionId: hymnPortionId == null && nullToAbsent
          ? const Value.absent()
          : Value(hymnPortionId),
      created: Value(created),
      updated: Value(updated),
    );
  }

  factory Portion.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Portion(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      lyrics: serializer.fromJson<String>(json['lyrics']),
      hymnPortionId: serializer.fromJson<String?>(json['hymnPortionId']),
      created: serializer.fromJson<DateTime>(json['created']),
      updated: serializer.fromJson<DateTime>(json['updated']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'lyrics': serializer.toJson<String>(lyrics),
      'hymnPortionId': serializer.toJson<String?>(hymnPortionId),
      'created': serializer.toJson<DateTime>(created),
      'updated': serializer.toJson<DateTime>(updated),
    };
  }

  Portion copyWith(
          {String? id,
          String? name,
          String? lyrics,
          Value<String?> hymnPortionId = const Value.absent(),
          DateTime? created,
          DateTime? updated}) =>
      Portion(
        id: id ?? this.id,
        name: name ?? this.name,
        lyrics: lyrics ?? this.lyrics,
        hymnPortionId:
            hymnPortionId.present ? hymnPortionId.value : this.hymnPortionId,
        created: created ?? this.created,
        updated: updated ?? this.updated,
      );
  @override
  String toString() {
    return (StringBuffer('Portion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('lyrics: $lyrics, ')
          ..write('hymnPortionId: $hymnPortionId, ')
          ..write('created: $created, ')
          ..write('updated: $updated')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, lyrics, hymnPortionId, created, updated);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Portion &&
          other.id == this.id &&
          other.name == this.name &&
          other.lyrics == this.lyrics &&
          other.hymnPortionId == this.hymnPortionId &&
          other.created == this.created &&
          other.updated == this.updated);
}

class PortionsCompanion extends UpdateCompanion<Portion> {
  Value<String> id;
  Value<String> name;
  Value<String> lyrics;
  Value<String?> hymnPortionId;
  Value<DateTime> created;
  Value<DateTime> updated;
  Value<int> rowid;
  PortionsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.lyrics = const Value.absent(),
    this.hymnPortionId = const Value.absent(),
    this.created = const Value.absent(),
    this.updated = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PortionsCompanion.insert({
    required String id,
    required String name,
    required String lyrics,
    this.hymnPortionId = const Value.absent(),
    required DateTime created,
    required DateTime updated,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        lyrics = Value(lyrics),
        created = Value(created),
        updated = Value(updated);
  static Insertable<Portion> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? lyrics,
    Expression<String>? hymnPortionId,
    Expression<DateTime>? created,
    Expression<DateTime>? updated,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (lyrics != null) 'lyrics': lyrics,
      if (hymnPortionId != null) 'hymnPortionId': hymnPortionId,
      if (created != null) 'created': created,
      if (updated != null) 'updated': updated,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PortionsCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String>? lyrics,
      Value<String?>? hymnPortionId,
      Value<DateTime>? created,
      Value<DateTime>? updated,
      Value<int>? rowid}) {
    return PortionsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      lyrics: lyrics ?? this.lyrics,
      hymnPortionId: hymnPortionId ?? this.hymnPortionId,
      created: created ?? this.created,
      updated: updated ?? this.updated,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (lyrics.present) {
      map['lyrics'] = Variable<String>(lyrics.value);
    }
    if (hymnPortionId.present) {
      map['hymnPortionId'] = Variable<String>(hymnPortionId.value);
    }
    if (created.present) {
      map['created'] = Variable<DateTime>(created.value);
    }
    if (updated.present) {
      map['updated'] = Variable<DateTime>(updated.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PortionsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('lyrics: $lyrics, ')
          ..write('hymnPortionId: $hymnPortionId, ')
          ..write('created: $created, ')
          ..write('updated: $updated, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class PortionsFts extends Table
    with
        TableInfo<PortionsFts, PortionsFt>,
        VirtualTableInfo<PortionsFts, PortionsFt> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  PortionsFts(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: '');
  static const VerificationMeta _lyricsMeta = const VerificationMeta('lyrics');
  late final GeneratedColumn<String> lyrics = GeneratedColumn<String>(
      'lyrics', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: '');
  @override
  List<GeneratedColumn> get $columns => [name, lyrics];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'portions_fts';
  @override
  VerificationContext validateIntegrity(Insertable<PortionsFt> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('lyrics')) {
      context.handle(_lyricsMeta,
          lyrics.isAcceptableOrUnknown(data['lyrics']!, _lyricsMeta));
    } else if (isInserting) {
      context.missing(_lyricsMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  PortionsFt map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PortionsFt(
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      lyrics: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}lyrics'])!,
    );
  }

  @override
  PortionsFts createAlias(String alias) {
    return PortionsFts(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
  @override
  String get moduleAndArgs =>
      'fts5(name, lyrics, content=portions, content_rowid=id)';
}

class PortionsFt extends DataClass implements Insertable<PortionsFt> {
  String name;
  String lyrics;
  PortionsFt({required this.name, required this.lyrics});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['name'] = Variable<String>(name);
    map['lyrics'] = Variable<String>(lyrics);
    return map;
  }

  PortionsFtsCompanion toCompanion(bool nullToAbsent) {
    return PortionsFtsCompanion(
      name: Value(name),
      lyrics: Value(lyrics),
    );
  }

  factory PortionsFt.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PortionsFt(
      name: serializer.fromJson<String>(json['name']),
      lyrics: serializer.fromJson<String>(json['lyrics']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'name': serializer.toJson<String>(name),
      'lyrics': serializer.toJson<String>(lyrics),
    };
  }

  PortionsFt copyWith({String? name, String? lyrics}) => PortionsFt(
        name: name ?? this.name,
        lyrics: lyrics ?? this.lyrics,
      );
  @override
  String toString() {
    return (StringBuffer('PortionsFt(')
          ..write('name: $name, ')
          ..write('lyrics: $lyrics')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(name, lyrics);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PortionsFt &&
          other.name == this.name &&
          other.lyrics == this.lyrics);
}

class PortionsFtsCompanion extends UpdateCompanion<PortionsFt> {
  Value<String> name;
  Value<String> lyrics;
  Value<int> rowid;
  PortionsFtsCompanion({
    this.name = const Value.absent(),
    this.lyrics = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PortionsFtsCompanion.insert({
    required String name,
    required String lyrics,
    this.rowid = const Value.absent(),
  })  : name = Value(name),
        lyrics = Value(lyrics);
  static Insertable<PortionsFt> custom({
    Expression<String>? name,
    Expression<String>? lyrics,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (name != null) 'name': name,
      if (lyrics != null) 'lyrics': lyrics,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PortionsFtsCompanion copyWith(
      {Value<String>? name, Value<String>? lyrics, Value<int>? rowid}) {
    return PortionsFtsCompanion(
      name: name ?? this.name,
      lyrics: lyrics ?? this.lyrics,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (lyrics.present) {
      map['lyrics'] = Variable<String>(lyrics.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PortionsFtsCompanion(')
          ..write('name: $name, ')
          ..write('lyrics: $lyrics, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class HymnHymnals extends Table with TableInfo<HymnHymnals, HymnHymnal> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  HymnHymnals(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'PRIMARY KEY AUTOINCREMENT');
  static const VerificationMeta _hymnalIdMeta =
      const VerificationMeta('hymnalId');
  late final GeneratedColumn<String> hymnalId = GeneratedColumn<String>(
      'hymnalId', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _hymnIdMeta = const VerificationMeta('hymnId');
  late final GeneratedColumn<String> hymnId = GeneratedColumn<String>(
      'hymnId', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _createdMeta =
      const VerificationMeta('created');
  late final GeneratedColumn<DateTime> created = GeneratedColumn<DateTime>(
      'created', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _updatedMeta =
      const VerificationMeta('updated');
  late final GeneratedColumn<DateTime> updated = GeneratedColumn<DateTime>(
      'updated', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns =>
      [id, hymnalId, hymnId, created, updated];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'hymn_hymnals';
  @override
  VerificationContext validateIntegrity(Insertable<HymnHymnal> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('hymnalId')) {
      context.handle(_hymnalIdMeta,
          hymnalId.isAcceptableOrUnknown(data['hymnalId']!, _hymnalIdMeta));
    } else if (isInserting) {
      context.missing(_hymnalIdMeta);
    }
    if (data.containsKey('hymnId')) {
      context.handle(_hymnIdMeta,
          hymnId.isAcceptableOrUnknown(data['hymnId']!, _hymnIdMeta));
    } else if (isInserting) {
      context.missing(_hymnIdMeta);
    }
    if (data.containsKey('created')) {
      context.handle(_createdMeta,
          created.isAcceptableOrUnknown(data['created']!, _createdMeta));
    } else if (isInserting) {
      context.missing(_createdMeta);
    }
    if (data.containsKey('updated')) {
      context.handle(_updatedMeta,
          updated.isAcceptableOrUnknown(data['updated']!, _updatedMeta));
    } else if (isInserting) {
      context.missing(_updatedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {hymnalId, hymnId},
      ];
  @override
  HymnHymnal map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HymnHymnal(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      hymnalId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}hymnalId'])!,
      hymnId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}hymnId'])!,
      created: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created'])!,
      updated: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated'])!,
    );
  }

  @override
  HymnHymnals createAlias(String alias) {
    return HymnHymnals(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const ['UNIQUE(hymnalId, hymnId)'];
  @override
  bool get dontWriteConstraints => true;
}

class HymnHymnal extends DataClass implements Insertable<HymnHymnal> {
  int id;
  String hymnalId;
  String hymnId;
  DateTime created;
  DateTime updated;
  HymnHymnal(
      {required this.id,
      required this.hymnalId,
      required this.hymnId,
      required this.created,
      required this.updated});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['hymnalId'] = Variable<String>(hymnalId);
    map['hymnId'] = Variable<String>(hymnId);
    map['created'] = Variable<DateTime>(created);
    map['updated'] = Variable<DateTime>(updated);
    return map;
  }

  HymnHymnalsCompanion toCompanion(bool nullToAbsent) {
    return HymnHymnalsCompanion(
      id: Value(id),
      hymnalId: Value(hymnalId),
      hymnId: Value(hymnId),
      created: Value(created),
      updated: Value(updated),
    );
  }

  factory HymnHymnal.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HymnHymnal(
      id: serializer.fromJson<int>(json['id']),
      hymnalId: serializer.fromJson<String>(json['hymnalId']),
      hymnId: serializer.fromJson<String>(json['hymnId']),
      created: serializer.fromJson<DateTime>(json['created']),
      updated: serializer.fromJson<DateTime>(json['updated']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'hymnalId': serializer.toJson<String>(hymnalId),
      'hymnId': serializer.toJson<String>(hymnId),
      'created': serializer.toJson<DateTime>(created),
      'updated': serializer.toJson<DateTime>(updated),
    };
  }

  HymnHymnal copyWith(
          {int? id,
          String? hymnalId,
          String? hymnId,
          DateTime? created,
          DateTime? updated}) =>
      HymnHymnal(
        id: id ?? this.id,
        hymnalId: hymnalId ?? this.hymnalId,
        hymnId: hymnId ?? this.hymnId,
        created: created ?? this.created,
        updated: updated ?? this.updated,
      );
  @override
  String toString() {
    return (StringBuffer('HymnHymnal(')
          ..write('id: $id, ')
          ..write('hymnalId: $hymnalId, ')
          ..write('hymnId: $hymnId, ')
          ..write('created: $created, ')
          ..write('updated: $updated')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, hymnalId, hymnId, created, updated);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HymnHymnal &&
          other.id == this.id &&
          other.hymnalId == this.hymnalId &&
          other.hymnId == this.hymnId &&
          other.created == this.created &&
          other.updated == this.updated);
}

class HymnHymnalsCompanion extends UpdateCompanion<HymnHymnal> {
  Value<int> id;
  Value<String> hymnalId;
  Value<String> hymnId;
  Value<DateTime> created;
  Value<DateTime> updated;
  HymnHymnalsCompanion({
    this.id = const Value.absent(),
    this.hymnalId = const Value.absent(),
    this.hymnId = const Value.absent(),
    this.created = const Value.absent(),
    this.updated = const Value.absent(),
  });
  HymnHymnalsCompanion.insert({
    this.id = const Value.absent(),
    required String hymnalId,
    required String hymnId,
    required DateTime created,
    required DateTime updated,
  })  : hymnalId = Value(hymnalId),
        hymnId = Value(hymnId),
        created = Value(created),
        updated = Value(updated);
  static Insertable<HymnHymnal> custom({
    Expression<int>? id,
    Expression<String>? hymnalId,
    Expression<String>? hymnId,
    Expression<DateTime>? created,
    Expression<DateTime>? updated,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (hymnalId != null) 'hymnalId': hymnalId,
      if (hymnId != null) 'hymnId': hymnId,
      if (created != null) 'created': created,
      if (updated != null) 'updated': updated,
    });
  }

  HymnHymnalsCompanion copyWith(
      {Value<int>? id,
      Value<String>? hymnalId,
      Value<String>? hymnId,
      Value<DateTime>? created,
      Value<DateTime>? updated}) {
    return HymnHymnalsCompanion(
      id: id ?? this.id,
      hymnalId: hymnalId ?? this.hymnalId,
      hymnId: hymnId ?? this.hymnId,
      created: created ?? this.created,
      updated: updated ?? this.updated,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (hymnalId.present) {
      map['hymnalId'] = Variable<String>(hymnalId.value);
    }
    if (hymnId.present) {
      map['hymnId'] = Variable<String>(hymnId.value);
    }
    if (created.present) {
      map['created'] = Variable<DateTime>(created.value);
    }
    if (updated.present) {
      map['updated'] = Variable<DateTime>(updated.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HymnHymnalsCompanion(')
          ..write('id: $id, ')
          ..write('hymnalId: $hymnalId, ')
          ..write('hymnId: $hymnId, ')
          ..write('created: $created, ')
          ..write('updated: $updated')
          ..write(')'))
        .toString();
  }
}

class Hymnals extends Table with TableInfo<Hymnals, Hymnal> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Hymnals(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'PRIMARY KEY NOT NULL');
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _aliasMeta = const VerificationMeta('alias');
  late final GeneratedColumn<String> alias = GeneratedColumn<String>(
      'alias', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _createdMeta =
      const VerificationMeta('created');
  late final GeneratedColumn<DateTime> created = GeneratedColumn<DateTime>(
      'created', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _updatedMeta =
      const VerificationMeta('updated');
  late final GeneratedColumn<DateTime> updated = GeneratedColumn<DateTime>(
      'updated', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns => [id, name, alias, created, updated];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'hymnals';
  @override
  VerificationContext validateIntegrity(Insertable<Hymnal> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('alias')) {
      context.handle(
          _aliasMeta, alias.isAcceptableOrUnknown(data['alias']!, _aliasMeta));
    } else if (isInserting) {
      context.missing(_aliasMeta);
    }
    if (data.containsKey('created')) {
      context.handle(_createdMeta,
          created.isAcceptableOrUnknown(data['created']!, _createdMeta));
    } else if (isInserting) {
      context.missing(_createdMeta);
    }
    if (data.containsKey('updated')) {
      context.handle(_updatedMeta,
          updated.isAcceptableOrUnknown(data['updated']!, _updatedMeta));
    } else if (isInserting) {
      context.missing(_updatedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {name, alias},
      ];
  @override
  Hymnal map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Hymnal(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      alias: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}alias'])!,
      created: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created'])!,
      updated: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated'])!,
    );
  }

  @override
  Hymnals createAlias(String alias) {
    return Hymnals(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const ['UNIQUE(name, alias)'];
  @override
  bool get dontWriteConstraints => true;
}

class Hymnal extends DataClass implements Insertable<Hymnal> {
  String id;
  String name;
  String alias;
  DateTime created;
  DateTime updated;
  Hymnal(
      {required this.id,
      required this.name,
      required this.alias,
      required this.created,
      required this.updated});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['alias'] = Variable<String>(alias);
    map['created'] = Variable<DateTime>(created);
    map['updated'] = Variable<DateTime>(updated);
    return map;
  }

  HymnalsCompanion toCompanion(bool nullToAbsent) {
    return HymnalsCompanion(
      id: Value(id),
      name: Value(name),
      alias: Value(alias),
      created: Value(created),
      updated: Value(updated),
    );
  }

  factory Hymnal.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Hymnal(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      alias: serializer.fromJson<String>(json['alias']),
      created: serializer.fromJson<DateTime>(json['created']),
      updated: serializer.fromJson<DateTime>(json['updated']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'alias': serializer.toJson<String>(alias),
      'created': serializer.toJson<DateTime>(created),
      'updated': serializer.toJson<DateTime>(updated),
    };
  }

  Hymnal copyWith(
          {String? id,
          String? name,
          String? alias,
          DateTime? created,
          DateTime? updated}) =>
      Hymnal(
        id: id ?? this.id,
        name: name ?? this.name,
        alias: alias ?? this.alias,
        created: created ?? this.created,
        updated: updated ?? this.updated,
      );
  @override
  String toString() {
    return (StringBuffer('Hymnal(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('alias: $alias, ')
          ..write('created: $created, ')
          ..write('updated: $updated')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, alias, created, updated);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Hymnal &&
          other.id == this.id &&
          other.name == this.name &&
          other.alias == this.alias &&
          other.created == this.created &&
          other.updated == this.updated);
}

class HymnalsCompanion extends UpdateCompanion<Hymnal> {
  Value<String> id;
  Value<String> name;
  Value<String> alias;
  Value<DateTime> created;
  Value<DateTime> updated;
  Value<int> rowid;
  HymnalsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.alias = const Value.absent(),
    this.created = const Value.absent(),
    this.updated = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  HymnalsCompanion.insert({
    required String id,
    required String name,
    required String alias,
    required DateTime created,
    required DateTime updated,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        alias = Value(alias),
        created = Value(created),
        updated = Value(updated);
  static Insertable<Hymnal> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? alias,
    Expression<DateTime>? created,
    Expression<DateTime>? updated,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (alias != null) 'alias': alias,
      if (created != null) 'created': created,
      if (updated != null) 'updated': updated,
      if (rowid != null) 'rowid': rowid,
    });
  }

  HymnalsCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String>? alias,
      Value<DateTime>? created,
      Value<DateTime>? updated,
      Value<int>? rowid}) {
    return HymnalsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      alias: alias ?? this.alias,
      created: created ?? this.created,
      updated: updated ?? this.updated,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (alias.present) {
      map['alias'] = Variable<String>(alias.value);
    }
    if (created.present) {
      map['created'] = Variable<DateTime>(created.value);
    }
    if (updated.present) {
      map['updated'] = Variable<DateTime>(updated.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HymnalsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('alias: $alias, ')
          ..write('created: $created, ')
          ..write('updated: $updated, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class HymnalsFts extends Table
    with
        TableInfo<HymnalsFts, HymnalsFt>,
        VirtualTableInfo<HymnalsFts, HymnalsFt> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  HymnalsFts(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: '');
  static const VerificationMeta _aliasMeta = const VerificationMeta('alias');
  late final GeneratedColumn<String> alias = GeneratedColumn<String>(
      'alias', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: '');
  @override
  List<GeneratedColumn> get $columns => [name, alias];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'hymnals_fts';
  @override
  VerificationContext validateIntegrity(Insertable<HymnalsFt> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('alias')) {
      context.handle(
          _aliasMeta, alias.isAcceptableOrUnknown(data['alias']!, _aliasMeta));
    } else if (isInserting) {
      context.missing(_aliasMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  HymnalsFt map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HymnalsFt(
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      alias: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}alias'])!,
    );
  }

  @override
  HymnalsFts createAlias(String alias) {
    return HymnalsFts(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
  @override
  String get moduleAndArgs =>
      'fts5(name, alias, content=hymnals, content_rowid=id)';
}

class HymnalsFt extends DataClass implements Insertable<HymnalsFt> {
  String name;
  String alias;
  HymnalsFt({required this.name, required this.alias});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['name'] = Variable<String>(name);
    map['alias'] = Variable<String>(alias);
    return map;
  }

  HymnalsFtsCompanion toCompanion(bool nullToAbsent) {
    return HymnalsFtsCompanion(
      name: Value(name),
      alias: Value(alias),
    );
  }

  factory HymnalsFt.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HymnalsFt(
      name: serializer.fromJson<String>(json['name']),
      alias: serializer.fromJson<String>(json['alias']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'name': serializer.toJson<String>(name),
      'alias': serializer.toJson<String>(alias),
    };
  }

  HymnalsFt copyWith({String? name, String? alias}) => HymnalsFt(
        name: name ?? this.name,
        alias: alias ?? this.alias,
      );
  @override
  String toString() {
    return (StringBuffer('HymnalsFt(')
          ..write('name: $name, ')
          ..write('alias: $alias')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(name, alias);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HymnalsFt &&
          other.name == this.name &&
          other.alias == this.alias);
}

class HymnalsFtsCompanion extends UpdateCompanion<HymnalsFt> {
  Value<String> name;
  Value<String> alias;
  Value<int> rowid;
  HymnalsFtsCompanion({
    this.name = const Value.absent(),
    this.alias = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  HymnalsFtsCompanion.insert({
    required String name,
    required String alias,
    this.rowid = const Value.absent(),
  })  : name = Value(name),
        alias = Value(alias);
  static Insertable<HymnalsFt> custom({
    Expression<String>? name,
    Expression<String>? alias,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (name != null) 'name': name,
      if (alias != null) 'alias': alias,
      if (rowid != null) 'rowid': rowid,
    });
  }

  HymnalsFtsCompanion copyWith(
      {Value<String>? name, Value<String>? alias, Value<int>? rowid}) {
    return HymnalsFtsCompanion(
      name: name ?? this.name,
      alias: alias ?? this.alias,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (alias.present) {
      map['alias'] = Variable<String>(alias.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HymnalsFtsCompanion(')
          ..write('name: $name, ')
          ..write('alias: $alias, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class HymnScriptures extends Table
    with TableInfo<HymnScriptures, HymnScripture> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  HymnScriptures(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'PRIMARY KEY AUTOINCREMENT');
  static const VerificationMeta _scriptureIdMeta =
      const VerificationMeta('scriptureId');
  late final GeneratedColumn<String> scriptureId = GeneratedColumn<String>(
      'scriptureId', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _hymnIdMeta = const VerificationMeta('hymnId');
  late final GeneratedColumn<String> hymnId = GeneratedColumn<String>(
      'hymnId', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _createdMeta =
      const VerificationMeta('created');
  late final GeneratedColumn<DateTime> created = GeneratedColumn<DateTime>(
      'created', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _updatedMeta =
      const VerificationMeta('updated');
  late final GeneratedColumn<DateTime> updated = GeneratedColumn<DateTime>(
      'updated', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns =>
      [id, scriptureId, hymnId, created, updated];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'hymn_scriptures';
  @override
  VerificationContext validateIntegrity(Insertable<HymnScripture> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('scriptureId')) {
      context.handle(
          _scriptureIdMeta,
          scriptureId.isAcceptableOrUnknown(
              data['scriptureId']!, _scriptureIdMeta));
    } else if (isInserting) {
      context.missing(_scriptureIdMeta);
    }
    if (data.containsKey('hymnId')) {
      context.handle(_hymnIdMeta,
          hymnId.isAcceptableOrUnknown(data['hymnId']!, _hymnIdMeta));
    } else if (isInserting) {
      context.missing(_hymnIdMeta);
    }
    if (data.containsKey('created')) {
      context.handle(_createdMeta,
          created.isAcceptableOrUnknown(data['created']!, _createdMeta));
    } else if (isInserting) {
      context.missing(_createdMeta);
    }
    if (data.containsKey('updated')) {
      context.handle(_updatedMeta,
          updated.isAcceptableOrUnknown(data['updated']!, _updatedMeta));
    } else if (isInserting) {
      context.missing(_updatedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {scriptureId, hymnId},
      ];
  @override
  HymnScripture map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HymnScripture(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      scriptureId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}scriptureId'])!,
      hymnId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}hymnId'])!,
      created: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created'])!,
      updated: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated'])!,
    );
  }

  @override
  HymnScriptures createAlias(String alias) {
    return HymnScriptures(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const ['UNIQUE(scriptureId, hymnId)'];
  @override
  bool get dontWriteConstraints => true;
}

class HymnScripture extends DataClass implements Insertable<HymnScripture> {
  int id;
  String scriptureId;
  String hymnId;
  DateTime created;
  DateTime updated;
  HymnScripture(
      {required this.id,
      required this.scriptureId,
      required this.hymnId,
      required this.created,
      required this.updated});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['scriptureId'] = Variable<String>(scriptureId);
    map['hymnId'] = Variable<String>(hymnId);
    map['created'] = Variable<DateTime>(created);
    map['updated'] = Variable<DateTime>(updated);
    return map;
  }

  HymnScripturesCompanion toCompanion(bool nullToAbsent) {
    return HymnScripturesCompanion(
      id: Value(id),
      scriptureId: Value(scriptureId),
      hymnId: Value(hymnId),
      created: Value(created),
      updated: Value(updated),
    );
  }

  factory HymnScripture.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HymnScripture(
      id: serializer.fromJson<int>(json['id']),
      scriptureId: serializer.fromJson<String>(json['scriptureId']),
      hymnId: serializer.fromJson<String>(json['hymnId']),
      created: serializer.fromJson<DateTime>(json['created']),
      updated: serializer.fromJson<DateTime>(json['updated']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'scriptureId': serializer.toJson<String>(scriptureId),
      'hymnId': serializer.toJson<String>(hymnId),
      'created': serializer.toJson<DateTime>(created),
      'updated': serializer.toJson<DateTime>(updated),
    };
  }

  HymnScripture copyWith(
          {int? id,
          String? scriptureId,
          String? hymnId,
          DateTime? created,
          DateTime? updated}) =>
      HymnScripture(
        id: id ?? this.id,
        scriptureId: scriptureId ?? this.scriptureId,
        hymnId: hymnId ?? this.hymnId,
        created: created ?? this.created,
        updated: updated ?? this.updated,
      );
  @override
  String toString() {
    return (StringBuffer('HymnScripture(')
          ..write('id: $id, ')
          ..write('scriptureId: $scriptureId, ')
          ..write('hymnId: $hymnId, ')
          ..write('created: $created, ')
          ..write('updated: $updated')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, scriptureId, hymnId, created, updated);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HymnScripture &&
          other.id == this.id &&
          other.scriptureId == this.scriptureId &&
          other.hymnId == this.hymnId &&
          other.created == this.created &&
          other.updated == this.updated);
}

class HymnScripturesCompanion extends UpdateCompanion<HymnScripture> {
  Value<int> id;
  Value<String> scriptureId;
  Value<String> hymnId;
  Value<DateTime> created;
  Value<DateTime> updated;
  HymnScripturesCompanion({
    this.id = const Value.absent(),
    this.scriptureId = const Value.absent(),
    this.hymnId = const Value.absent(),
    this.created = const Value.absent(),
    this.updated = const Value.absent(),
  });
  HymnScripturesCompanion.insert({
    this.id = const Value.absent(),
    required String scriptureId,
    required String hymnId,
    required DateTime created,
    required DateTime updated,
  })  : scriptureId = Value(scriptureId),
        hymnId = Value(hymnId),
        created = Value(created),
        updated = Value(updated);
  static Insertable<HymnScripture> custom({
    Expression<int>? id,
    Expression<String>? scriptureId,
    Expression<String>? hymnId,
    Expression<DateTime>? created,
    Expression<DateTime>? updated,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (scriptureId != null) 'scriptureId': scriptureId,
      if (hymnId != null) 'hymnId': hymnId,
      if (created != null) 'created': created,
      if (updated != null) 'updated': updated,
    });
  }

  HymnScripturesCompanion copyWith(
      {Value<int>? id,
      Value<String>? scriptureId,
      Value<String>? hymnId,
      Value<DateTime>? created,
      Value<DateTime>? updated}) {
    return HymnScripturesCompanion(
      id: id ?? this.id,
      scriptureId: scriptureId ?? this.scriptureId,
      hymnId: hymnId ?? this.hymnId,
      created: created ?? this.created,
      updated: updated ?? this.updated,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (scriptureId.present) {
      map['scriptureId'] = Variable<String>(scriptureId.value);
    }
    if (hymnId.present) {
      map['hymnId'] = Variable<String>(hymnId.value);
    }
    if (created.present) {
      map['created'] = Variable<DateTime>(created.value);
    }
    if (updated.present) {
      map['updated'] = Variable<DateTime>(updated.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HymnScripturesCompanion(')
          ..write('id: $id, ')
          ..write('scriptureId: $scriptureId, ')
          ..write('hymnId: $hymnId, ')
          ..write('created: $created, ')
          ..write('updated: $updated')
          ..write(')'))
        .toString();
  }
}

class Scriptures extends Table with TableInfo<Scriptures, Scripture> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Scriptures(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'PRIMARY KEY NOT NULL');
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _createdMeta =
      const VerificationMeta('created');
  late final GeneratedColumn<DateTime> created = GeneratedColumn<DateTime>(
      'created', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _updatedMeta =
      const VerificationMeta('updated');
  late final GeneratedColumn<DateTime> updated = GeneratedColumn<DateTime>(
      'updated', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns => [id, name, created, updated];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'scriptures';
  @override
  VerificationContext validateIntegrity(Insertable<Scripture> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('created')) {
      context.handle(_createdMeta,
          created.isAcceptableOrUnknown(data['created']!, _createdMeta));
    } else if (isInserting) {
      context.missing(_createdMeta);
    }
    if (data.containsKey('updated')) {
      context.handle(_updatedMeta,
          updated.isAcceptableOrUnknown(data['updated']!, _updatedMeta));
    } else if (isInserting) {
      context.missing(_updatedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {name},
      ];
  @override
  Scripture map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Scripture(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      created: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created'])!,
      updated: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated'])!,
    );
  }

  @override
  Scriptures createAlias(String alias) {
    return Scriptures(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const ['UNIQUE(name)'];
  @override
  bool get dontWriteConstraints => true;
}

class Scripture extends DataClass implements Insertable<Scripture> {
  String id;
  String name;
  DateTime created;
  DateTime updated;
  Scripture(
      {required this.id,
      required this.name,
      required this.created,
      required this.updated});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['created'] = Variable<DateTime>(created);
    map['updated'] = Variable<DateTime>(updated);
    return map;
  }

  ScripturesCompanion toCompanion(bool nullToAbsent) {
    return ScripturesCompanion(
      id: Value(id),
      name: Value(name),
      created: Value(created),
      updated: Value(updated),
    );
  }

  factory Scripture.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Scripture(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      created: serializer.fromJson<DateTime>(json['created']),
      updated: serializer.fromJson<DateTime>(json['updated']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'created': serializer.toJson<DateTime>(created),
      'updated': serializer.toJson<DateTime>(updated),
    };
  }

  Scripture copyWith(
          {String? id, String? name, DateTime? created, DateTime? updated}) =>
      Scripture(
        id: id ?? this.id,
        name: name ?? this.name,
        created: created ?? this.created,
        updated: updated ?? this.updated,
      );
  @override
  String toString() {
    return (StringBuffer('Scripture(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('created: $created, ')
          ..write('updated: $updated')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, created, updated);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Scripture &&
          other.id == this.id &&
          other.name == this.name &&
          other.created == this.created &&
          other.updated == this.updated);
}

class ScripturesCompanion extends UpdateCompanion<Scripture> {
  Value<String> id;
  Value<String> name;
  Value<DateTime> created;
  Value<DateTime> updated;
  Value<int> rowid;
  ScripturesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.created = const Value.absent(),
    this.updated = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ScripturesCompanion.insert({
    required String id,
    required String name,
    required DateTime created,
    required DateTime updated,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        created = Value(created),
        updated = Value(updated);
  static Insertable<Scripture> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<DateTime>? created,
    Expression<DateTime>? updated,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (created != null) 'created': created,
      if (updated != null) 'updated': updated,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ScripturesCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<DateTime>? created,
      Value<DateTime>? updated,
      Value<int>? rowid}) {
    return ScripturesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      created: created ?? this.created,
      updated: updated ?? this.updated,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (created.present) {
      map['created'] = Variable<DateTime>(created.value);
    }
    if (updated.present) {
      map['updated'] = Variable<DateTime>(updated.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ScripturesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('created: $created, ')
          ..write('updated: $updated, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class ScripturesFts extends Table
    with
        TableInfo<ScripturesFts, ScripturesFt>,
        VirtualTableInfo<ScripturesFts, ScripturesFt> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  ScripturesFts(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: '');
  @override
  List<GeneratedColumn> get $columns => [name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'scriptures_fts';
  @override
  VerificationContext validateIntegrity(Insertable<ScripturesFt> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  ScripturesFt map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ScripturesFt(
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  ScripturesFts createAlias(String alias) {
    return ScripturesFts(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
  @override
  String get moduleAndArgs =>
      'fts5(name, content=scriptures, content_rowid=id)';
}

class ScripturesFt extends DataClass implements Insertable<ScripturesFt> {
  String name;
  ScripturesFt({required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['name'] = Variable<String>(name);
    return map;
  }

  ScripturesFtsCompanion toCompanion(bool nullToAbsent) {
    return ScripturesFtsCompanion(
      name: Value(name),
    );
  }

  factory ScripturesFt.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ScripturesFt(
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'name': serializer.toJson<String>(name),
    };
  }

  ScripturesFt copyWith({String? name}) => ScripturesFt(
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('ScripturesFt(')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => name.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ScripturesFt && other.name == this.name);
}

class ScripturesFtsCompanion extends UpdateCompanion<ScripturesFt> {
  Value<String> name;
  Value<int> rowid;
  ScripturesFtsCompanion({
    this.name = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ScripturesFtsCompanion.insert({
    required String name,
    this.rowid = const Value.absent(),
  }) : name = Value(name);
  static Insertable<ScripturesFt> custom({
    Expression<String>? name,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (name != null) 'name': name,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ScripturesFtsCompanion copyWith({Value<String>? name, Value<int>? rowid}) {
    return ScripturesFtsCompanion(
      name: name ?? this.name,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ScripturesFtsCompanion(')
          ..write('name: $name, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class HymnStakeholders extends Table
    with TableInfo<HymnStakeholders, HymnStakeholder> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  HymnStakeholders(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'PRIMARY KEY AUTOINCREMENT');
  static const VerificationMeta _stakeholderIdMeta =
      const VerificationMeta('stakeholderId');
  late final GeneratedColumn<String> stakeholderId = GeneratedColumn<String>(
      'stakeholderId', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _hymnIdMeta = const VerificationMeta('hymnId');
  late final GeneratedColumn<String> hymnId = GeneratedColumn<String>(
      'hymnId', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _relationshipMeta =
      const VerificationMeta('relationship');
  late final GeneratedColumn<String> relationship = GeneratedColumn<String>(
      'relationship', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _createdMeta =
      const VerificationMeta('created');
  late final GeneratedColumn<DateTime> created = GeneratedColumn<DateTime>(
      'created', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _updatedMeta =
      const VerificationMeta('updated');
  late final GeneratedColumn<DateTime> updated = GeneratedColumn<DateTime>(
      'updated', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns =>
      [id, stakeholderId, hymnId, relationship, created, updated];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'hymn_stakeholders';
  @override
  VerificationContext validateIntegrity(Insertable<HymnStakeholder> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('stakeholderId')) {
      context.handle(
          _stakeholderIdMeta,
          stakeholderId.isAcceptableOrUnknown(
              data['stakeholderId']!, _stakeholderIdMeta));
    } else if (isInserting) {
      context.missing(_stakeholderIdMeta);
    }
    if (data.containsKey('hymnId')) {
      context.handle(_hymnIdMeta,
          hymnId.isAcceptableOrUnknown(data['hymnId']!, _hymnIdMeta));
    } else if (isInserting) {
      context.missing(_hymnIdMeta);
    }
    if (data.containsKey('relationship')) {
      context.handle(
          _relationshipMeta,
          relationship.isAcceptableOrUnknown(
              data['relationship']!, _relationshipMeta));
    } else if (isInserting) {
      context.missing(_relationshipMeta);
    }
    if (data.containsKey('created')) {
      context.handle(_createdMeta,
          created.isAcceptableOrUnknown(data['created']!, _createdMeta));
    } else if (isInserting) {
      context.missing(_createdMeta);
    }
    if (data.containsKey('updated')) {
      context.handle(_updatedMeta,
          updated.isAcceptableOrUnknown(data['updated']!, _updatedMeta));
    } else if (isInserting) {
      context.missing(_updatedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {stakeholderId, hymnId, relationship},
      ];
  @override
  HymnStakeholder map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HymnStakeholder(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      stakeholderId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}stakeholderId'])!,
      hymnId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}hymnId'])!,
      relationship: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}relationship'])!,
      created: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created'])!,
      updated: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated'])!,
    );
  }

  @override
  HymnStakeholders createAlias(String alias) {
    return HymnStakeholders(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints =>
      const ['UNIQUE(stakeholderId, hymnId, relationship)'];
  @override
  bool get dontWriteConstraints => true;
}

class HymnStakeholder extends DataClass implements Insertable<HymnStakeholder> {
  int id;
  String stakeholderId;
  String hymnId;
  String relationship;
  DateTime created;
  DateTime updated;
  HymnStakeholder(
      {required this.id,
      required this.stakeholderId,
      required this.hymnId,
      required this.relationship,
      required this.created,
      required this.updated});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['stakeholderId'] = Variable<String>(stakeholderId);
    map['hymnId'] = Variable<String>(hymnId);
    map['relationship'] = Variable<String>(relationship);
    map['created'] = Variable<DateTime>(created);
    map['updated'] = Variable<DateTime>(updated);
    return map;
  }

  HymnStakeholdersCompanion toCompanion(bool nullToAbsent) {
    return HymnStakeholdersCompanion(
      id: Value(id),
      stakeholderId: Value(stakeholderId),
      hymnId: Value(hymnId),
      relationship: Value(relationship),
      created: Value(created),
      updated: Value(updated),
    );
  }

  factory HymnStakeholder.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HymnStakeholder(
      id: serializer.fromJson<int>(json['id']),
      stakeholderId: serializer.fromJson<String>(json['stakeholderId']),
      hymnId: serializer.fromJson<String>(json['hymnId']),
      relationship: serializer.fromJson<String>(json['relationship']),
      created: serializer.fromJson<DateTime>(json['created']),
      updated: serializer.fromJson<DateTime>(json['updated']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'stakeholderId': serializer.toJson<String>(stakeholderId),
      'hymnId': serializer.toJson<String>(hymnId),
      'relationship': serializer.toJson<String>(relationship),
      'created': serializer.toJson<DateTime>(created),
      'updated': serializer.toJson<DateTime>(updated),
    };
  }

  HymnStakeholder copyWith(
          {int? id,
          String? stakeholderId,
          String? hymnId,
          String? relationship,
          DateTime? created,
          DateTime? updated}) =>
      HymnStakeholder(
        id: id ?? this.id,
        stakeholderId: stakeholderId ?? this.stakeholderId,
        hymnId: hymnId ?? this.hymnId,
        relationship: relationship ?? this.relationship,
        created: created ?? this.created,
        updated: updated ?? this.updated,
      );
  @override
  String toString() {
    return (StringBuffer('HymnStakeholder(')
          ..write('id: $id, ')
          ..write('stakeholderId: $stakeholderId, ')
          ..write('hymnId: $hymnId, ')
          ..write('relationship: $relationship, ')
          ..write('created: $created, ')
          ..write('updated: $updated')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, stakeholderId, hymnId, relationship, created, updated);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HymnStakeholder &&
          other.id == this.id &&
          other.stakeholderId == this.stakeholderId &&
          other.hymnId == this.hymnId &&
          other.relationship == this.relationship &&
          other.created == this.created &&
          other.updated == this.updated);
}

class HymnStakeholdersCompanion extends UpdateCompanion<HymnStakeholder> {
  Value<int> id;
  Value<String> stakeholderId;
  Value<String> hymnId;
  Value<String> relationship;
  Value<DateTime> created;
  Value<DateTime> updated;
  HymnStakeholdersCompanion({
    this.id = const Value.absent(),
    this.stakeholderId = const Value.absent(),
    this.hymnId = const Value.absent(),
    this.relationship = const Value.absent(),
    this.created = const Value.absent(),
    this.updated = const Value.absent(),
  });
  HymnStakeholdersCompanion.insert({
    this.id = const Value.absent(),
    required String stakeholderId,
    required String hymnId,
    required String relationship,
    required DateTime created,
    required DateTime updated,
  })  : stakeholderId = Value(stakeholderId),
        hymnId = Value(hymnId),
        relationship = Value(relationship),
        created = Value(created),
        updated = Value(updated);
  static Insertable<HymnStakeholder> custom({
    Expression<int>? id,
    Expression<String>? stakeholderId,
    Expression<String>? hymnId,
    Expression<String>? relationship,
    Expression<DateTime>? created,
    Expression<DateTime>? updated,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (stakeholderId != null) 'stakeholderId': stakeholderId,
      if (hymnId != null) 'hymnId': hymnId,
      if (relationship != null) 'relationship': relationship,
      if (created != null) 'created': created,
      if (updated != null) 'updated': updated,
    });
  }

  HymnStakeholdersCompanion copyWith(
      {Value<int>? id,
      Value<String>? stakeholderId,
      Value<String>? hymnId,
      Value<String>? relationship,
      Value<DateTime>? created,
      Value<DateTime>? updated}) {
    return HymnStakeholdersCompanion(
      id: id ?? this.id,
      stakeholderId: stakeholderId ?? this.stakeholderId,
      hymnId: hymnId ?? this.hymnId,
      relationship: relationship ?? this.relationship,
      created: created ?? this.created,
      updated: updated ?? this.updated,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (stakeholderId.present) {
      map['stakeholderId'] = Variable<String>(stakeholderId.value);
    }
    if (hymnId.present) {
      map['hymnId'] = Variable<String>(hymnId.value);
    }
    if (relationship.present) {
      map['relationship'] = Variable<String>(relationship.value);
    }
    if (created.present) {
      map['created'] = Variable<DateTime>(created.value);
    }
    if (updated.present) {
      map['updated'] = Variable<DateTime>(updated.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HymnStakeholdersCompanion(')
          ..write('id: $id, ')
          ..write('stakeholderId: $stakeholderId, ')
          ..write('hymnId: $hymnId, ')
          ..write('relationship: $relationship, ')
          ..write('created: $created, ')
          ..write('updated: $updated')
          ..write(')'))
        .toString();
  }
}

class Stakeholders extends Table with TableInfo<Stakeholders, Stakeholder> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Stakeholders(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'PRIMARY KEY NOT NULL');
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _createdMeta =
      const VerificationMeta('created');
  late final GeneratedColumn<DateTime> created = GeneratedColumn<DateTime>(
      'created', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _updatedMeta =
      const VerificationMeta('updated');
  late final GeneratedColumn<DateTime> updated = GeneratedColumn<DateTime>(
      'updated', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns => [id, name, created, updated];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'stakeholders';
  @override
  VerificationContext validateIntegrity(Insertable<Stakeholder> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('created')) {
      context.handle(_createdMeta,
          created.isAcceptableOrUnknown(data['created']!, _createdMeta));
    } else if (isInserting) {
      context.missing(_createdMeta);
    }
    if (data.containsKey('updated')) {
      context.handle(_updatedMeta,
          updated.isAcceptableOrUnknown(data['updated']!, _updatedMeta));
    } else if (isInserting) {
      context.missing(_updatedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {name},
      ];
  @override
  Stakeholder map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Stakeholder(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      created: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created'])!,
      updated: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated'])!,
    );
  }

  @override
  Stakeholders createAlias(String alias) {
    return Stakeholders(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const ['UNIQUE(name)'];
  @override
  bool get dontWriteConstraints => true;
}

class Stakeholder extends DataClass implements Insertable<Stakeholder> {
  String id;
  String name;
  DateTime created;
  DateTime updated;
  Stakeholder(
      {required this.id,
      required this.name,
      required this.created,
      required this.updated});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['created'] = Variable<DateTime>(created);
    map['updated'] = Variable<DateTime>(updated);
    return map;
  }

  StakeholdersCompanion toCompanion(bool nullToAbsent) {
    return StakeholdersCompanion(
      id: Value(id),
      name: Value(name),
      created: Value(created),
      updated: Value(updated),
    );
  }

  factory Stakeholder.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Stakeholder(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      created: serializer.fromJson<DateTime>(json['created']),
      updated: serializer.fromJson<DateTime>(json['updated']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'created': serializer.toJson<DateTime>(created),
      'updated': serializer.toJson<DateTime>(updated),
    };
  }

  Stakeholder copyWith(
          {String? id, String? name, DateTime? created, DateTime? updated}) =>
      Stakeholder(
        id: id ?? this.id,
        name: name ?? this.name,
        created: created ?? this.created,
        updated: updated ?? this.updated,
      );
  @override
  String toString() {
    return (StringBuffer('Stakeholder(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('created: $created, ')
          ..write('updated: $updated')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, created, updated);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Stakeholder &&
          other.id == this.id &&
          other.name == this.name &&
          other.created == this.created &&
          other.updated == this.updated);
}

class StakeholdersCompanion extends UpdateCompanion<Stakeholder> {
  Value<String> id;
  Value<String> name;
  Value<DateTime> created;
  Value<DateTime> updated;
  Value<int> rowid;
  StakeholdersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.created = const Value.absent(),
    this.updated = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  StakeholdersCompanion.insert({
    required String id,
    required String name,
    required DateTime created,
    required DateTime updated,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        created = Value(created),
        updated = Value(updated);
  static Insertable<Stakeholder> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<DateTime>? created,
    Expression<DateTime>? updated,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (created != null) 'created': created,
      if (updated != null) 'updated': updated,
      if (rowid != null) 'rowid': rowid,
    });
  }

  StakeholdersCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<DateTime>? created,
      Value<DateTime>? updated,
      Value<int>? rowid}) {
    return StakeholdersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      created: created ?? this.created,
      updated: updated ?? this.updated,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (created.present) {
      map['created'] = Variable<DateTime>(created.value);
    }
    if (updated.present) {
      map['updated'] = Variable<DateTime>(updated.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StakeholdersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('created: $created, ')
          ..write('updated: $updated, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class StakeholdersFts extends Table
    with
        TableInfo<StakeholdersFts, StakeholdersFt>,
        VirtualTableInfo<StakeholdersFts, StakeholdersFt> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  StakeholdersFts(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: '');
  @override
  List<GeneratedColumn> get $columns => [name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'stakeholders_fts';
  @override
  VerificationContext validateIntegrity(Insertable<StakeholdersFt> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  StakeholdersFt map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StakeholdersFt(
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  StakeholdersFts createAlias(String alias) {
    return StakeholdersFts(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
  @override
  String get moduleAndArgs =>
      'fts5(name, content=stakeholders, content_rowid=id)';
}

class StakeholdersFt extends DataClass implements Insertable<StakeholdersFt> {
  String name;
  StakeholdersFt({required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['name'] = Variable<String>(name);
    return map;
  }

  StakeholdersFtsCompanion toCompanion(bool nullToAbsent) {
    return StakeholdersFtsCompanion(
      name: Value(name),
    );
  }

  factory StakeholdersFt.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StakeholdersFt(
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'name': serializer.toJson<String>(name),
    };
  }

  StakeholdersFt copyWith({String? name}) => StakeholdersFt(
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('StakeholdersFt(')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => name.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StakeholdersFt && other.name == this.name);
}

class StakeholdersFtsCompanion extends UpdateCompanion<StakeholdersFt> {
  Value<String> name;
  Value<int> rowid;
  StakeholdersFtsCompanion({
    this.name = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  StakeholdersFtsCompanion.insert({
    required String name,
    this.rowid = const Value.absent(),
  }) : name = Value(name);
  static Insertable<StakeholdersFt> custom({
    Expression<String>? name,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (name != null) 'name': name,
      if (rowid != null) 'rowid': rowid,
    });
  }

  StakeholdersFtsCompanion copyWith({Value<String>? name, Value<int>? rowid}) {
    return StakeholdersFtsCompanion(
      name: name ?? this.name,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StakeholdersFtsCompanion(')
          ..write('name: $name, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class HymnTopics extends Table with TableInfo<HymnTopics, HymnTopic> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  HymnTopics(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'PRIMARY KEY AUTOINCREMENT');
  static const VerificationMeta _topicIdMeta =
      const VerificationMeta('topicId');
  late final GeneratedColumn<String> topicId = GeneratedColumn<String>(
      'topicId', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _hymnIdMeta = const VerificationMeta('hymnId');
  late final GeneratedColumn<String> hymnId = GeneratedColumn<String>(
      'hymnId', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _createdMeta =
      const VerificationMeta('created');
  late final GeneratedColumn<DateTime> created = GeneratedColumn<DateTime>(
      'created', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _updatedMeta =
      const VerificationMeta('updated');
  late final GeneratedColumn<DateTime> updated = GeneratedColumn<DateTime>(
      'updated', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns => [id, topicId, hymnId, created, updated];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'hymn_topics';
  @override
  VerificationContext validateIntegrity(Insertable<HymnTopic> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('topicId')) {
      context.handle(_topicIdMeta,
          topicId.isAcceptableOrUnknown(data['topicId']!, _topicIdMeta));
    } else if (isInserting) {
      context.missing(_topicIdMeta);
    }
    if (data.containsKey('hymnId')) {
      context.handle(_hymnIdMeta,
          hymnId.isAcceptableOrUnknown(data['hymnId']!, _hymnIdMeta));
    } else if (isInserting) {
      context.missing(_hymnIdMeta);
    }
    if (data.containsKey('created')) {
      context.handle(_createdMeta,
          created.isAcceptableOrUnknown(data['created']!, _createdMeta));
    } else if (isInserting) {
      context.missing(_createdMeta);
    }
    if (data.containsKey('updated')) {
      context.handle(_updatedMeta,
          updated.isAcceptableOrUnknown(data['updated']!, _updatedMeta));
    } else if (isInserting) {
      context.missing(_updatedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {topicId, hymnId},
      ];
  @override
  HymnTopic map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HymnTopic(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      topicId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}topicId'])!,
      hymnId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}hymnId'])!,
      created: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created'])!,
      updated: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated'])!,
    );
  }

  @override
  HymnTopics createAlias(String alias) {
    return HymnTopics(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const ['UNIQUE(topicId, hymnId)'];
  @override
  bool get dontWriteConstraints => true;
}

class HymnTopic extends DataClass implements Insertable<HymnTopic> {
  int id;
  String topicId;
  String hymnId;
  DateTime created;
  DateTime updated;
  HymnTopic(
      {required this.id,
      required this.topicId,
      required this.hymnId,
      required this.created,
      required this.updated});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['topicId'] = Variable<String>(topicId);
    map['hymnId'] = Variable<String>(hymnId);
    map['created'] = Variable<DateTime>(created);
    map['updated'] = Variable<DateTime>(updated);
    return map;
  }

  HymnTopicsCompanion toCompanion(bool nullToAbsent) {
    return HymnTopicsCompanion(
      id: Value(id),
      topicId: Value(topicId),
      hymnId: Value(hymnId),
      created: Value(created),
      updated: Value(updated),
    );
  }

  factory HymnTopic.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HymnTopic(
      id: serializer.fromJson<int>(json['id']),
      topicId: serializer.fromJson<String>(json['topicId']),
      hymnId: serializer.fromJson<String>(json['hymnId']),
      created: serializer.fromJson<DateTime>(json['created']),
      updated: serializer.fromJson<DateTime>(json['updated']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'topicId': serializer.toJson<String>(topicId),
      'hymnId': serializer.toJson<String>(hymnId),
      'created': serializer.toJson<DateTime>(created),
      'updated': serializer.toJson<DateTime>(updated),
    };
  }

  HymnTopic copyWith(
          {int? id,
          String? topicId,
          String? hymnId,
          DateTime? created,
          DateTime? updated}) =>
      HymnTopic(
        id: id ?? this.id,
        topicId: topicId ?? this.topicId,
        hymnId: hymnId ?? this.hymnId,
        created: created ?? this.created,
        updated: updated ?? this.updated,
      );
  @override
  String toString() {
    return (StringBuffer('HymnTopic(')
          ..write('id: $id, ')
          ..write('topicId: $topicId, ')
          ..write('hymnId: $hymnId, ')
          ..write('created: $created, ')
          ..write('updated: $updated')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, topicId, hymnId, created, updated);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HymnTopic &&
          other.id == this.id &&
          other.topicId == this.topicId &&
          other.hymnId == this.hymnId &&
          other.created == this.created &&
          other.updated == this.updated);
}

class HymnTopicsCompanion extends UpdateCompanion<HymnTopic> {
  Value<int> id;
  Value<String> topicId;
  Value<String> hymnId;
  Value<DateTime> created;
  Value<DateTime> updated;
  HymnTopicsCompanion({
    this.id = const Value.absent(),
    this.topicId = const Value.absent(),
    this.hymnId = const Value.absent(),
    this.created = const Value.absent(),
    this.updated = const Value.absent(),
  });
  HymnTopicsCompanion.insert({
    this.id = const Value.absent(),
    required String topicId,
    required String hymnId,
    required DateTime created,
    required DateTime updated,
  })  : topicId = Value(topicId),
        hymnId = Value(hymnId),
        created = Value(created),
        updated = Value(updated);
  static Insertable<HymnTopic> custom({
    Expression<int>? id,
    Expression<String>? topicId,
    Expression<String>? hymnId,
    Expression<DateTime>? created,
    Expression<DateTime>? updated,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (topicId != null) 'topicId': topicId,
      if (hymnId != null) 'hymnId': hymnId,
      if (created != null) 'created': created,
      if (updated != null) 'updated': updated,
    });
  }

  HymnTopicsCompanion copyWith(
      {Value<int>? id,
      Value<String>? topicId,
      Value<String>? hymnId,
      Value<DateTime>? created,
      Value<DateTime>? updated}) {
    return HymnTopicsCompanion(
      id: id ?? this.id,
      topicId: topicId ?? this.topicId,
      hymnId: hymnId ?? this.hymnId,
      created: created ?? this.created,
      updated: updated ?? this.updated,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (topicId.present) {
      map['topicId'] = Variable<String>(topicId.value);
    }
    if (hymnId.present) {
      map['hymnId'] = Variable<String>(hymnId.value);
    }
    if (created.present) {
      map['created'] = Variable<DateTime>(created.value);
    }
    if (updated.present) {
      map['updated'] = Variable<DateTime>(updated.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HymnTopicsCompanion(')
          ..write('id: $id, ')
          ..write('topicId: $topicId, ')
          ..write('hymnId: $hymnId, ')
          ..write('created: $created, ')
          ..write('updated: $updated')
          ..write(')'))
        .toString();
  }
}

class Topics extends Table with TableInfo<Topics, Topic> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Topics(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'PRIMARY KEY NOT NULL');
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _createdMeta =
      const VerificationMeta('created');
  late final GeneratedColumn<DateTime> created = GeneratedColumn<DateTime>(
      'created', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _updatedMeta =
      const VerificationMeta('updated');
  late final GeneratedColumn<DateTime> updated = GeneratedColumn<DateTime>(
      'updated', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns => [id, name, created, updated];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'topics';
  @override
  VerificationContext validateIntegrity(Insertable<Topic> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('created')) {
      context.handle(_createdMeta,
          created.isAcceptableOrUnknown(data['created']!, _createdMeta));
    } else if (isInserting) {
      context.missing(_createdMeta);
    }
    if (data.containsKey('updated')) {
      context.handle(_updatedMeta,
          updated.isAcceptableOrUnknown(data['updated']!, _updatedMeta));
    } else if (isInserting) {
      context.missing(_updatedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {name},
      ];
  @override
  Topic map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Topic(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      created: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created'])!,
      updated: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated'])!,
    );
  }

  @override
  Topics createAlias(String alias) {
    return Topics(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const ['UNIQUE(name)'];
  @override
  bool get dontWriteConstraints => true;
}

class Topic extends DataClass implements Insertable<Topic> {
  String id;
  String name;
  DateTime created;
  DateTime updated;
  Topic(
      {required this.id,
      required this.name,
      required this.created,
      required this.updated});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['created'] = Variable<DateTime>(created);
    map['updated'] = Variable<DateTime>(updated);
    return map;
  }

  TopicsCompanion toCompanion(bool nullToAbsent) {
    return TopicsCompanion(
      id: Value(id),
      name: Value(name),
      created: Value(created),
      updated: Value(updated),
    );
  }

  factory Topic.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Topic(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      created: serializer.fromJson<DateTime>(json['created']),
      updated: serializer.fromJson<DateTime>(json['updated']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'created': serializer.toJson<DateTime>(created),
      'updated': serializer.toJson<DateTime>(updated),
    };
  }

  Topic copyWith(
          {String? id, String? name, DateTime? created, DateTime? updated}) =>
      Topic(
        id: id ?? this.id,
        name: name ?? this.name,
        created: created ?? this.created,
        updated: updated ?? this.updated,
      );
  @override
  String toString() {
    return (StringBuffer('Topic(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('created: $created, ')
          ..write('updated: $updated')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, created, updated);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Topic &&
          other.id == this.id &&
          other.name == this.name &&
          other.created == this.created &&
          other.updated == this.updated);
}

class TopicsCompanion extends UpdateCompanion<Topic> {
  Value<String> id;
  Value<String> name;
  Value<DateTime> created;
  Value<DateTime> updated;
  Value<int> rowid;
  TopicsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.created = const Value.absent(),
    this.updated = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TopicsCompanion.insert({
    required String id,
    required String name,
    required DateTime created,
    required DateTime updated,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        created = Value(created),
        updated = Value(updated);
  static Insertable<Topic> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<DateTime>? created,
    Expression<DateTime>? updated,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (created != null) 'created': created,
      if (updated != null) 'updated': updated,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TopicsCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<DateTime>? created,
      Value<DateTime>? updated,
      Value<int>? rowid}) {
    return TopicsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      created: created ?? this.created,
      updated: updated ?? this.updated,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (created.present) {
      map['created'] = Variable<DateTime>(created.value);
    }
    if (updated.present) {
      map['updated'] = Variable<DateTime>(updated.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TopicsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('created: $created, ')
          ..write('updated: $updated, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class TopicsFts extends Table
    with TableInfo<TopicsFts, TopicsFt>, VirtualTableInfo<TopicsFts, TopicsFt> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  TopicsFts(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: '');
  @override
  List<GeneratedColumn> get $columns => [name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'topics_fts';
  @override
  VerificationContext validateIntegrity(Insertable<TopicsFt> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  TopicsFt map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TopicsFt(
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  TopicsFts createAlias(String alias) {
    return TopicsFts(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
  @override
  String get moduleAndArgs => 'fts5(name, content=topics, content_rowid=id)';
}

class TopicsFt extends DataClass implements Insertable<TopicsFt> {
  String name;
  TopicsFt({required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['name'] = Variable<String>(name);
    return map;
  }

  TopicsFtsCompanion toCompanion(bool nullToAbsent) {
    return TopicsFtsCompanion(
      name: Value(name),
    );
  }

  factory TopicsFt.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TopicsFt(
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'name': serializer.toJson<String>(name),
    };
  }

  TopicsFt copyWith({String? name}) => TopicsFt(
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('TopicsFt(')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => name.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is TopicsFt && other.name == this.name);
}

class TopicsFtsCompanion extends UpdateCompanion<TopicsFt> {
  Value<String> name;
  Value<int> rowid;
  TopicsFtsCompanion({
    this.name = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TopicsFtsCompanion.insert({
    required String name,
    this.rowid = const Value.absent(),
  }) : name = Value(name);
  static Insertable<TopicsFt> custom({
    Expression<String>? name,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (name != null) 'name': name,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TopicsFtsCompanion copyWith({Value<String>? name, Value<int>? rowid}) {
    return TopicsFtsCompanion(
      name: name ?? this.name,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TopicsFtsCompanion(')
          ..write('name: $name, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class HymnsFts extends Table
    with TableInfo<HymnsFts, HymnsFt>, VirtualTableInfo<HymnsFts, HymnsFt> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  HymnsFts(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: '');
  static const VerificationMeta _numberMeta = const VerificationMeta('number');
  late final GeneratedColumn<String> number = GeneratedColumn<String>(
      'number', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: '');
  static const VerificationMeta _tuneNameMeta =
      const VerificationMeta('tuneName');
  late final GeneratedColumn<String> tuneName = GeneratedColumn<String>(
      'tuneName', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: '');
  static const VerificationMeta _startingKeyMeta =
      const VerificationMeta('startingKey');
  late final GeneratedColumn<String> startingKey = GeneratedColumn<String>(
      'startingKey', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: '');
  static const VerificationMeta _beatPatternMeta =
      const VerificationMeta('beatPattern');
  late final GeneratedColumn<String> beatPattern = GeneratedColumn<String>(
      'beatPattern', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: '');
  static const VerificationMeta _startingPitchMeta =
      const VerificationMeta('startingPitch');
  late final GeneratedColumn<String> startingPitch = GeneratedColumn<String>(
      'startingPitch', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: '');
  static const VerificationMeta _startingBeatMeta =
      const VerificationMeta('startingBeat');
  late final GeneratedColumn<String> startingBeat = GeneratedColumn<String>(
      'startingBeat', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: '');
  static const VerificationMeta _startingPitchDirectionMeta =
      const VerificationMeta('startingPitchDirection');
  late final GeneratedColumn<String> startingPitchDirection =
      GeneratedColumn<String>('startingPitchDirection', aliasedName, false,
          type: DriftSqlType.string,
          requiredDuringInsert: true,
          $customConstraints: '');
  static const VerificationMeta _timeSignatureMeta =
      const VerificationMeta('timeSignature');
  late final GeneratedColumn<String> timeSignature = GeneratedColumn<String>(
      'timeSignature', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: '');
  static const VerificationMeta _complexTimeSignatureMeta =
      const VerificationMeta('complexTimeSignature');
  late final GeneratedColumn<String> complexTimeSignature =
      GeneratedColumn<String>('complexTimeSignature', aliasedName, false,
          type: DriftSqlType.string,
          requiredDuringInsert: true,
          $customConstraints: '');
  @override
  List<GeneratedColumn> get $columns => [
        title,
        number,
        tuneName,
        startingKey,
        beatPattern,
        startingPitch,
        startingBeat,
        startingPitchDirection,
        timeSignature,
        complexTimeSignature
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'hymns_fts';
  @override
  VerificationContext validateIntegrity(Insertable<HymnsFt> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('number')) {
      context.handle(_numberMeta,
          number.isAcceptableOrUnknown(data['number']!, _numberMeta));
    } else if (isInserting) {
      context.missing(_numberMeta);
    }
    if (data.containsKey('tuneName')) {
      context.handle(_tuneNameMeta,
          tuneName.isAcceptableOrUnknown(data['tuneName']!, _tuneNameMeta));
    } else if (isInserting) {
      context.missing(_tuneNameMeta);
    }
    if (data.containsKey('startingKey')) {
      context.handle(
          _startingKeyMeta,
          startingKey.isAcceptableOrUnknown(
              data['startingKey']!, _startingKeyMeta));
    } else if (isInserting) {
      context.missing(_startingKeyMeta);
    }
    if (data.containsKey('beatPattern')) {
      context.handle(
          _beatPatternMeta,
          beatPattern.isAcceptableOrUnknown(
              data['beatPattern']!, _beatPatternMeta));
    } else if (isInserting) {
      context.missing(_beatPatternMeta);
    }
    if (data.containsKey('startingPitch')) {
      context.handle(
          _startingPitchMeta,
          startingPitch.isAcceptableOrUnknown(
              data['startingPitch']!, _startingPitchMeta));
    } else if (isInserting) {
      context.missing(_startingPitchMeta);
    }
    if (data.containsKey('startingBeat')) {
      context.handle(
          _startingBeatMeta,
          startingBeat.isAcceptableOrUnknown(
              data['startingBeat']!, _startingBeatMeta));
    } else if (isInserting) {
      context.missing(_startingBeatMeta);
    }
    if (data.containsKey('startingPitchDirection')) {
      context.handle(
          _startingPitchDirectionMeta,
          startingPitchDirection.isAcceptableOrUnknown(
              data['startingPitchDirection']!, _startingPitchDirectionMeta));
    } else if (isInserting) {
      context.missing(_startingPitchDirectionMeta);
    }
    if (data.containsKey('timeSignature')) {
      context.handle(
          _timeSignatureMeta,
          timeSignature.isAcceptableOrUnknown(
              data['timeSignature']!, _timeSignatureMeta));
    } else if (isInserting) {
      context.missing(_timeSignatureMeta);
    }
    if (data.containsKey('complexTimeSignature')) {
      context.handle(
          _complexTimeSignatureMeta,
          complexTimeSignature.isAcceptableOrUnknown(
              data['complexTimeSignature']!, _complexTimeSignatureMeta));
    } else if (isInserting) {
      context.missing(_complexTimeSignatureMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  HymnsFt map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HymnsFt(
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      number: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}number'])!,
      tuneName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tuneName'])!,
      startingKey: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}startingKey'])!,
      beatPattern: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}beatPattern'])!,
      startingPitch: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}startingPitch'])!,
      startingBeat: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}startingBeat'])!,
      startingPitchDirection: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}startingPitchDirection'])!,
      timeSignature: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}timeSignature'])!,
      complexTimeSignature: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}complexTimeSignature'])!,
    );
  }

  @override
  HymnsFts createAlias(String alias) {
    return HymnsFts(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
  @override
  String get moduleAndArgs =>
      'fts5(title, number, tuneName, startingKey, beatPattern, startingPitch, startingBeat, startingPitchDirection, timeSignature, complexTimeSignature, content=hymns, content_rowid=id)';
}

class HymnsFt extends DataClass implements Insertable<HymnsFt> {
  String title;
  String number;
  String tuneName;
  String startingKey;
  String beatPattern;
  String startingPitch;
  String startingBeat;
  String startingPitchDirection;
  String timeSignature;
  String complexTimeSignature;
  HymnsFt(
      {required this.title,
      required this.number,
      required this.tuneName,
      required this.startingKey,
      required this.beatPattern,
      required this.startingPitch,
      required this.startingBeat,
      required this.startingPitchDirection,
      required this.timeSignature,
      required this.complexTimeSignature});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['title'] = Variable<String>(title);
    map['number'] = Variable<String>(number);
    map['tuneName'] = Variable<String>(tuneName);
    map['startingKey'] = Variable<String>(startingKey);
    map['beatPattern'] = Variable<String>(beatPattern);
    map['startingPitch'] = Variable<String>(startingPitch);
    map['startingBeat'] = Variable<String>(startingBeat);
    map['startingPitchDirection'] = Variable<String>(startingPitchDirection);
    map['timeSignature'] = Variable<String>(timeSignature);
    map['complexTimeSignature'] = Variable<String>(complexTimeSignature);
    return map;
  }

  HymnsFtsCompanion toCompanion(bool nullToAbsent) {
    return HymnsFtsCompanion(
      title: Value(title),
      number: Value(number),
      tuneName: Value(tuneName),
      startingKey: Value(startingKey),
      beatPattern: Value(beatPattern),
      startingPitch: Value(startingPitch),
      startingBeat: Value(startingBeat),
      startingPitchDirection: Value(startingPitchDirection),
      timeSignature: Value(timeSignature),
      complexTimeSignature: Value(complexTimeSignature),
    );
  }

  factory HymnsFt.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HymnsFt(
      title: serializer.fromJson<String>(json['title']),
      number: serializer.fromJson<String>(json['number']),
      tuneName: serializer.fromJson<String>(json['tuneName']),
      startingKey: serializer.fromJson<String>(json['startingKey']),
      beatPattern: serializer.fromJson<String>(json['beatPattern']),
      startingPitch: serializer.fromJson<String>(json['startingPitch']),
      startingBeat: serializer.fromJson<String>(json['startingBeat']),
      startingPitchDirection:
          serializer.fromJson<String>(json['startingPitchDirection']),
      timeSignature: serializer.fromJson<String>(json['timeSignature']),
      complexTimeSignature:
          serializer.fromJson<String>(json['complexTimeSignature']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'title': serializer.toJson<String>(title),
      'number': serializer.toJson<String>(number),
      'tuneName': serializer.toJson<String>(tuneName),
      'startingKey': serializer.toJson<String>(startingKey),
      'beatPattern': serializer.toJson<String>(beatPattern),
      'startingPitch': serializer.toJson<String>(startingPitch),
      'startingBeat': serializer.toJson<String>(startingBeat),
      'startingPitchDirection':
          serializer.toJson<String>(startingPitchDirection),
      'timeSignature': serializer.toJson<String>(timeSignature),
      'complexTimeSignature': serializer.toJson<String>(complexTimeSignature),
    };
  }

  HymnsFt copyWith(
          {String? title,
          String? number,
          String? tuneName,
          String? startingKey,
          String? beatPattern,
          String? startingPitch,
          String? startingBeat,
          String? startingPitchDirection,
          String? timeSignature,
          String? complexTimeSignature}) =>
      HymnsFt(
        title: title ?? this.title,
        number: number ?? this.number,
        tuneName: tuneName ?? this.tuneName,
        startingKey: startingKey ?? this.startingKey,
        beatPattern: beatPattern ?? this.beatPattern,
        startingPitch: startingPitch ?? this.startingPitch,
        startingBeat: startingBeat ?? this.startingBeat,
        startingPitchDirection:
            startingPitchDirection ?? this.startingPitchDirection,
        timeSignature: timeSignature ?? this.timeSignature,
        complexTimeSignature: complexTimeSignature ?? this.complexTimeSignature,
      );
  @override
  String toString() {
    return (StringBuffer('HymnsFt(')
          ..write('title: $title, ')
          ..write('number: $number, ')
          ..write('tuneName: $tuneName, ')
          ..write('startingKey: $startingKey, ')
          ..write('beatPattern: $beatPattern, ')
          ..write('startingPitch: $startingPitch, ')
          ..write('startingBeat: $startingBeat, ')
          ..write('startingPitchDirection: $startingPitchDirection, ')
          ..write('timeSignature: $timeSignature, ')
          ..write('complexTimeSignature: $complexTimeSignature')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      title,
      number,
      tuneName,
      startingKey,
      beatPattern,
      startingPitch,
      startingBeat,
      startingPitchDirection,
      timeSignature,
      complexTimeSignature);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HymnsFt &&
          other.title == this.title &&
          other.number == this.number &&
          other.tuneName == this.tuneName &&
          other.startingKey == this.startingKey &&
          other.beatPattern == this.beatPattern &&
          other.startingPitch == this.startingPitch &&
          other.startingBeat == this.startingBeat &&
          other.startingPitchDirection == this.startingPitchDirection &&
          other.timeSignature == this.timeSignature &&
          other.complexTimeSignature == this.complexTimeSignature);
}

class HymnsFtsCompanion extends UpdateCompanion<HymnsFt> {
  Value<String> title;
  Value<String> number;
  Value<String> tuneName;
  Value<String> startingKey;
  Value<String> beatPattern;
  Value<String> startingPitch;
  Value<String> startingBeat;
  Value<String> startingPitchDirection;
  Value<String> timeSignature;
  Value<String> complexTimeSignature;
  Value<int> rowid;
  HymnsFtsCompanion({
    this.title = const Value.absent(),
    this.number = const Value.absent(),
    this.tuneName = const Value.absent(),
    this.startingKey = const Value.absent(),
    this.beatPattern = const Value.absent(),
    this.startingPitch = const Value.absent(),
    this.startingBeat = const Value.absent(),
    this.startingPitchDirection = const Value.absent(),
    this.timeSignature = const Value.absent(),
    this.complexTimeSignature = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  HymnsFtsCompanion.insert({
    required String title,
    required String number,
    required String tuneName,
    required String startingKey,
    required String beatPattern,
    required String startingPitch,
    required String startingBeat,
    required String startingPitchDirection,
    required String timeSignature,
    required String complexTimeSignature,
    this.rowid = const Value.absent(),
  })  : title = Value(title),
        number = Value(number),
        tuneName = Value(tuneName),
        startingKey = Value(startingKey),
        beatPattern = Value(beatPattern),
        startingPitch = Value(startingPitch),
        startingBeat = Value(startingBeat),
        startingPitchDirection = Value(startingPitchDirection),
        timeSignature = Value(timeSignature),
        complexTimeSignature = Value(complexTimeSignature);
  static Insertable<HymnsFt> custom({
    Expression<String>? title,
    Expression<String>? number,
    Expression<String>? tuneName,
    Expression<String>? startingKey,
    Expression<String>? beatPattern,
    Expression<String>? startingPitch,
    Expression<String>? startingBeat,
    Expression<String>? startingPitchDirection,
    Expression<String>? timeSignature,
    Expression<String>? complexTimeSignature,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (title != null) 'title': title,
      if (number != null) 'number': number,
      if (tuneName != null) 'tuneName': tuneName,
      if (startingKey != null) 'startingKey': startingKey,
      if (beatPattern != null) 'beatPattern': beatPattern,
      if (startingPitch != null) 'startingPitch': startingPitch,
      if (startingBeat != null) 'startingBeat': startingBeat,
      if (startingPitchDirection != null)
        'startingPitchDirection': startingPitchDirection,
      if (timeSignature != null) 'timeSignature': timeSignature,
      if (complexTimeSignature != null)
        'complexTimeSignature': complexTimeSignature,
      if (rowid != null) 'rowid': rowid,
    });
  }

  HymnsFtsCompanion copyWith(
      {Value<String>? title,
      Value<String>? number,
      Value<String>? tuneName,
      Value<String>? startingKey,
      Value<String>? beatPattern,
      Value<String>? startingPitch,
      Value<String>? startingBeat,
      Value<String>? startingPitchDirection,
      Value<String>? timeSignature,
      Value<String>? complexTimeSignature,
      Value<int>? rowid}) {
    return HymnsFtsCompanion(
      title: title ?? this.title,
      number: number ?? this.number,
      tuneName: tuneName ?? this.tuneName,
      startingKey: startingKey ?? this.startingKey,
      beatPattern: beatPattern ?? this.beatPattern,
      startingPitch: startingPitch ?? this.startingPitch,
      startingBeat: startingBeat ?? this.startingBeat,
      startingPitchDirection:
          startingPitchDirection ?? this.startingPitchDirection,
      timeSignature: timeSignature ?? this.timeSignature,
      complexTimeSignature: complexTimeSignature ?? this.complexTimeSignature,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (number.present) {
      map['number'] = Variable<String>(number.value);
    }
    if (tuneName.present) {
      map['tuneName'] = Variable<String>(tuneName.value);
    }
    if (startingKey.present) {
      map['startingKey'] = Variable<String>(startingKey.value);
    }
    if (beatPattern.present) {
      map['beatPattern'] = Variable<String>(beatPattern.value);
    }
    if (startingPitch.present) {
      map['startingPitch'] = Variable<String>(startingPitch.value);
    }
    if (startingBeat.present) {
      map['startingBeat'] = Variable<String>(startingBeat.value);
    }
    if (startingPitchDirection.present) {
      map['startingPitchDirection'] =
          Variable<String>(startingPitchDirection.value);
    }
    if (timeSignature.present) {
      map['timeSignature'] = Variable<String>(timeSignature.value);
    }
    if (complexTimeSignature.present) {
      map['complexTimeSignature'] =
          Variable<String>(complexTimeSignature.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HymnsFtsCompanion(')
          ..write('title: $title, ')
          ..write('number: $number, ')
          ..write('tuneName: $tuneName, ')
          ..write('startingKey: $startingKey, ')
          ..write('beatPattern: $beatPattern, ')
          ..write('startingPitch: $startingPitch, ')
          ..write('startingBeat: $startingBeat, ')
          ..write('startingPitchDirection: $startingPitchDirection, ')
          ..write('timeSignature: $timeSignature, ')
          ..write('complexTimeSignature: $complexTimeSignature, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class Bundles extends Table with TableInfo<Bundles, Bundle> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Bundles(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'PRIMARY KEY AUTOINCREMENT');
  static const VerificationMeta _hymnIdMeta = const VerificationMeta('hymnId');
  late final GeneratedColumn<String> hymnId = GeneratedColumn<String>(
      'hymnId', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _hymnTitleMeta =
      const VerificationMeta('hymnTitle');
  late final GeneratedColumn<String> hymnTitle = GeneratedColumn<String>(
      'hymn_title', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _hymnNumberMeta =
      const VerificationMeta('hymnNumber');
  late final GeneratedColumn<String> hymnNumber = GeneratedColumn<String>(
      'hymn_number', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _hashMeta = const VerificationMeta('hash');
  late final GeneratedColumn<String> hash = GeneratedColumn<String>(
      'hash', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _fileMeta = const VerificationMeta('file');
  late final GeneratedColumn<String> file = GeneratedColumn<String>(
      'file', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _bytesMeta = const VerificationMeta('bytes');
  late final GeneratedColumn<Uint8List> bytes = GeneratedColumn<Uint8List>(
      'bytes', aliasedName, true,
      type: DriftSqlType.blob,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _createdMeta =
      const VerificationMeta('created');
  late final GeneratedColumn<DateTime> created = GeneratedColumn<DateTime>(
      'created', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _updatedMeta =
      const VerificationMeta('updated');
  late final GeneratedColumn<DateTime> updated = GeneratedColumn<DateTime>(
      'updated', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns =>
      [id, hymnId, hymnTitle, hymnNumber, hash, file, bytes, created, updated];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'bundles';
  @override
  VerificationContext validateIntegrity(Insertable<Bundle> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('hymnId')) {
      context.handle(_hymnIdMeta,
          hymnId.isAcceptableOrUnknown(data['hymnId']!, _hymnIdMeta));
    } else if (isInserting) {
      context.missing(_hymnIdMeta);
    }
    if (data.containsKey('hymn_title')) {
      context.handle(_hymnTitleMeta,
          hymnTitle.isAcceptableOrUnknown(data['hymn_title']!, _hymnTitleMeta));
    }
    if (data.containsKey('hymn_number')) {
      context.handle(
          _hymnNumberMeta,
          hymnNumber.isAcceptableOrUnknown(
              data['hymn_number']!, _hymnNumberMeta));
    }
    if (data.containsKey('hash')) {
      context.handle(
          _hashMeta, hash.isAcceptableOrUnknown(data['hash']!, _hashMeta));
    } else if (isInserting) {
      context.missing(_hashMeta);
    }
    if (data.containsKey('file')) {
      context.handle(
          _fileMeta, file.isAcceptableOrUnknown(data['file']!, _fileMeta));
    }
    if (data.containsKey('bytes')) {
      context.handle(
          _bytesMeta, bytes.isAcceptableOrUnknown(data['bytes']!, _bytesMeta));
    }
    if (data.containsKey('created')) {
      context.handle(_createdMeta,
          created.isAcceptableOrUnknown(data['created']!, _createdMeta));
    } else if (isInserting) {
      context.missing(_createdMeta);
    }
    if (data.containsKey('updated')) {
      context.handle(_updatedMeta,
          updated.isAcceptableOrUnknown(data['updated']!, _updatedMeta));
    } else if (isInserting) {
      context.missing(_updatedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {hymnId, hash},
      ];
  @override
  Bundle map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Bundle(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      hymnId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}hymnId'])!,
      hymnTitle: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}hymn_title']),
      hymnNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}hymn_number']),
      hash: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}hash'])!,
      file: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}file']),
      bytes: attachedDatabase.typeMapping
          .read(DriftSqlType.blob, data['${effectivePrefix}bytes']),
      created: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created'])!,
      updated: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated'])!,
    );
  }

  @override
  Bundles createAlias(String alias) {
    return Bundles(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const ['UNIQUE(hymnId, hash)'];
  @override
  bool get dontWriteConstraints => true;
}

class Bundle extends DataClass implements Insertable<Bundle> {
  int id;
  String hymnId;
  String? hymnTitle;
  String? hymnNumber;
  String hash;
  String? file;
  Uint8List? bytes;
  DateTime created;
  DateTime updated;
  Bundle(
      {required this.id,
      required this.hymnId,
      this.hymnTitle,
      this.hymnNumber,
      required this.hash,
      this.file,
      this.bytes,
      required this.created,
      required this.updated});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['hymnId'] = Variable<String>(hymnId);
    if (!nullToAbsent || hymnTitle != null) {
      map['hymn_title'] = Variable<String>(hymnTitle);
    }
    if (!nullToAbsent || hymnNumber != null) {
      map['hymn_number'] = Variable<String>(hymnNumber);
    }
    map['hash'] = Variable<String>(hash);
    if (!nullToAbsent || file != null) {
      map['file'] = Variable<String>(file);
    }
    if (!nullToAbsent || bytes != null) {
      map['bytes'] = Variable<Uint8List>(bytes);
    }
    map['created'] = Variable<DateTime>(created);
    map['updated'] = Variable<DateTime>(updated);
    return map;
  }

  BundlesCompanion toCompanion(bool nullToAbsent) {
    return BundlesCompanion(
      id: Value(id),
      hymnId: Value(hymnId),
      hymnTitle: hymnTitle == null && nullToAbsent
          ? const Value.absent()
          : Value(hymnTitle),
      hymnNumber: hymnNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(hymnNumber),
      hash: Value(hash),
      file: file == null && nullToAbsent ? const Value.absent() : Value(file),
      bytes:
          bytes == null && nullToAbsent ? const Value.absent() : Value(bytes),
      created: Value(created),
      updated: Value(updated),
    );
  }

  factory Bundle.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Bundle(
      id: serializer.fromJson<int>(json['id']),
      hymnId: serializer.fromJson<String>(json['hymnId']),
      hymnTitle: serializer.fromJson<String?>(json['hymn_title']),
      hymnNumber: serializer.fromJson<String?>(json['hymn_number']),
      hash: serializer.fromJson<String>(json['hash']),
      file: serializer.fromJson<String?>(json['file']),
      bytes: serializer.fromJson<Uint8List?>(json['bytes']),
      created: serializer.fromJson<DateTime>(json['created']),
      updated: serializer.fromJson<DateTime>(json['updated']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'hymnId': serializer.toJson<String>(hymnId),
      'hymn_title': serializer.toJson<String?>(hymnTitle),
      'hymn_number': serializer.toJson<String?>(hymnNumber),
      'hash': serializer.toJson<String>(hash),
      'file': serializer.toJson<String?>(file),
      'bytes': serializer.toJson<Uint8List?>(bytes),
      'created': serializer.toJson<DateTime>(created),
      'updated': serializer.toJson<DateTime>(updated),
    };
  }

  Bundle copyWith(
          {int? id,
          String? hymnId,
          Value<String?> hymnTitle = const Value.absent(),
          Value<String?> hymnNumber = const Value.absent(),
          String? hash,
          Value<String?> file = const Value.absent(),
          Value<Uint8List?> bytes = const Value.absent(),
          DateTime? created,
          DateTime? updated}) =>
      Bundle(
        id: id ?? this.id,
        hymnId: hymnId ?? this.hymnId,
        hymnTitle: hymnTitle.present ? hymnTitle.value : this.hymnTitle,
        hymnNumber: hymnNumber.present ? hymnNumber.value : this.hymnNumber,
        hash: hash ?? this.hash,
        file: file.present ? file.value : this.file,
        bytes: bytes.present ? bytes.value : this.bytes,
        created: created ?? this.created,
        updated: updated ?? this.updated,
      );
  @override
  String toString() {
    return (StringBuffer('Bundle(')
          ..write('id: $id, ')
          ..write('hymnId: $hymnId, ')
          ..write('hymnTitle: $hymnTitle, ')
          ..write('hymnNumber: $hymnNumber, ')
          ..write('hash: $hash, ')
          ..write('file: $file, ')
          ..write('bytes: $bytes, ')
          ..write('created: $created, ')
          ..write('updated: $updated')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, hymnId, hymnTitle, hymnNumber, hash, file,
      $driftBlobEquality.hash(bytes), created, updated);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Bundle &&
          other.id == this.id &&
          other.hymnId == this.hymnId &&
          other.hymnTitle == this.hymnTitle &&
          other.hymnNumber == this.hymnNumber &&
          other.hash == this.hash &&
          other.file == this.file &&
          $driftBlobEquality.equals(other.bytes, this.bytes) &&
          other.created == this.created &&
          other.updated == this.updated);
}

class BundlesCompanion extends UpdateCompanion<Bundle> {
  Value<int> id;
  Value<String> hymnId;
  Value<String?> hymnTitle;
  Value<String?> hymnNumber;
  Value<String> hash;
  Value<String?> file;
  Value<Uint8List?> bytes;
  Value<DateTime> created;
  Value<DateTime> updated;
  BundlesCompanion({
    this.id = const Value.absent(),
    this.hymnId = const Value.absent(),
    this.hymnTitle = const Value.absent(),
    this.hymnNumber = const Value.absent(),
    this.hash = const Value.absent(),
    this.file = const Value.absent(),
    this.bytes = const Value.absent(),
    this.created = const Value.absent(),
    this.updated = const Value.absent(),
  });
  BundlesCompanion.insert({
    this.id = const Value.absent(),
    required String hymnId,
    this.hymnTitle = const Value.absent(),
    this.hymnNumber = const Value.absent(),
    required String hash,
    this.file = const Value.absent(),
    this.bytes = const Value.absent(),
    required DateTime created,
    required DateTime updated,
  })  : hymnId = Value(hymnId),
        hash = Value(hash),
        created = Value(created),
        updated = Value(updated);
  static Insertable<Bundle> custom({
    Expression<int>? id,
    Expression<String>? hymnId,
    Expression<String>? hymnTitle,
    Expression<String>? hymnNumber,
    Expression<String>? hash,
    Expression<String>? file,
    Expression<Uint8List>? bytes,
    Expression<DateTime>? created,
    Expression<DateTime>? updated,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (hymnId != null) 'hymnId': hymnId,
      if (hymnTitle != null) 'hymn_title': hymnTitle,
      if (hymnNumber != null) 'hymn_number': hymnNumber,
      if (hash != null) 'hash': hash,
      if (file != null) 'file': file,
      if (bytes != null) 'bytes': bytes,
      if (created != null) 'created': created,
      if (updated != null) 'updated': updated,
    });
  }

  BundlesCompanion copyWith(
      {Value<int>? id,
      Value<String>? hymnId,
      Value<String?>? hymnTitle,
      Value<String?>? hymnNumber,
      Value<String>? hash,
      Value<String?>? file,
      Value<Uint8List?>? bytes,
      Value<DateTime>? created,
      Value<DateTime>? updated}) {
    return BundlesCompanion(
      id: id ?? this.id,
      hymnId: hymnId ?? this.hymnId,
      hymnTitle: hymnTitle ?? this.hymnTitle,
      hymnNumber: hymnNumber ?? this.hymnNumber,
      hash: hash ?? this.hash,
      file: file ?? this.file,
      bytes: bytes ?? this.bytes,
      created: created ?? this.created,
      updated: updated ?? this.updated,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (hymnId.present) {
      map['hymnId'] = Variable<String>(hymnId.value);
    }
    if (hymnTitle.present) {
      map['hymn_title'] = Variable<String>(hymnTitle.value);
    }
    if (hymnNumber.present) {
      map['hymn_number'] = Variable<String>(hymnNumber.value);
    }
    if (hash.present) {
      map['hash'] = Variable<String>(hash.value);
    }
    if (file.present) {
      map['file'] = Variable<String>(file.value);
    }
    if (bytes.present) {
      map['bytes'] = Variable<Uint8List>(bytes.value);
    }
    if (created.present) {
      map['created'] = Variable<DateTime>(created.value);
    }
    if (updated.present) {
      map['updated'] = Variable<DateTime>(updated.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BundlesCompanion(')
          ..write('id: $id, ')
          ..write('hymnId: $hymnId, ')
          ..write('hymnTitle: $hymnTitle, ')
          ..write('hymnNumber: $hymnNumber, ')
          ..write('hash: $hash, ')
          ..write('file: $file, ')
          ..write('bytes: $bytes, ')
          ..write('created: $created, ')
          ..write('updated: $updated')
          ..write(')'))
        .toString();
  }
}

class RecordsCache extends Table
    with TableInfo<RecordsCache, RecordsCacheData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  RecordsCache(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'PRIMARY KEY AUTOINCREMENT');
  static const VerificationMeta _collectionNameMeta =
      const VerificationMeta('collectionName');
  late final GeneratedColumn<String> collectionName = GeneratedColumn<String>(
      'collection_name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _syncedMeta = const VerificationMeta('synced');
  late final GeneratedColumn<bool> synced = GeneratedColumn<bool>(
      'synced', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT 0',
      defaultValue: const CustomExpression('0'));
  static const VerificationMeta _createdMeta =
      const VerificationMeta('created');
  late final GeneratedColumn<DateTime> created = GeneratedColumn<DateTime>(
      'created', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _updatedMeta =
      const VerificationMeta('updated');
  late final GeneratedColumn<DateTime> updated = GeneratedColumn<DateTime>(
      'updated', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns =>
      [id, collectionName, synced, created, updated];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'records_cache';
  @override
  VerificationContext validateIntegrity(Insertable<RecordsCacheData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('collection_name')) {
      context.handle(
          _collectionNameMeta,
          collectionName.isAcceptableOrUnknown(
              data['collection_name']!, _collectionNameMeta));
    } else if (isInserting) {
      context.missing(_collectionNameMeta);
    }
    if (data.containsKey('synced')) {
      context.handle(_syncedMeta,
          synced.isAcceptableOrUnknown(data['synced']!, _syncedMeta));
    }
    if (data.containsKey('created')) {
      context.handle(_createdMeta,
          created.isAcceptableOrUnknown(data['created']!, _createdMeta));
    } else if (isInserting) {
      context.missing(_createdMeta);
    }
    if (data.containsKey('updated')) {
      context.handle(_updatedMeta,
          updated.isAcceptableOrUnknown(data['updated']!, _updatedMeta));
    } else if (isInserting) {
      context.missing(_updatedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {collectionName},
      ];
  @override
  RecordsCacheData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RecordsCacheData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      collectionName: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}collection_name'])!,
      synced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}synced'])!,
      created: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created'])!,
      updated: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated'])!,
    );
  }

  @override
  RecordsCache createAlias(String alias) {
    return RecordsCache(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const ['UNIQUE(collection_name)'];
  @override
  bool get dontWriteConstraints => true;
}

class RecordsCacheData extends DataClass
    implements Insertable<RecordsCacheData> {
  int id;
  String collectionName;
  bool synced;
  DateTime created;
  DateTime updated;
  RecordsCacheData(
      {required this.id,
      required this.collectionName,
      required this.synced,
      required this.created,
      required this.updated});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['collection_name'] = Variable<String>(collectionName);
    map['synced'] = Variable<bool>(synced);
    map['created'] = Variable<DateTime>(created);
    map['updated'] = Variable<DateTime>(updated);
    return map;
  }

  RecordsCacheCompanion toCompanion(bool nullToAbsent) {
    return RecordsCacheCompanion(
      id: Value(id),
      collectionName: Value(collectionName),
      synced: Value(synced),
      created: Value(created),
      updated: Value(updated),
    );
  }

  factory RecordsCacheData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RecordsCacheData(
      id: serializer.fromJson<int>(json['id']),
      collectionName: serializer.fromJson<String>(json['collection_name']),
      synced: serializer.fromJson<bool>(json['synced']),
      created: serializer.fromJson<DateTime>(json['created']),
      updated: serializer.fromJson<DateTime>(json['updated']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'collection_name': serializer.toJson<String>(collectionName),
      'synced': serializer.toJson<bool>(synced),
      'created': serializer.toJson<DateTime>(created),
      'updated': serializer.toJson<DateTime>(updated),
    };
  }

  RecordsCacheData copyWith(
          {int? id,
          String? collectionName,
          bool? synced,
          DateTime? created,
          DateTime? updated}) =>
      RecordsCacheData(
        id: id ?? this.id,
        collectionName: collectionName ?? this.collectionName,
        synced: synced ?? this.synced,
        created: created ?? this.created,
        updated: updated ?? this.updated,
      );
  @override
  String toString() {
    return (StringBuffer('RecordsCacheData(')
          ..write('id: $id, ')
          ..write('collectionName: $collectionName, ')
          ..write('synced: $synced, ')
          ..write('created: $created, ')
          ..write('updated: $updated')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, collectionName, synced, created, updated);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RecordsCacheData &&
          other.id == this.id &&
          other.collectionName == this.collectionName &&
          other.synced == this.synced &&
          other.created == this.created &&
          other.updated == this.updated);
}

class RecordsCacheCompanion extends UpdateCompanion<RecordsCacheData> {
  Value<int> id;
  Value<String> collectionName;
  Value<bool> synced;
  Value<DateTime> created;
  Value<DateTime> updated;
  RecordsCacheCompanion({
    this.id = const Value.absent(),
    this.collectionName = const Value.absent(),
    this.synced = const Value.absent(),
    this.created = const Value.absent(),
    this.updated = const Value.absent(),
  });
  RecordsCacheCompanion.insert({
    this.id = const Value.absent(),
    required String collectionName,
    this.synced = const Value.absent(),
    required DateTime created,
    required DateTime updated,
  })  : collectionName = Value(collectionName),
        created = Value(created),
        updated = Value(updated);
  static Insertable<RecordsCacheData> custom({
    Expression<int>? id,
    Expression<String>? collectionName,
    Expression<bool>? synced,
    Expression<DateTime>? created,
    Expression<DateTime>? updated,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (collectionName != null) 'collection_name': collectionName,
      if (synced != null) 'synced': synced,
      if (created != null) 'created': created,
      if (updated != null) 'updated': updated,
    });
  }

  RecordsCacheCompanion copyWith(
      {Value<int>? id,
      Value<String>? collectionName,
      Value<bool>? synced,
      Value<DateTime>? created,
      Value<DateTime>? updated}) {
    return RecordsCacheCompanion(
      id: id ?? this.id,
      collectionName: collectionName ?? this.collectionName,
      synced: synced ?? this.synced,
      created: created ?? this.created,
      updated: updated ?? this.updated,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (collectionName.present) {
      map['collection_name'] = Variable<String>(collectionName.value);
    }
    if (synced.present) {
      map['synced'] = Variable<bool>(synced.value);
    }
    if (created.present) {
      map['created'] = Variable<DateTime>(created.value);
    }
    if (updated.present) {
      map['updated'] = Variable<DateTime>(updated.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecordsCacheCompanion(')
          ..write('id: $id, ')
          ..write('collectionName: $collectionName, ')
          ..write('synced: $synced, ')
          ..write('created: $created, ')
          ..write('updated: $updated')
          ..write(')'))
        .toString();
  }
}

abstract class _$HfwDatabase extends GeneratedDatabase {
  _$HfwDatabase(QueryExecutor e) : super(e);
  late final Users users = Users(this);
  late final RequestCache requestCache = RequestCache(this);
  late final OfflineQueue offlineQueue = OfflineQueue(this);
  late final OfflineQueueFiles offlineQueueFiles = OfflineQueueFiles(this);
  late final Trigger offlineQueueDeleteTrigger = Trigger(
      'CREATE TRIGGER offline_queue_delete_trigger AFTER DELETE ON offline_queue BEGIN DELETE FROM offline_queue_files WHERE offline_queue_id = OLD.id;END',
      'offline_queue_delete_trigger');
  late final Trigger offlineQueueUsersDeleteTrigger = Trigger(
      'CREATE TRIGGER offline_queue_users_delete_trigger AFTER DELETE ON users BEGIN DELETE FROM offline_queue WHERE user = OLD.id;END',
      'offline_queue_users_delete_trigger');
  late final Records records = Records(this);
  late final UserRecords userRecords = UserRecords(this);
  late final Analytics analytics = Analytics(this);
  late final UserPurchases userPurchases = UserPurchases(this);
  late final UserLibrary userLibrary = UserLibrary(this);
  late final UserHymnLibrary userHymnLibrary = UserHymnLibrary(this);
  late final UserStakeholderLibrary userStakeholderLibrary =
      UserStakeholderLibrary(this);
  late final UserTopicLibrary userTopicLibrary = UserTopicLibrary(this);
  late final UserPlaylistLibrary userPlaylistLibrary =
      UserPlaylistLibrary(this);
  late final LocalPlaylistItems localPlaylistItems = LocalPlaylistItems(this);
  late final PlaylistItems playlistItems = PlaylistItems(this);
  late final PublicPlaylistItems publicPlaylistItems =
      PublicPlaylistItems(this);
  late final LocalPlaylists localPlaylists = LocalPlaylists(this);
  late final Playlists playlists = Playlists(this);
  late final PublicPlaylists publicPlaylists = PublicPlaylists(this);
  late final PlaylistsFts playlistsFts = PlaylistsFts(this);
  late final PublicPlaylistsFts publicPlaylistsFts = PublicPlaylistsFts(this);
  late final HymnPortions hymnPortions = HymnPortions(this);
  late final Index hymnPortionsIdxHymnId = Index('hymn_portions_idx_hymnId',
      'CREATE INDEX hymn_portions_idx_hymnId ON hymn_portions (hymnId)');
  late final Index hymnPortionsIdxPortionId = Index(
      'hymn_portions_idx_portionId',
      'CREATE INDEX hymn_portions_idx_portionId ON hymn_portions (portionId)');
  late final Hymns hymns = Hymns(this);
  late final Trigger hymnPortionsDeleteHymn = Trigger(
      'CREATE TRIGGER hymn_portions_delete_hymn AFTER DELETE ON hymns BEGIN DELETE FROM hymn_portions WHERE hymnId = old.id;END',
      'hymn_portions_delete_hymn');
  late final Portions portions = Portions(this);
  late final Trigger hymnPortionsDeletePortion = Trigger(
      'CREATE TRIGGER hymn_portions_delete_portion AFTER DELETE ON portions BEGIN DELETE FROM hymn_portions WHERE portionId = old.id;END',
      'hymn_portions_delete_portion');
  late final Index portionsIdxName = Index(
      'portions_idx_name', 'CREATE INDEX portions_idx_name ON portions (name)');
  late final Index portionsIdxLyrics = Index('portions_idx_lyrics',
      'CREATE INDEX portions_idx_lyrics ON portions (lyrics)');
  late final Index portionsIdxHymnPortionId = Index(
      'portions_idx_hymnPortionId',
      'CREATE INDEX portions_idx_hymnPortionId ON portions (hymnPortionId)');
  late final PortionsFts portionsFts = PortionsFts(this);
  late final Trigger portionsFtsInsert = Trigger(
      'CREATE TRIGGER portions_fts_insert AFTER INSERT ON portions BEGIN INSERT INTO portions_fts ("rowid", name, lyrics) VALUES (new."ROWID", new.name, new.lyrics);END',
      'portions_fts_insert');
  late final Trigger portionsFtsUpdate = Trigger(
      'CREATE TRIGGER portions_fts_update AFTER UPDATE ON portions BEGIN UPDATE portions_fts SET name = new.name, lyrics = new.lyrics WHERE "rowid" = old."ROWID";END',
      'portions_fts_update');
  late final Trigger portionsFtsDelete = Trigger(
      'CREATE TRIGGER portions_fts_delete AFTER DELETE ON portions BEGIN INSERT INTO portions_fts (portions_fts, "rowid", name, lyrics) VALUES (\'delete\', old."ROWID", old.name, old.lyrics);END',
      'portions_fts_delete');
  late final HymnHymnals hymnHymnals = HymnHymnals(this);
  late final Index hymnHymnalsIdxHymnId = Index('hymn_hymnals_idx_hymnId',
      'CREATE INDEX hymn_hymnals_idx_hymnId ON hymn_hymnals (hymnId)');
  late final Index hymnHymnalsIdxHymnalId = Index('hymn_hymnals_idx_hymnalId',
      'CREATE INDEX hymn_hymnals_idx_hymnalId ON hymn_hymnals (hymnalId)');
  late final Trigger hymnHymnalsDeleteHymn = Trigger(
      'CREATE TRIGGER hymn_hymnals_delete_hymn AFTER DELETE ON hymns BEGIN DELETE FROM hymn_hymnals WHERE hymnId = old.id;END',
      'hymn_hymnals_delete_hymn');
  late final Hymnals hymnals = Hymnals(this);
  late final Trigger hymnHymnalsDeleteHymnal = Trigger(
      'CREATE TRIGGER hymn_hymnals_delete_hymnal AFTER DELETE ON hymnals BEGIN DELETE FROM hymn_hymnals WHERE hymnalId = old.id;END',
      'hymn_hymnals_delete_hymnal');
  late final Index hymnalsIdxName = Index(
      'hymnals_idx_name', 'CREATE INDEX hymnals_idx_name ON hymnals (name)');
  late final Index hymnalsIdxAlias = Index(
      'hymnals_idx_alias', 'CREATE INDEX hymnals_idx_alias ON hymnals (alias)');
  late final HymnalsFts hymnalsFts = HymnalsFts(this);
  late final Trigger hymnalsFtsInsert = Trigger(
      'CREATE TRIGGER hymnals_fts_insert AFTER INSERT ON hymnals BEGIN INSERT INTO hymnals_fts ("rowid", name, alias) VALUES (new."ROWID", new.name, new.alias);END',
      'hymnals_fts_insert');
  late final Trigger hymnalsFtsUpdate = Trigger(
      'CREATE TRIGGER hymnals_fts_update AFTER UPDATE ON hymnals BEGIN UPDATE hymnals_fts SET name = new.name, alias = new.alias WHERE "rowid" = old."ROWID";END',
      'hymnals_fts_update');
  late final Trigger hymnalsFtsDelete = Trigger(
      'CREATE TRIGGER hymnals_fts_delete AFTER DELETE ON hymnals BEGIN INSERT INTO hymnals_fts (hymnals_fts, "rowid", name, alias) VALUES (\'delete\', old."ROWID", old.name, old.alias);END',
      'hymnals_fts_delete');
  late final HymnScriptures hymnScriptures = HymnScriptures(this);
  late final Index hymnScripturesIdxHymnId = Index('hymn_scriptures_idx_hymnId',
      'CREATE INDEX hymn_scriptures_idx_hymnId ON hymn_scriptures (hymnId)');
  late final Index hymnScripturesIdxScriptureId = Index(
      'hymn_scriptures_idx_scriptureId',
      'CREATE INDEX hymn_scriptures_idx_scriptureId ON hymn_scriptures (scriptureId)');
  late final Trigger hymnScripturesDeleteHymn = Trigger(
      'CREATE TRIGGER hymn_scriptures_delete_hymn AFTER DELETE ON hymns BEGIN DELETE FROM hymn_scriptures WHERE hymnId = old.id;END',
      'hymn_scriptures_delete_hymn');
  late final Scriptures scriptures = Scriptures(this);
  late final Trigger hymnScripturesDeleteScripture = Trigger(
      'CREATE TRIGGER hymn_scriptures_delete_scripture AFTER DELETE ON scriptures BEGIN DELETE FROM hymn_scriptures WHERE scriptureId = old.id;END',
      'hymn_scriptures_delete_scripture');
  late final Index scripturesIdxName = Index('scriptures_idx_name',
      'CREATE INDEX scriptures_idx_name ON scriptures (name)');
  late final ScripturesFts scripturesFts = ScripturesFts(this);
  late final Trigger scripturesFtsInsert = Trigger(
      'CREATE TRIGGER scriptures_fts_insert AFTER INSERT ON scriptures BEGIN INSERT INTO scriptures_fts ("rowid", name) VALUES (new."ROWID", new.name);END',
      'scriptures_fts_insert');
  late final Trigger scripturesFtsUpdate = Trigger(
      'CREATE TRIGGER scriptures_fts_update AFTER UPDATE ON scriptures BEGIN UPDATE scriptures_fts SET name = new.name WHERE "rowid" = old."ROWID";END',
      'scriptures_fts_update');
  late final Trigger scripturesFtsDelete = Trigger(
      'CREATE TRIGGER scriptures_fts_delete AFTER DELETE ON scriptures BEGIN INSERT INTO scriptures_fts (scriptures_fts, "rowid", name) VALUES (\'delete\', old."ROWID", old.name);END',
      'scriptures_fts_delete');
  late final HymnStakeholders hymnStakeholders = HymnStakeholders(this);
  late final Index hymnStakeholdersIdxHymnId = Index(
      'hymn_stakeholders_idx_hymnId',
      'CREATE INDEX hymn_stakeholders_idx_hymnId ON hymn_stakeholders (hymnId)');
  late final Index hymnStakeholdersIdxStakeholderId = Index(
      'hymn_stakeholders_idx_stakeholderId',
      'CREATE INDEX hymn_stakeholders_idx_stakeholderId ON hymn_stakeholders (stakeholderId)');
  late final Index hymnStakeholdersIdxRelationship = Index(
      'hymn_stakeholders_idx_relationship',
      'CREATE INDEX hymn_stakeholders_idx_relationship ON hymn_stakeholders (relationship)');
  late final Trigger hymnStakeholdersDeleteHymn = Trigger(
      'CREATE TRIGGER hymn_stakeholders_delete_hymn AFTER DELETE ON hymns BEGIN DELETE FROM hymn_stakeholders WHERE hymnId = old.id;END',
      'hymn_stakeholders_delete_hymn');
  late final Stakeholders stakeholders = Stakeholders(this);
  late final Trigger hymnStakeholdersDeleteStakeholder = Trigger(
      'CREATE TRIGGER hymn_stakeholders_delete_stakeholder AFTER DELETE ON stakeholders BEGIN DELETE FROM hymn_stakeholders WHERE stakeholderId = old.id;END',
      'hymn_stakeholders_delete_stakeholder');
  late final Index stakeholdersIdxName = Index('stakeholders_idx_name',
      'CREATE INDEX stakeholders_idx_name ON stakeholders (name)');
  late final StakeholdersFts stakeholdersFts = StakeholdersFts(this);
  late final Trigger stakeholdersFtsInsert = Trigger(
      'CREATE TRIGGER stakeholders_fts_insert AFTER INSERT ON stakeholders BEGIN INSERT INTO stakeholders_fts ("rowid", name) VALUES (new."ROWID", new.name);END',
      'stakeholders_fts_insert');
  late final Trigger stakeholdersFtsUpdate = Trigger(
      'CREATE TRIGGER stakeholders_fts_update AFTER UPDATE ON stakeholders BEGIN UPDATE stakeholders_fts SET name = new.name WHERE "rowid" = old."ROWID";END',
      'stakeholders_fts_update');
  late final Trigger stakeholdersFtsDelete = Trigger(
      'CREATE TRIGGER stakeholders_fts_delete AFTER DELETE ON stakeholders BEGIN INSERT INTO stakeholders_fts (stakeholders_fts, "rowid", name) VALUES (\'delete\', old."ROWID", old.name);END',
      'stakeholders_fts_delete');
  late final HymnTopics hymnTopics = HymnTopics(this);
  late final Index hymnTopicsIdxHymnId = Index('hymn_topics_idx_hymnId',
      'CREATE INDEX hymn_topics_idx_hymnId ON hymn_topics (hymnId)');
  late final Index hymnTopicsIdxTopicId = Index('hymn_topics_idx_topicId',
      'CREATE INDEX hymn_topics_idx_topicId ON hymn_topics (topicId)');
  late final Trigger hymnTopicsDeleteHymn = Trigger(
      'CREATE TRIGGER hymn_topics_delete_hymn AFTER DELETE ON hymns BEGIN DELETE FROM hymn_topics WHERE hymnId = old.id;END',
      'hymn_topics_delete_hymn');
  late final Topics topics = Topics(this);
  late final Trigger hymnTopicsDeleteTopic = Trigger(
      'CREATE TRIGGER hymn_topics_delete_topic AFTER DELETE ON topics BEGIN DELETE FROM hymn_topics WHERE topicId = old.id;END',
      'hymn_topics_delete_topic');
  late final Index topicsIdxName =
      Index('topics_idx_name', 'CREATE INDEX topics_idx_name ON topics (name)');
  late final TopicsFts topicsFts = TopicsFts(this);
  late final Trigger topicsFtsInsert = Trigger(
      'CREATE TRIGGER topics_fts_insert AFTER INSERT ON topics BEGIN INSERT INTO topics_fts ("rowid", name) VALUES (new."ROWID", new.name);END',
      'topics_fts_insert');
  late final Trigger topicsFtsUpdate = Trigger(
      'CREATE TRIGGER topics_fts_update AFTER UPDATE ON topics BEGIN UPDATE topics_fts SET name = new.name WHERE "rowid" = old."ROWID";END',
      'topics_fts_update');
  late final Trigger topicsFtsDelete = Trigger(
      'CREATE TRIGGER topics_fts_delete AFTER DELETE ON topics BEGIN INSERT INTO topics_fts (topics_fts, "rowid", name) VALUES (\'delete\', old."ROWID", old.name);END',
      'topics_fts_delete');
  late final Index hymnsIdxTitle =
      Index('hymns_idx_title', 'CREATE INDEX hymns_idx_title ON hymns (title)');
  late final Index hymnsIdxNumber = Index(
      'hymns_idx_number', 'CREATE INDEX hymns_idx_number ON hymns (number)');
  late final HymnsFts hymnsFts = HymnsFts(this);
  late final Trigger hymnsFtsInsert = Trigger(
      'CREATE TRIGGER hymns_fts_insert AFTER INSERT ON hymns BEGIN INSERT INTO hymns_fts ("rowid", title, number, tuneName, startingKey, beatPattern, startingPitch, startingBeat, startingPitchDirection, timeSignature, complexTimeSignature) VALUES (new."ROWID", new.title, new.number, new.tuneName, new.startingKey, new.beatPattern, new.startingPitch, new.startingBeat, new.startingPitchDirection, new.timeSignature, new.complexTimeSignature);END',
      'hymns_fts_insert');
  late final Trigger hymnsFtsUpdate = Trigger(
      'CREATE TRIGGER hymns_fts_update AFTER UPDATE ON hymns BEGIN UPDATE hymns_fts SET title = new.title, number = new.number, tuneName = new.tuneName, startingKey = new.startingKey, beatPattern = new.beatPattern, startingPitch = new.startingPitch, startingBeat = new.startingBeat, startingPitchDirection = new.startingPitchDirection, timeSignature = new.timeSignature, complexTimeSignature = new.complexTimeSignature WHERE "rowid" = old."ROWID";END',
      'hymns_fts_update');
  late final Trigger hymnsFtsDelete = Trigger(
      'CREATE TRIGGER hymns_fts_delete AFTER DELETE ON hymns BEGIN INSERT INTO hymns_fts (hymns_fts, "rowid", title, number, tuneName, startingKey, beatPattern, startingPitch, startingBeat, startingPitchDirection, timeSignature, complexTimeSignature) VALUES (\'delete\', old."ROWID", old.title, old.number, old.tuneName, old.startingKey, old.beatPattern, old.startingPitch, old.startingBeat, old.startingPitchDirection, old.timeSignature, old.complexTimeSignature);END',
      'hymns_fts_delete');
  late final Bundles bundles = Bundles(this);
  late final Index bundlesIdxHymnId = Index('bundles_idx_hymnId',
      'CREATE INDEX bundles_idx_hymnId ON bundles (hymnId)');
  late final Trigger bundlesDeleteHymn = Trigger(
      'CREATE TRIGGER bundles_delete_hymn AFTER DELETE ON hymns BEGIN DELETE FROM bundles WHERE hymnId = old.id;END',
      'bundles_delete_hymn');
  late final Trigger userRecordsUsersDeleteTrigger = Trigger(
      'CREATE TRIGGER user_records_users_delete_trigger AFTER DELETE ON users BEGIN DELETE FROM user_records WHERE user = OLD.id;END',
      'user_records_users_delete_trigger');
  late final RecordsCache recordsCache = RecordsCache(this);
  late final Index recordsIdxCollection = Index('records_idx_collection',
      'CREATE INDEX records_idx_collection ON records (collection_id, collection_name)');
  late final Index recordsIdxData = Index(
      'records_idx_data', 'CREATE INDEX records_idx_data ON records (data)');
  late final Index recordsIdxStatus = Index('records_idx_status',
      'CREATE INDEX records_idx_status ON records (deleted, synced)');
  late final Index recordsIdxDate = Index('records_idx_date',
      'CREATE INDEX records_idx_date ON records (created, updated)');
  Selectable<User> getAllUsers() {
    return customSelect('SELECT * FROM users', variables: [], readsFrom: {
      users,
    }).asyncMap(users.mapFromRow);
  }

  Selectable<User> getUserById(String id) {
    return customSelect('SELECT * FROM users WHERE id = ?1', variables: [
      Variable<String>(id)
    ], readsFrom: {
      users,
    }).asyncMap(users.mapFromRow);
  }

  Future<int> createUser(
      String id,
      String name,
      String? username,
      String? email,
      String? avatar,
      String? uid,
      DateTime created,
      DateTime updated) {
    return customInsert(
      'INSERT INTO users (id, name, username, email, avatar, uid, created, updated) VALUES (?1, ?2, ?3, ?4, ?5, ?6, ?7, ?8)',
      variables: [
        Variable<String>(id),
        Variable<String>(name),
        Variable<String>(username),
        Variable<String>(email),
        Variable<String>(avatar),
        Variable<String>(uid),
        Variable<DateTime>(created),
        Variable<DateTime>(updated)
      ],
      updates: {users},
    );
  }

  Future<int> updateUser(String name, String? username, String? email,
      String? avatar, String? uid, DateTime updated, String id) {
    return customUpdate(
      'UPDATE users SET name = ?1, username = ?2, email = ?3, avatar = ?4, uid = ?5, updated = ?6 WHERE id = ?7',
      variables: [
        Variable<String>(name),
        Variable<String>(username),
        Variable<String>(email),
        Variable<String>(avatar),
        Variable<String>(uid),
        Variable<DateTime>(updated),
        Variable<String>(id)
      ],
      updates: {users},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> deleteUser(String id) {
    return customUpdate(
      'DELETE FROM users WHERE id = ?1',
      variables: [Variable<String>(id)],
      updates: {users},
      updateKind: UpdateKind.delete,
    );
  }

  Selectable<RequestCacheData> getRequestCache() {
    return customSelect('SELECT * FROM request_cache',
        variables: [],
        readsFrom: {
          requestCache,
        }).asyncMap(requestCache.mapFromRow);
  }

  Selectable<RequestCacheData> getRequestCacheById(int id) {
    return customSelect('SELECT * FROM request_cache WHERE id = ?1',
        variables: [
          Variable<int>(id)
        ],
        readsFrom: {
          requestCache,
        }).asyncMap(requestCache.mapFromRow);
  }

  Selectable<RequestCacheData> getRequestCacheByUrl(String url) {
    return customSelect('SELECT * FROM request_cache WHERE url = ?1',
        variables: [
          Variable<String>(url)
        ],
        readsFrom: {
          requestCache,
        }).asyncMap(requestCache.mapFromRow);
  }

  Selectable<GetRequestCacheCacheControlResult> getRequestCacheCacheControl() {
    return customSelect(
        'SELECT id, CAST(json_extract(headers, \'\$."Cache-Control"\') AS TEXT) AS cache_control FROM request_cache WHERE json_extract(headers, \'\$."Cache-Control"\') IS NOT NULL',
        variables: [],
        readsFrom: {
          requestCache,
        }).map((QueryRow row) => GetRequestCacheCacheControlResult(
          id: row.read<int>('id'),
          cacheControl: row.read<String>('cache_control'),
        ));
  }

  Future<int> createRequestCache(String url, String headers, Uint8List body,
      DateTime created, DateTime updated) {
    return customInsert(
      'INSERT OR REPLACE INTO request_cache (url, headers, body, created, updated) VALUES (?1, ?2, ?3, ?4, ?5)',
      variables: [
        Variable<String>(url),
        Variable<String>(headers),
        Variable<Uint8List>(body),
        Variable<DateTime>(created),
        Variable<DateTime>(updated)
      ],
      updates: {requestCache},
    );
  }

  Future<int> updateRequestCache(
      String url, String headers, Uint8List body, DateTime updated, int id) {
    return customUpdate(
      'UPDATE request_cache SET url = ?1, headers = ?2, body = ?3, updated = ?4 WHERE id = ?5',
      variables: [
        Variable<String>(url),
        Variable<String>(headers),
        Variable<Uint8List>(body),
        Variable<DateTime>(updated),
        Variable<int>(id)
      ],
      updates: {requestCache},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> deleteRequestCache(int id) {
    return customUpdate(
      'DELETE FROM request_cache WHERE id = ?1',
      variables: [Variable<int>(id)],
      updates: {requestCache},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> deleteAllRequestCache() {
    return customUpdate(
      'DELETE FROM request_cache',
      variables: [],
      updates: {requestCache},
      updateKind: UpdateKind.delete,
    );
  }

  Selectable<OfflineQueueData> getOfflineQueue() {
    return customSelect('SELECT * FROM offline_queue ORDER BY created ASC',
        variables: [],
        readsFrom: {
          offlineQueue,
        }).asyncMap(offlineQueue.mapFromRow);
  }

  Selectable<OfflineQueueData> getOfflineQueueById(int id) {
    return customSelect('SELECT * FROM offline_queue WHERE id = ?1',
        variables: [
          Variable<int>(id)
        ],
        readsFrom: {
          offlineQueue,
        }).asyncMap(offlineQueue.mapFromRow);
  }

  Selectable<OfflineQueueFile> getOfflineQueueFiles(int offlineQueueId) {
    return customSelect(
        'SELECT * FROM offline_queue_files WHERE offline_queue_id = ?1',
        variables: [
          Variable<int>(offlineQueueId)
        ],
        readsFrom: {
          offlineQueueFiles,
        }).asyncMap(offlineQueueFiles.mapFromRow);
  }

  Selectable<OfflineQueueFile> getOfflineQueueFile(
      int offlineQueueId, String field) {
    return customSelect(
        'SELECT * FROM offline_queue_files WHERE offline_queue_id = ?1 AND field = ?2',
        variables: [
          Variable<int>(offlineQueueId),
          Variable<String>(field)
        ],
        readsFrom: {
          offlineQueueFiles,
        }).asyncMap(offlineQueueFiles.mapFromRow);
  }

  Future<int> createOfflineQueue(String url, String method, Uint8List? body,
      String headers, int retryCount, DateTime created, DateTime updated) {
    return customInsert(
      'INSERT INTO offline_queue (url, method, body, headers, retry_count, created, updated) VALUES (?1, ?2, ?3, ?4, ?5, ?6, ?7)',
      variables: [
        Variable<String>(url),
        Variable<String>(method),
        Variable<Uint8List>(body),
        Variable<String>(headers),
        Variable<int>(retryCount),
        Variable<DateTime>(created),
        Variable<DateTime>(updated)
      ],
      updates: {offlineQueue},
    );
  }

  Future<int> updateOfflineQueueRetry(
      int retryCount, DateTime updated, int id) {
    return customUpdate(
      'UPDATE offline_queue SET retry_count = ?1, updated = ?2 WHERE id = ?3',
      variables: [
        Variable<int>(retryCount),
        Variable<DateTime>(updated),
        Variable<int>(id)
      ],
      updates: {offlineQueue},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> createOfflineQueueFile(
      int offlineQueueId, String field, Uint8List value) {
    return customInsert(
      'INSERT INTO offline_queue_files (offline_queue_id, field, value) VALUES (?1, ?2, ?3)',
      variables: [
        Variable<int>(offlineQueueId),
        Variable<String>(field),
        Variable<Uint8List>(value)
      ],
      updates: {offlineQueueFiles},
    );
  }

  Future<int> deleteOfflineQueueItem(int id) {
    return customUpdate(
      'DELETE FROM offline_queue WHERE id = ?1',
      variables: [Variable<int>(id)],
      updates: {offlineQueue},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> deleteOfflineQueueFiles(int offlineQueueId) {
    return customUpdate(
      'DELETE FROM offline_queue_files WHERE offline_queue_id = ?1',
      variables: [Variable<int>(offlineQueueId)],
      updates: {offlineQueueFiles},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> deleteOfflineQueueFile(int offlineQueueId, String field) {
    return customUpdate(
      'DELETE FROM offline_queue_files WHERE offline_queue_id = ?1 AND field = ?2',
      variables: [Variable<int>(offlineQueueId), Variable<String>(field)],
      updates: {offlineQueueFiles},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> deleteOfflineQueueById(int id) {
    return customUpdate(
      'DELETE FROM offline_queue WHERE id = ?1',
      variables: [Variable<int>(id)],
      updates: {offlineQueue},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> deleteAllOfflineQueue() {
    return customUpdate(
      'DELETE FROM offline_queue',
      variables: [],
      updates: {offlineQueue},
      updateKind: UpdateKind.delete,
    );
  }

  Selectable<Analytic> getAnalytics(String? user, String? uid) {
    return customSelect('SELECT * FROM analytics WHERE user = ?1 OR uid = ?2',
        variables: [
          Variable<String>(user),
          Variable<String>(uid)
        ],
        readsFrom: {
          records,
        }).asyncMap(analytics.mapFromRow);
  }

  Selectable<Analytic> getAnalyticsById(String? user, String? uid, String id) {
    return customSelect(
        'SELECT * FROM analytics WHERE(user = ?1 OR uid = ?2)AND id = ?3',
        variables: [
          Variable<String>(user),
          Variable<String>(uid),
          Variable<String>(id)
        ],
        readsFrom: {
          records,
        }).asyncMap(analytics.mapFromRow);
  }

  Selectable<UserPurchase> getUserPurchases(String? user, String? uid) {
    return customSelect(
        'SELECT * FROM user_purchases WHERE user = ?1 OR uid = ?2',
        variables: [
          Variable<String>(user),
          Variable<String>(uid)
        ],
        readsFrom: {
          records,
        }).asyncMap(userPurchases.mapFromRow);
  }

  Selectable<UserPurchase> getUserPurchasesById(
      String? user, String? uid, String id) {
    return customSelect(
        'SELECT * FROM user_purchases WHERE(user = ?1 OR uid = ?2)AND id = ?3',
        variables: [
          Variable<String>(user),
          Variable<String>(uid),
          Variable<String>(id)
        ],
        readsFrom: {
          records,
        }).asyncMap(userPurchases.mapFromRow);
  }

  Selectable<UserLibraryData> getUserLibrary(String? user, String? uid) {
    return customSelect(
        'SELECT * FROM user_library WHERE user = ?1 OR uid = ?2',
        variables: [
          Variable<String>(user),
          Variable<String>(uid)
        ],
        readsFrom: {
          records,
        }).asyncMap(userLibrary.mapFromRow);
  }

  Selectable<UserLibraryData> getUserLibraryMatch(
      String? user,
      String? uid,
      String? hymnId,
      String? playlistId,
      String? topicId,
      String? stakeholderId) {
    return customSelect(
        'SELECT * FROM user_library WHERE(user = ?1 OR uid = ?2)AND(hymn_id = ?3 AND playlist_id = ?4 AND topic_id = ?5 AND stakeholder_id = ?6)',
        variables: [
          Variable<String>(user),
          Variable<String>(uid),
          Variable<String>(hymnId),
          Variable<String>(playlistId),
          Variable<String>(topicId),
          Variable<String>(stakeholderId)
        ],
        readsFrom: {
          records,
        }).asyncMap(userLibrary.mapFromRow);
  }

  Selectable<UserLibraryData> getUserLibraryById(
      String? user, String? uid, String id) {
    return customSelect(
        'SELECT * FROM user_library WHERE(user = ?1 OR uid = ?2)AND id = ?3',
        variables: [
          Variable<String>(user),
          Variable<String>(uid),
          Variable<String>(id)
        ],
        readsFrom: {
          records,
        }).asyncMap(userLibrary.mapFromRow);
  }

  Selectable<UserHymnLibraryData> getUserHymnLibrary(
      String? user, String? uid) {
    return customSelect(
        'SELECT * FROM user_hymn_library WHERE user = ?1 OR uid = ?2',
        variables: [
          Variable<String>(user),
          Variable<String>(uid)
        ],
        readsFrom: {
          records,
        }).asyncMap(userHymnLibrary.mapFromRow);
  }

  Selectable<UserHymnLibraryData> getUserHymnLibraryById(
      String? user, String? uid, String id) {
    return customSelect(
        'SELECT * FROM user_hymn_library WHERE(user = ?1 OR uid = ?2)AND id = ?3',
        variables: [
          Variable<String>(user),
          Variable<String>(uid),
          Variable<String>(id)
        ],
        readsFrom: {
          records,
        }).asyncMap(userHymnLibrary.mapFromRow);
  }

  Selectable<UserStakeholderLibraryData> getUserStakeholderLibrary(
      String? user, String? uid) {
    return customSelect(
        'SELECT * FROM user_stakeholder_library WHERE user = ?1 OR uid = ?2',
        variables: [
          Variable<String>(user),
          Variable<String>(uid)
        ],
        readsFrom: {
          records,
        }).asyncMap(userStakeholderLibrary.mapFromRow);
  }

  Selectable<UserStakeholderLibraryData> getUserStakeholderLibraryById(
      String? user, String? uid, String id) {
    return customSelect(
        'SELECT * FROM user_stakeholder_library WHERE(user = ?1 OR uid = ?2)AND id = ?3',
        variables: [
          Variable<String>(user),
          Variable<String>(uid),
          Variable<String>(id)
        ],
        readsFrom: {
          records,
        }).asyncMap(userStakeholderLibrary.mapFromRow);
  }

  Selectable<UserTopicLibraryData> getUserTopicLibrary(
      String? user, String? uid) {
    return customSelect(
        'SELECT * FROM user_topic_library WHERE user = ?1 OR uid = ?2',
        variables: [
          Variable<String>(user),
          Variable<String>(uid)
        ],
        readsFrom: {
          records,
        }).asyncMap(userTopicLibrary.mapFromRow);
  }

  Selectable<UserTopicLibraryData> getUserTopicLibraryById(
      String? user, String? uid, String id) {
    return customSelect(
        'SELECT * FROM user_topic_library WHERE(user = ?1 OR uid = ?2)AND id = ?3',
        variables: [
          Variable<String>(user),
          Variable<String>(uid),
          Variable<String>(id)
        ],
        readsFrom: {
          records,
        }).asyncMap(userTopicLibrary.mapFromRow);
  }

  Selectable<UserPlaylistLibraryData> getUserPlaylistLibrary(
      String? user, String? uid) {
    return customSelect(
        'SELECT * FROM user_playlist_library WHERE user = ?1 OR uid = ?2',
        variables: [
          Variable<String>(user),
          Variable<String>(uid)
        ],
        readsFrom: {
          records,
        }).asyncMap(userPlaylistLibrary.mapFromRow);
  }

  Selectable<UserPlaylistLibraryData> getUserPlaylistLibraryById(
      String? user, String? uid, String id) {
    return customSelect(
        'SELECT * FROM user_playlist_library WHERE(user = ?1 OR uid = ?2)AND id = ?3',
        variables: [
          Variable<String>(user),
          Variable<String>(uid),
          Variable<String>(id)
        ],
        readsFrom: {
          records,
        }).asyncMap(userPlaylistLibrary.mapFromRow);
  }

  Selectable<PlaylistItem> getItemsForPlaylist(
      String? user, String? uid, String? playlistId) {
    return customSelect(
        'SELECT * FROM playlist_items WHERE(user = ?1 OR uid = ?2)AND playlist_id = ?3',
        variables: [
          Variable<String>(user),
          Variable<String>(uid),
          Variable<String>(playlistId)
        ],
        readsFrom: {
          records,
        }).asyncMap(playlistItems.mapFromRow);
  }

  Selectable<PublicPlaylistItem> getItemsForPublicPlaylist(String? playlistId) {
    return customSelect(
        'SELECT * FROM public_playlist_items WHERE playlist_id = ?1',
        variables: [
          Variable<String>(playlistId)
        ],
        readsFrom: {
          records,
        }).asyncMap(publicPlaylistItems.mapFromRow);
  }

  Selectable<Playlist> getPlaylists(String? user, String? uid) {
    return customSelect('SELECT * FROM playlists WHERE user = ?1 OR uid = ?2',
        variables: [
          Variable<String>(user),
          Variable<String>(uid)
        ],
        readsFrom: {
          records,
        }).asyncMap(playlists.mapFromRow);
  }

  Selectable<Playlist> getPlaylist(String? user, String? uid, String id) {
    return customSelect(
        'SELECT * FROM playlists WHERE(user = ?1 OR uid = ?2)AND id = ?3',
        variables: [
          Variable<String>(user),
          Variable<String>(uid),
          Variable<String>(id)
        ],
        readsFrom: {
          records,
        }).asyncMap(playlists.mapFromRow);
  }

  Selectable<PlaylistsFt> searchPlaylists(String query) {
    return customSelect(
        'SELECT * FROM playlists_fts WHERE playlists_fts MATCH ?1',
        variables: [
          Variable<String>(query)
        ],
        readsFrom: {
          playlistsFts,
        }).asyncMap(playlistsFts.mapFromRow);
  }

  Selectable<PublicPlaylist> getPublicPlaylists() {
    return customSelect('SELECT * FROM public_playlists',
        variables: [],
        readsFrom: {
          records,
        }).asyncMap(publicPlaylists.mapFromRow);
  }

  Selectable<PublicPlaylist> getPublicPlaylist(String id) {
    return customSelect('SELECT * FROM public_playlists WHERE id = ?1',
        variables: [
          Variable<String>(id)
        ],
        readsFrom: {
          records,
        }).asyncMap(publicPlaylists.mapFromRow);
  }

  Selectable<PublicPlaylistsFt> searchPublicPlaylists(String query) {
    return customSelect(
        'SELECT * FROM public_playlists_fts WHERE public_playlists_fts MATCH ?1',
        variables: [
          Variable<String>(query)
        ],
        readsFrom: {
          publicPlaylistsFts,
        }).asyncMap(publicPlaylistsFts.mapFromRow);
  }

  Selectable<HymnPortion> getHymnPortions() {
    return customSelect('SELECT * FROM hymn_portions',
        variables: [],
        readsFrom: {
          hymnPortions,
        }).asyncMap(hymnPortions.mapFromRow);
  }

  Selectable<HymnPortion> getHymnPortion(int id) {
    return customSelect('SELECT * FROM hymn_portions WHERE id = ?1',
        variables: [
          Variable<int>(id)
        ],
        readsFrom: {
          hymnPortions,
        }).asyncMap(hymnPortions.mapFromRow);
  }

  Selectable<HymnPortion> getHymnPortionsByPortionId(String portionId) {
    return customSelect('SELECT * FROM hymn_portions WHERE portionId = ?1',
        variables: [
          Variable<String>(portionId)
        ],
        readsFrom: {
          hymnPortions,
        }).asyncMap(hymnPortions.mapFromRow);
  }

  Selectable<HymnPortion> getHymnPortionsByHymnId(String hymnId) {
    return customSelect('SELECT * FROM hymn_portions WHERE hymnId = ?1',
        variables: [
          Variable<String>(hymnId)
        ],
        readsFrom: {
          hymnPortions,
        }).asyncMap(hymnPortions.mapFromRow);
  }

  Future<List<HymnPortion>> createHymnPortion(
      String portionId, String hymnId, DateTime created, DateTime updated) {
    return customWriteReturning(
        'INSERT OR REPLACE INTO hymn_portions (portionId, hymnId, created, updated) VALUES (?1, ?2, ?3, ?4) RETURNING *',
        variables: [
          Variable<String>(portionId),
          Variable<String>(hymnId),
          Variable<DateTime>(created),
          Variable<DateTime>(updated)
        ],
        updates: {
          hymnPortions
        }).then((rows) => Future.wait(rows.map(hymnPortions.mapFromRow)));
  }

  Future<int> updateHymnPortion(
      String portionId, String hymnId, DateTime updated, int id) {
    return customUpdate(
      'UPDATE hymn_portions SET portionId = ?1, hymnId = ?2, updated = ?3 WHERE id = ?4',
      variables: [
        Variable<String>(portionId),
        Variable<String>(hymnId),
        Variable<DateTime>(updated),
        Variable<int>(id)
      ],
      updates: {hymnPortions},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> deleteHymnPortion(int id) {
    return customUpdate(
      'DELETE FROM hymn_portions WHERE id = ?1',
      variables: [Variable<int>(id)],
      updates: {hymnPortions},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> deleteHymnPortions() {
    return customUpdate(
      'DELETE FROM hymn_portions',
      variables: [],
      updates: {hymnPortions},
      updateKind: UpdateKind.delete,
    );
  }

  Selectable<Hymn> getHymnsByPortionId(String portionId) {
    return customSelect(
        'SELECT h.* FROM hymns AS h WHERE EXISTS (SELECT hymnId FROM hymn_portions WHERE hymnId = h.id AND portionId = ?1)',
        variables: [
          Variable<String>(portionId)
        ],
        readsFrom: {
          hymns,
          hymnPortions,
        }).asyncMap(hymns.mapFromRow);
  }

  Selectable<Portion> getPortionsByHymnId(String hymnId) {
    return customSelect(
        'SELECT t.* FROM portions AS t WHERE EXISTS (SELECT portionId FROM hymn_portions WHERE portionId = t.id AND hymnId = ?1)',
        variables: [
          Variable<String>(hymnId)
        ],
        readsFrom: {
          portions,
          hymnPortions,
        }).asyncMap(portions.mapFromRow);
  }

  Selectable<SearchPortionsResult> searchPortions(String query) {
    return customSelect(
        'SELECT t.id, highlight(portions_fts, 0, \'<b>\', \'</b>\') AS name, highlight(portions_fts, 1, \'<b>\', \'</b>\') AS lyrics, t.created, t.updated FROM portions_fts INNER JOIN portions AS t ON t.id = portions_fts."ROWID" WHERE portions_fts MATCH ?1 ORDER BY rank',
        variables: [
          Variable<String>(query)
        ],
        readsFrom: {
          portions,
          portionsFts,
        }).map((QueryRow row) => SearchPortionsResult(
          id: row.read<String>('id'),
          name: row.read<String>('name'),
          lyrics: row.read<String>('lyrics'),
          created: row.read<DateTime>('created'),
          updated: row.read<DateTime>('updated'),
        ));
  }

  Selectable<Portion> getPortions() {
    return customSelect('SELECT * FROM portions ORDER BY name ASC',
        variables: [],
        readsFrom: {
          portions,
        }).asyncMap(portions.mapFromRow);
  }

  Selectable<Portion> getPortion(String id) {
    return customSelect('SELECT * FROM portions WHERE id = ?1', variables: [
      Variable<String>(id)
    ], readsFrom: {
      portions,
    }).asyncMap(portions.mapFromRow);
  }

  Selectable<String> getPortionNames() {
    return customSelect('SELECT name FROM portions GROUP BY name',
        variables: [],
        readsFrom: {
          portions,
        }).map((QueryRow row) => row.read<String>('name'));
  }

  Future<List<Portion>> createPortion(String id, String name, String lyrics,
      String? hymnPortionId, DateTime created, DateTime updated) {
    return customWriteReturning(
        'INSERT OR REPLACE INTO portions (id, name, lyrics, hymnPortionId, created, updated) VALUES (?1, ?2, ?3, ?4, ?5, ?6) RETURNING *',
        variables: [
          Variable<String>(id),
          Variable<String>(name),
          Variable<String>(lyrics),
          Variable<String>(hymnPortionId),
          Variable<DateTime>(created),
          Variable<DateTime>(updated)
        ],
        updates: {
          portions
        }).then((rows) => Future.wait(rows.map(portions.mapFromRow)));
  }

  Future<int> updatePortion(String name, String lyrics, String? hymnPortionId,
      DateTime updated, String id) {
    return customUpdate(
      'UPDATE portions SET name = ?1, lyrics = ?2, hymnPortionId = ?3, updated = ?4 WHERE id = ?5',
      variables: [
        Variable<String>(name),
        Variable<String>(lyrics),
        Variable<String>(hymnPortionId),
        Variable<DateTime>(updated),
        Variable<String>(id)
      ],
      updates: {portions},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> deletePortion(String id) {
    return customUpdate(
      'DELETE FROM portions WHERE id = ?1',
      variables: [Variable<String>(id)],
      updates: {portions},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> deletePortions() {
    return customUpdate(
      'DELETE FROM portions',
      variables: [],
      updates: {portions},
      updateKind: UpdateKind.delete,
    );
  }

  Selectable<HymnHymnal> getHymnHymnals() {
    return customSelect('SELECT * FROM hymn_hymnals',
        variables: [],
        readsFrom: {
          hymnHymnals,
        }).asyncMap(hymnHymnals.mapFromRow);
  }

  Selectable<HymnHymnal> getHymnHymnal(int id) {
    return customSelect('SELECT * FROM hymn_hymnals WHERE id = ?1', variables: [
      Variable<int>(id)
    ], readsFrom: {
      hymnHymnals,
    }).asyncMap(hymnHymnals.mapFromRow);
  }

  Selectable<HymnHymnal> getHymnHymnalsByHymnalId(String hymnalId) {
    return customSelect('SELECT * FROM hymn_hymnals WHERE hymnalId = ?1',
        variables: [
          Variable<String>(hymnalId)
        ],
        readsFrom: {
          hymnHymnals,
        }).asyncMap(hymnHymnals.mapFromRow);
  }

  Selectable<HymnHymnal> getHymnHymnalsByHymnId(String hymnId) {
    return customSelect('SELECT * FROM hymn_hymnals WHERE hymnId = ?1',
        variables: [
          Variable<String>(hymnId)
        ],
        readsFrom: {
          hymnHymnals,
        }).asyncMap(hymnHymnals.mapFromRow);
  }

  Future<List<HymnHymnal>> createHymnHymnal(
      String hymnalId, String hymnId, DateTime created, DateTime updated) {
    return customWriteReturning(
        'INSERT OR REPLACE INTO hymn_hymnals (hymnalId, hymnId, created, updated) VALUES (?1, ?2, ?3, ?4) RETURNING *',
        variables: [
          Variable<String>(hymnalId),
          Variable<String>(hymnId),
          Variable<DateTime>(created),
          Variable<DateTime>(updated)
        ],
        updates: {
          hymnHymnals
        }).then((rows) => Future.wait(rows.map(hymnHymnals.mapFromRow)));
  }

  Future<int> updateHymnHymnal(
      String hymnalId, String hymnId, DateTime updated, int id) {
    return customUpdate(
      'UPDATE hymn_hymnals SET hymnalId = ?1, hymnId = ?2, updated = ?3 WHERE id = ?4',
      variables: [
        Variable<String>(hymnalId),
        Variable<String>(hymnId),
        Variable<DateTime>(updated),
        Variable<int>(id)
      ],
      updates: {hymnHymnals},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> deleteHymnHymnal(int id) {
    return customUpdate(
      'DELETE FROM hymn_hymnals WHERE id = ?1',
      variables: [Variable<int>(id)],
      updates: {hymnHymnals},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> deleteHymnHymnals() {
    return customUpdate(
      'DELETE FROM hymn_hymnals',
      variables: [],
      updates: {hymnHymnals},
      updateKind: UpdateKind.delete,
    );
  }

  Selectable<Hymn> getHymnsByHymnalId(String hymnalId) {
    return customSelect(
        'SELECT h.* FROM hymns AS h WHERE EXISTS (SELECT hymnId FROM hymn_hymnals WHERE hymnId = h.id AND hymnalId = ?1)',
        variables: [
          Variable<String>(hymnalId)
        ],
        readsFrom: {
          hymns,
          hymnHymnals,
        }).asyncMap(hymns.mapFromRow);
  }

  Selectable<Hymnal> getHymnalsByHymnId(String hymnId) {
    return customSelect(
        'SELECT t.* FROM hymnals AS t WHERE EXISTS (SELECT hymnalId FROM hymn_hymnals WHERE hymnalId = t.id AND hymnId = ?1)',
        variables: [
          Variable<String>(hymnId)
        ],
        readsFrom: {
          hymnals,
          hymnHymnals,
        }).asyncMap(hymnals.mapFromRow);
  }

  Selectable<Hymnal> getHymnalByHymnId(String hymnId) {
    return customSelect(
        'SELECT t.* FROM hymnals AS t WHERE EXISTS (SELECT hymnalId FROM hymn_hymnals WHERE hymnalId = t.id AND hymnId = ?1)',
        variables: [
          Variable<String>(hymnId)
        ],
        readsFrom: {
          hymnals,
          hymnHymnals,
        }).asyncMap(hymnals.mapFromRow);
  }

  Selectable<SearchHymnalsResult> searchHymnals(String query) {
    return customSelect(
        'SELECT t.id, highlight(hymnals_fts, 0, \'<b>\', \'</b>\') AS name, highlight(hymnals_fts, 1, \'<b>\', \'</b>\') AS alias, t.created, t.updated FROM hymnals_fts INNER JOIN hymnals AS t ON t.id = hymnals_fts."ROWID" WHERE hymnals_fts MATCH ?1 ORDER BY rank',
        variables: [
          Variable<String>(query)
        ],
        readsFrom: {
          hymnals,
          hymnalsFts,
        }).map((QueryRow row) => SearchHymnalsResult(
          id: row.read<String>('id'),
          name: row.read<String>('name'),
          alias: row.read<String>('alias'),
          created: row.read<DateTime>('created'),
          updated: row.read<DateTime>('updated'),
        ));
  }

  Selectable<Hymnal> getHymnals() {
    return customSelect('SELECT * FROM hymnals ORDER BY name ASC',
        variables: [],
        readsFrom: {
          hymnals,
        }).asyncMap(hymnals.mapFromRow);
  }

  Selectable<Hymnal> getHymnal(String id) {
    return customSelect('SELECT * FROM hymnals WHERE id = ?1', variables: [
      Variable<String>(id)
    ], readsFrom: {
      hymnals,
    }).asyncMap(hymnals.mapFromRow);
  }

  Selectable<Hymnal> getHymnalByName(String name) {
    return customSelect('SELECT * FROM hymnals WHERE name = ?1', variables: [
      Variable<String>(name)
    ], readsFrom: {
      hymnals,
    }).asyncMap(hymnals.mapFromRow);
  }

  Selectable<Hymnal> getHymnalByAlias(String alias) {
    return customSelect('SELECT * FROM hymnals WHERE alias = ?1', variables: [
      Variable<String>(alias)
    ], readsFrom: {
      hymnals,
    }).asyncMap(hymnals.mapFromRow);
  }

  Future<List<Hymnal>> createHymnal(String id, String name, String alias,
      DateTime created, DateTime updated) {
    return customWriteReturning(
        'INSERT OR REPLACE INTO hymnals (id, name, alias, created, updated) VALUES (?1, ?2, ?3, ?4, ?5) RETURNING *',
        variables: [
          Variable<String>(id),
          Variable<String>(name),
          Variable<String>(alias),
          Variable<DateTime>(created),
          Variable<DateTime>(updated)
        ],
        updates: {
          hymnals
        }).then((rows) => Future.wait(rows.map(hymnals.mapFromRow)));
  }

  Future<int> updateHymnal(
      String name, String alias, DateTime updated, String id) {
    return customUpdate(
      'UPDATE hymnals SET name = ?1, alias = ?2, updated = ?3 WHERE id = ?4',
      variables: [
        Variable<String>(name),
        Variable<String>(alias),
        Variable<DateTime>(updated),
        Variable<String>(id)
      ],
      updates: {hymnals},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> deleteHymnal(String id) {
    return customUpdate(
      'DELETE FROM hymnals WHERE id = ?1',
      variables: [Variable<String>(id)],
      updates: {hymnals},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> deleteHymnalByName(String name) {
    return customUpdate(
      'DELETE FROM hymnals WHERE name = ?1',
      variables: [Variable<String>(name)],
      updates: {hymnals},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> deleteHymnalByAlias(String alias) {
    return customUpdate(
      'DELETE FROM hymnals WHERE alias = ?1',
      variables: [Variable<String>(alias)],
      updates: {hymnals},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> deleteHymnals() {
    return customUpdate(
      'DELETE FROM hymnals',
      variables: [],
      updates: {hymnals},
      updateKind: UpdateKind.delete,
    );
  }

  Selectable<HymnScripture> getHymnScriptures() {
    return customSelect('SELECT * FROM hymn_scriptures',
        variables: [],
        readsFrom: {
          hymnScriptures,
        }).asyncMap(hymnScriptures.mapFromRow);
  }

  Selectable<HymnScripture> getHymnScripture(int id) {
    return customSelect('SELECT * FROM hymn_scriptures WHERE id = ?1',
        variables: [
          Variable<int>(id)
        ],
        readsFrom: {
          hymnScriptures,
        }).asyncMap(hymnScriptures.mapFromRow);
  }

  Selectable<HymnScripture> getHymnScripturesByScriptureId(String scriptureId) {
    return customSelect('SELECT * FROM hymn_scriptures WHERE scriptureId = ?1',
        variables: [
          Variable<String>(scriptureId)
        ],
        readsFrom: {
          hymnScriptures,
        }).asyncMap(hymnScriptures.mapFromRow);
  }

  Selectable<HymnScripture> getHymnScripturesByHymnId(String hymnId) {
    return customSelect('SELECT * FROM hymn_scriptures WHERE hymnId = ?1',
        variables: [
          Variable<String>(hymnId)
        ],
        readsFrom: {
          hymnScriptures,
        }).asyncMap(hymnScriptures.mapFromRow);
  }

  Future<List<HymnScripture>> createHymnScripture(
      String scriptureId, String hymnId, DateTime created, DateTime updated) {
    return customWriteReturning(
        'INSERT OR REPLACE INTO hymn_scriptures (scriptureId, hymnId, created, updated) VALUES (?1, ?2, ?3, ?4) RETURNING *',
        variables: [
          Variable<String>(scriptureId),
          Variable<String>(hymnId),
          Variable<DateTime>(created),
          Variable<DateTime>(updated)
        ],
        updates: {
          hymnScriptures
        }).then((rows) => Future.wait(rows.map(hymnScriptures.mapFromRow)));
  }

  Future<int> updateHymnScripture(
      String scriptureId, String hymnId, DateTime updated, int id) {
    return customUpdate(
      'UPDATE hymn_scriptures SET scriptureId = ?1, hymnId = ?2, updated = ?3 WHERE id = ?4',
      variables: [
        Variable<String>(scriptureId),
        Variable<String>(hymnId),
        Variable<DateTime>(updated),
        Variable<int>(id)
      ],
      updates: {hymnScriptures},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> deleteHymnScripture(int id) {
    return customUpdate(
      'DELETE FROM hymn_scriptures WHERE id = ?1',
      variables: [Variable<int>(id)],
      updates: {hymnScriptures},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> deleteHymnScriptures() {
    return customUpdate(
      'DELETE FROM hymn_scriptures',
      variables: [],
      updates: {hymnScriptures},
      updateKind: UpdateKind.delete,
    );
  }

  Selectable<Hymn> getHymnsByScriptureId(String scriptureId) {
    return customSelect(
        'SELECT h.* FROM hymns AS h WHERE EXISTS (SELECT hymnId FROM hymn_scriptures WHERE hymnId = h.id AND scriptureId = ?1)',
        variables: [
          Variable<String>(scriptureId)
        ],
        readsFrom: {
          hymns,
          hymnScriptures,
        }).asyncMap(hymns.mapFromRow);
  }

  Selectable<Scripture> getScripturesByHymnId(String hymnId) {
    return customSelect(
        'SELECT t.* FROM scriptures AS t WHERE EXISTS (SELECT scriptureId FROM hymn_scriptures WHERE scriptureId = t.id AND hymnId = ?1)',
        variables: [
          Variable<String>(hymnId)
        ],
        readsFrom: {
          scriptures,
          hymnScriptures,
        }).asyncMap(scriptures.mapFromRow);
  }

  Selectable<SearchScripturesResult> searchScriptures(String query) {
    return customSelect(
        'SELECT t.id, highlight(scriptures_fts, 0, \'<b>\', \'</b>\') AS name, t.created, t.updated FROM scriptures_fts INNER JOIN scriptures AS t ON t.id = scriptures_fts."ROWID" WHERE scriptures_fts MATCH ?1 ORDER BY rank',
        variables: [
          Variable<String>(query)
        ],
        readsFrom: {
          scriptures,
          scripturesFts,
        }).map((QueryRow row) => SearchScripturesResult(
          id: row.read<String>('id'),
          name: row.read<String>('name'),
          created: row.read<DateTime>('created'),
          updated: row.read<DateTime>('updated'),
        ));
  }

  Selectable<Scripture> getScriptures() {
    return customSelect('SELECT * FROM scriptures ORDER BY name ASC',
        variables: [],
        readsFrom: {
          scriptures,
        }).asyncMap(scriptures.mapFromRow);
  }

  Selectable<Scripture> getScripture(String id) {
    return customSelect('SELECT * FROM scriptures WHERE id = ?1', variables: [
      Variable<String>(id)
    ], readsFrom: {
      scriptures,
    }).asyncMap(scriptures.mapFromRow);
  }

  Selectable<Scripture> getScriptureByName(String name) {
    return customSelect('SELECT * FROM scriptures WHERE name = ?1', variables: [
      Variable<String>(name)
    ], readsFrom: {
      scriptures,
    }).asyncMap(scriptures.mapFromRow);
  }

  Future<List<Scripture>> createScripture(
      String id, String name, DateTime created, DateTime updated) {
    return customWriteReturning(
        'INSERT OR REPLACE INTO scriptures (id, name, created, updated) VALUES (?1, ?2, ?3, ?4) RETURNING *',
        variables: [
          Variable<String>(id),
          Variable<String>(name),
          Variable<DateTime>(created),
          Variable<DateTime>(updated)
        ],
        updates: {
          scriptures
        }).then((rows) => Future.wait(rows.map(scriptures.mapFromRow)));
  }

  Future<int> updateScripture(String name, DateTime updated, String id) {
    return customUpdate(
      'UPDATE scriptures SET name = ?1, updated = ?2 WHERE id = ?3',
      variables: [
        Variable<String>(name),
        Variable<DateTime>(updated),
        Variable<String>(id)
      ],
      updates: {scriptures},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> deleteScripture(String id) {
    return customUpdate(
      'DELETE FROM scriptures WHERE id = ?1',
      variables: [Variable<String>(id)],
      updates: {scriptures},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> deleteScriptureByName(String name) {
    return customUpdate(
      'DELETE FROM scriptures WHERE name = ?1',
      variables: [Variable<String>(name)],
      updates: {scriptures},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> deleteScriptures() {
    return customUpdate(
      'DELETE FROM scriptures',
      variables: [],
      updates: {scriptures},
      updateKind: UpdateKind.delete,
    );
  }

  Selectable<HymnStakeholder> getHymnStakeholders() {
    return customSelect('SELECT * FROM hymn_stakeholders',
        variables: [],
        readsFrom: {
          hymnStakeholders,
        }).asyncMap(hymnStakeholders.mapFromRow);
  }

  Selectable<HymnStakeholder> getHymnStakeholder(int id) {
    return customSelect('SELECT * FROM hymn_stakeholders WHERE id = ?1',
        variables: [
          Variable<int>(id)
        ],
        readsFrom: {
          hymnStakeholders,
        }).asyncMap(hymnStakeholders.mapFromRow);
  }

  Selectable<HymnStakeholder> getHymnStakeholdersByStakeholderId(
      String stakeholderId) {
    return customSelect(
        'SELECT * FROM hymn_stakeholders WHERE stakeholderId = ?1',
        variables: [
          Variable<String>(stakeholderId)
        ],
        readsFrom: {
          hymnStakeholders,
        }).asyncMap(hymnStakeholders.mapFromRow);
  }

  Selectable<HymnStakeholder> getHymnStakeholdersByHymnId(String hymnId) {
    return customSelect('SELECT * FROM hymn_stakeholders WHERE hymnId = ?1',
        variables: [
          Variable<String>(hymnId)
        ],
        readsFrom: {
          hymnStakeholders,
        }).asyncMap(hymnStakeholders.mapFromRow);
  }

  Future<List<HymnStakeholder>> createHymnStakeholder(String stakeholderId,
      String hymnId, String relationship, DateTime created, DateTime updated) {
    return customWriteReturning(
        'INSERT OR REPLACE INTO hymn_stakeholders (stakeholderId, hymnId, relationship, created, updated) VALUES (?1, ?2, ?3, ?4, ?5) RETURNING *',
        variables: [
          Variable<String>(stakeholderId),
          Variable<String>(hymnId),
          Variable<String>(relationship),
          Variable<DateTime>(created),
          Variable<DateTime>(updated)
        ],
        updates: {
          hymnStakeholders
        }).then((rows) => Future.wait(rows.map(hymnStakeholders.mapFromRow)));
  }

  Future<int> updateHymnStakeholder(String stakeholderId, String hymnId,
      String relationship, DateTime updated, int id) {
    return customUpdate(
      'UPDATE hymn_stakeholders SET stakeholderId = ?1, hymnId = ?2, relationship = ?3, updated = ?4 WHERE id = ?5',
      variables: [
        Variable<String>(stakeholderId),
        Variable<String>(hymnId),
        Variable<String>(relationship),
        Variable<DateTime>(updated),
        Variable<int>(id)
      ],
      updates: {hymnStakeholders},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> deleteHymnStakeholder(int id) {
    return customUpdate(
      'DELETE FROM hymn_stakeholders WHERE id = ?1',
      variables: [Variable<int>(id)],
      updates: {hymnStakeholders},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> deleteHymnStakeholders() {
    return customUpdate(
      'DELETE FROM hymn_stakeholders',
      variables: [],
      updates: {hymnStakeholders},
      updateKind: UpdateKind.delete,
    );
  }

  Selectable<Hymn> getHymnsByStakeholderId(String stakeholderId) {
    return customSelect(
        'SELECT h.* FROM hymns AS h WHERE EXISTS (SELECT hymnId FROM hymn_stakeholders WHERE hymnId = h.id AND stakeholderId = ?1)',
        variables: [
          Variable<String>(stakeholderId)
        ],
        readsFrom: {
          hymns,
          hymnStakeholders,
        }).asyncMap(hymns.mapFromRow);
  }

  Selectable<Stakeholder> getStakeholdersByHymnId(String hymnId) {
    return customSelect(
        'SELECT t.* FROM stakeholders AS t WHERE EXISTS (SELECT stakeholderId FROM hymn_stakeholders WHERE stakeholderId = t.id AND hymnId = ?1)',
        variables: [
          Variable<String>(hymnId)
        ],
        readsFrom: {
          stakeholders,
          hymnStakeholders,
        }).asyncMap(stakeholders.mapFromRow);
  }

  Selectable<GetStakeholdersWithRelationshipForHymnIdResult>
      getStakeholdersWithRelationshipForHymnId(String hymnId) {
    return customSelect(
        'SELECT s.*, ht.relationship FROM stakeholders AS s INNER JOIN hymn_stakeholders AS ht ON ht.stakeholderId = s.id WHERE hymnId = ?1',
        variables: [
          Variable<String>(hymnId)
        ],
        readsFrom: {
          hymnStakeholders,
          stakeholders,
        }).map((QueryRow row) => GetStakeholdersWithRelationshipForHymnIdResult(
          id: row.read<String>('id'),
          name: row.read<String>('name'),
          created: row.read<DateTime>('created'),
          updated: row.read<DateTime>('updated'),
          relationship: row.read<String>('relationship'),
        ));
  }

  Selectable<HymnStakeholder> getHymnsStakeholdersForStakeholder(
      String stakeholderId) {
    return customSelect(
        'SELECT * FROM hymn_stakeholders WHERE stakeholderId = ?1',
        variables: [
          Variable<String>(stakeholderId)
        ],
        readsFrom: {
          hymnStakeholders,
        }).asyncMap(hymnStakeholders.mapFromRow);
  }

  Selectable<Stakeholder> getStakeholdersByRelationship(String relationship) {
    return customSelect(
        'SELECT s.* FROM stakeholders AS s INNER JOIN hymn_stakeholders AS ht ON ht.stakeholderId = s.id WHERE relationship = ?1',
        variables: [
          Variable<String>(relationship)
        ],
        readsFrom: {
          stakeholders,
          hymnStakeholders,
        }).asyncMap(stakeholders.mapFromRow);
  }

  Selectable<SearchStakeholdersResult> searchStakeholders(String query) {
    return customSelect(
        'SELECT t.id, highlight(stakeholders_fts, 0, \'<b>\', \'</b>\') AS name, t.created, t.updated FROM stakeholders_fts INNER JOIN stakeholders AS t ON t.id = stakeholders_fts."ROWID" WHERE stakeholders_fts MATCH ?1 ORDER BY rank',
        variables: [
          Variable<String>(query)
        ],
        readsFrom: {
          stakeholders,
          stakeholdersFts,
        }).map((QueryRow row) => SearchStakeholdersResult(
          id: row.read<String>('id'),
          name: row.read<String>('name'),
          created: row.read<DateTime>('created'),
          updated: row.read<DateTime>('updated'),
        ));
  }

  Selectable<Stakeholder> getStakeholders() {
    return customSelect('SELECT * FROM stakeholders ORDER BY name ASC',
        variables: [],
        readsFrom: {
          stakeholders,
        }).asyncMap(stakeholders.mapFromRow);
  }

  Selectable<Stakeholder> getStakeholder(String id) {
    return customSelect('SELECT * FROM stakeholders WHERE id = ?1', variables: [
      Variable<String>(id)
    ], readsFrom: {
      stakeholders,
    }).asyncMap(stakeholders.mapFromRow);
  }

  Selectable<Stakeholder> getStakeholderByName(String name) {
    return customSelect('SELECT * FROM stakeholders WHERE name = ?1',
        variables: [
          Variable<String>(name)
        ],
        readsFrom: {
          stakeholders,
        }).asyncMap(stakeholders.mapFromRow);
  }

  Future<List<Stakeholder>> createStakeholder(
      String id, String name, DateTime created, DateTime updated) {
    return customWriteReturning(
        'INSERT OR REPLACE INTO stakeholders (id, name, created, updated) VALUES (?1, ?2, ?3, ?4) RETURNING *',
        variables: [
          Variable<String>(id),
          Variable<String>(name),
          Variable<DateTime>(created),
          Variable<DateTime>(updated)
        ],
        updates: {
          stakeholders
        }).then((rows) => Future.wait(rows.map(stakeholders.mapFromRow)));
  }

  Future<int> updateStakeholder(String name, DateTime updated, String id) {
    return customUpdate(
      'UPDATE stakeholders SET name = ?1, updated = ?2 WHERE id = ?3',
      variables: [
        Variable<String>(name),
        Variable<DateTime>(updated),
        Variable<String>(id)
      ],
      updates: {stakeholders},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> deleteStakeholder(String id) {
    return customUpdate(
      'DELETE FROM stakeholders WHERE id = ?1',
      variables: [Variable<String>(id)],
      updates: {stakeholders},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> deleteStakeholderByName(String name) {
    return customUpdate(
      'DELETE FROM stakeholders WHERE name = ?1',
      variables: [Variable<String>(name)],
      updates: {stakeholders},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> deleteStakeholders() {
    return customUpdate(
      'DELETE FROM stakeholders',
      variables: [],
      updates: {stakeholders},
      updateKind: UpdateKind.delete,
    );
  }

  Selectable<HymnTopic> getHymnTopics() {
    return customSelect('SELECT * FROM hymn_topics', variables: [], readsFrom: {
      hymnTopics,
    }).asyncMap(hymnTopics.mapFromRow);
  }

  Selectable<HymnTopic> getHymnTopic(int id) {
    return customSelect('SELECT * FROM hymn_topics WHERE id = ?1', variables: [
      Variable<int>(id)
    ], readsFrom: {
      hymnTopics,
    }).asyncMap(hymnTopics.mapFromRow);
  }

  Selectable<HymnTopic> getHymnTopicsByTopicId(String topicId) {
    return customSelect('SELECT * FROM hymn_topics WHERE topicId = ?1',
        variables: [
          Variable<String>(topicId)
        ],
        readsFrom: {
          hymnTopics,
        }).asyncMap(hymnTopics.mapFromRow);
  }

  Selectable<HymnTopic> getHymnTopicsByHymnId(String hymnId) {
    return customSelect('SELECT * FROM hymn_topics WHERE hymnId = ?1',
        variables: [
          Variable<String>(hymnId)
        ],
        readsFrom: {
          hymnTopics,
        }).asyncMap(hymnTopics.mapFromRow);
  }

  Future<List<HymnTopic>> createHymnTopic(
      String topicId, String hymnId, DateTime created, DateTime updated) {
    return customWriteReturning(
        'INSERT OR REPLACE INTO hymn_topics (topicId, hymnId, created, updated) VALUES (?1, ?2, ?3, ?4) RETURNING *',
        variables: [
          Variable<String>(topicId),
          Variable<String>(hymnId),
          Variable<DateTime>(created),
          Variable<DateTime>(updated)
        ],
        updates: {
          hymnTopics
        }).then((rows) => Future.wait(rows.map(hymnTopics.mapFromRow)));
  }

  Future<int> updateHymnTopic(
      String topicId, String hymnId, DateTime updated, int id) {
    return customUpdate(
      'UPDATE hymn_topics SET topicId = ?1, hymnId = ?2, updated = ?3 WHERE id = ?4',
      variables: [
        Variable<String>(topicId),
        Variable<String>(hymnId),
        Variable<DateTime>(updated),
        Variable<int>(id)
      ],
      updates: {hymnTopics},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> deleteHymnTopic(int id) {
    return customUpdate(
      'DELETE FROM hymn_topics WHERE id = ?1',
      variables: [Variable<int>(id)],
      updates: {hymnTopics},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> deleteHymnTopics() {
    return customUpdate(
      'DELETE FROM hymn_topics',
      variables: [],
      updates: {hymnTopics},
      updateKind: UpdateKind.delete,
    );
  }

  Selectable<Hymn> getHymnsByTopicId(String topicId) {
    return customSelect(
        'SELECT h.* FROM hymns AS h WHERE EXISTS (SELECT hymnId FROM hymn_topics WHERE hymnId = h.id AND topicId = ?1)',
        variables: [
          Variable<String>(topicId)
        ],
        readsFrom: {
          hymns,
          hymnTopics,
        }).asyncMap(hymns.mapFromRow);
  }

  Selectable<Topic> getTopicsByHymnId(String hymnId) {
    return customSelect(
        'SELECT t.* FROM topics AS t WHERE EXISTS (SELECT topicId FROM hymn_topics WHERE topicId = t.id AND hymnId = ?1)',
        variables: [
          Variable<String>(hymnId)
        ],
        readsFrom: {
          topics,
          hymnTopics,
        }).asyncMap(topics.mapFromRow);
  }

  Selectable<SearchTopicsResult> searchTopics(String query) {
    return customSelect(
        'SELECT t.id, highlight(topics_fts, 0, \'<b>\', \'</b>\') AS name, t.created, t.updated FROM topics_fts INNER JOIN topics AS t ON t.id = topics_fts."ROWID" WHERE topics_fts MATCH ?1 ORDER BY rank',
        variables: [
          Variable<String>(query)
        ],
        readsFrom: {
          topics,
          topicsFts,
        }).map((QueryRow row) => SearchTopicsResult(
          id: row.read<String>('id'),
          name: row.read<String>('name'),
          created: row.read<DateTime>('created'),
          updated: row.read<DateTime>('updated'),
        ));
  }

  Selectable<Topic> getTopics() {
    return customSelect('SELECT * FROM topics ORDER BY name ASC',
        variables: [],
        readsFrom: {
          topics,
        }).asyncMap(topics.mapFromRow);
  }

  Selectable<Topic> getTopic(String id) {
    return customSelect('SELECT * FROM topics WHERE id = ?1', variables: [
      Variable<String>(id)
    ], readsFrom: {
      topics,
    }).asyncMap(topics.mapFromRow);
  }

  Selectable<Topic> getTopicByName(String name) {
    return customSelect('SELECT * FROM topics WHERE name = ?1', variables: [
      Variable<String>(name)
    ], readsFrom: {
      topics,
    }).asyncMap(topics.mapFromRow);
  }

  Future<List<Topic>> createTopic(
      String id, String name, DateTime created, DateTime updated) {
    return customWriteReturning(
        'INSERT OR REPLACE INTO topics (id, name, created, updated) VALUES (?1, ?2, ?3, ?4) RETURNING *',
        variables: [
          Variable<String>(id),
          Variable<String>(name),
          Variable<DateTime>(created),
          Variable<DateTime>(updated)
        ],
        updates: {
          topics
        }).then((rows) => Future.wait(rows.map(topics.mapFromRow)));
  }

  Future<int> updateTopic(String name, DateTime updated, String id) {
    return customUpdate(
      'UPDATE topics SET name = ?1, updated = ?2 WHERE id = ?3',
      variables: [
        Variable<String>(name),
        Variable<DateTime>(updated),
        Variable<String>(id)
      ],
      updates: {topics},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> deleteTopic(String id) {
    return customUpdate(
      'DELETE FROM topics WHERE id = ?1',
      variables: [Variable<String>(id)],
      updates: {topics},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> deleteTopicByName(String name) {
    return customUpdate(
      'DELETE FROM topics WHERE name = ?1',
      variables: [Variable<String>(name)],
      updates: {topics},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> deleteTopics() {
    return customUpdate(
      'DELETE FROM topics',
      variables: [],
      updates: {topics},
      updateKind: UpdateKind.delete,
    );
  }

  Selectable<SearchHymnsResult> searchHymns(String query) {
    return customSelect(
        'SELECT t.id, highlight(hymns_fts, 0, \'<b>\', \'</b>\') AS title, highlight(hymns_fts, 1, \'<b>\', \'</b>\') AS number, highlight(hymns_fts, 2, \'<b>\', \'</b>\') AS tuneName, highlight(hymns_fts, 3, \'<b>\', \'</b>\') AS startingKey, highlight(hymns_fts, 4, \'<b>\', \'</b>\') AS beatPattern, highlight(hymns_fts, 5, \'<b>\', \'</b>\') AS startingPitch, highlight(hymns_fts, 6, \'<b>\', \'</b>\') AS startingBeat, highlight(hymns_fts, 7, \'<b>\', \'</b>\') AS startingPitchDirection, highlight(hymns_fts, 8, \'<b>\', \'</b>\') AS timeSignature, highlight(hymns_fts, 9, \'<b>\', \'</b>\') AS complexTimeSignature, t.created, t.updated FROM hymns_fts INNER JOIN hymns AS t ON t.id = hymns_fts."ROWID" WHERE hymns_fts MATCH ?1 ORDER BY rank',
        variables: [
          Variable<String>(query)
        ],
        readsFrom: {
          hymns,
          hymnsFts,
        }).map((QueryRow row) => SearchHymnsResult(
          id: row.read<String>('id'),
          title: row.read<String>('title'),
          number: row.read<String>('number'),
          tuneName: row.read<String>('tuneName'),
          startingKey: row.read<String>('startingKey'),
          beatPattern: row.read<String>('beatPattern'),
          startingPitch: row.read<String>('startingPitch'),
          startingBeat: row.read<String>('startingBeat'),
          startingPitchDirection: row.read<String>('startingPitchDirection'),
          timeSignature: row.read<String>('timeSignature'),
          complexTimeSignature: row.read<String>('complexTimeSignature'),
          created: row.read<DateTime>('created'),
          updated: row.read<DateTime>('updated'),
        ));
  }

  Selectable<Hymn> getHymns() {
    return customSelect('SELECT * FROM hymns ORDER BY number ASC',
        variables: [],
        readsFrom: {
          hymns,
        }).asyncMap(hymns.mapFromRow);
  }

  Selectable<Hymn> getHymn(String id) {
    return customSelect('SELECT * FROM hymns WHERE id = ?1', variables: [
      Variable<String>(id)
    ], readsFrom: {
      hymns,
    }).asyncMap(hymns.mapFromRow);
  }

  Selectable<Hymn> getHymnByTitle(String title) {
    return customSelect('SELECT * FROM hymns WHERE title = ?1', variables: [
      Variable<String>(title)
    ], readsFrom: {
      hymns,
    }).asyncMap(hymns.mapFromRow);
  }

  Selectable<Hymn> getHymnByNumber(String number) {
    return customSelect('SELECT * FROM hymns WHERE number = ?1', variables: [
      Variable<String>(number)
    ], readsFrom: {
      hymns,
    }).asyncMap(hymns.mapFromRow);
  }

  Selectable<Hymn> getHymnByTitleAndNumber(String title, String number) {
    return customSelect('SELECT * FROM hymns WHERE title = ?1 AND number = ?2',
        variables: [
          Variable<String>(title),
          Variable<String>(number)
        ],
        readsFrom: {
          hymns,
        }).asyncMap(hymns.mapFromRow);
  }

  Future<List<Hymn>> createHymn(
      String id,
      String title,
      String number,
      String? tuneName,
      String? startingKey,
      String? beatPattern,
      String? startingPitch,
      String? startingBeat,
      String? startingPitchDirection,
      String? timeSignature,
      String? complexTimeSignature,
      DateTime created,
      DateTime updated) {
    return customWriteReturning(
        'INSERT OR REPLACE INTO hymns (id, title, number, tuneName, startingKey, beatPattern, startingPitch, startingBeat, startingPitchDirection, timeSignature, complexTimeSignature, created, updated) VALUES (?1, ?2, ?3, ?4, ?5, ?6, ?7, ?8, ?9, ?10, ?11, ?12, ?13) RETURNING *',
        variables: [
          Variable<String>(id),
          Variable<String>(title),
          Variable<String>(number),
          Variable<String>(tuneName),
          Variable<String>(startingKey),
          Variable<String>(beatPattern),
          Variable<String>(startingPitch),
          Variable<String>(startingBeat),
          Variable<String>(startingPitchDirection),
          Variable<String>(timeSignature),
          Variable<String>(complexTimeSignature),
          Variable<DateTime>(created),
          Variable<DateTime>(updated)
        ],
        updates: {
          hymns
        }).then((rows) => Future.wait(rows.map(hymns.mapFromRow)));
  }

  Future<int> updateHymn(
      String title,
      String number,
      String? tuneName,
      String? startingKey,
      String? beatPattern,
      String? startingPitch,
      String? startingBeat,
      String? startingPitchDirection,
      String? timeSignature,
      String? complexTimeSignature,
      DateTime updated,
      String id) {
    return customUpdate(
      'UPDATE hymns SET title = ?1, number = ?2, tuneName = ?3, startingKey = ?4, beatPattern = ?5, startingPitch = ?6, startingBeat = ?7, startingPitchDirection = ?8, timeSignature = ?9, complexTimeSignature = ?10, updated = ?11 WHERE id = ?12',
      variables: [
        Variable<String>(title),
        Variable<String>(number),
        Variable<String>(tuneName),
        Variable<String>(startingKey),
        Variable<String>(beatPattern),
        Variable<String>(startingPitch),
        Variable<String>(startingBeat),
        Variable<String>(startingPitchDirection),
        Variable<String>(timeSignature),
        Variable<String>(complexTimeSignature),
        Variable<DateTime>(updated),
        Variable<String>(id)
      ],
      updates: {hymns},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> deleteHymn(String id) {
    return customUpdate(
      'DELETE FROM hymns WHERE id = ?1',
      variables: [Variable<String>(id)],
      updates: {hymns},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> deleteHymns() {
    return customUpdate(
      'DELETE FROM hymns',
      variables: [],
      updates: {hymns},
      updateKind: UpdateKind.delete,
    );
  }

  Selectable<SearchHymnRowsResult> searchHymnRows(String query) {
    return customSelect(
        'SELECT h.*, (SELECT GROUP_CONCAT(name, \',\') FROM (SELECT DISTINCT t.name FROM topics AS t WHERE EXISTS (SELECT ht.hymnId FROM hymn_topics AS ht WHERE ht.topicId = t.id AND ht.hymnId = h.id))) AS topics, (SELECT GROUP_CONCAT(name, \',\') FROM (SELECT DISTINCT s.name FROM scriptures AS s WHERE EXISTS (SELECT hs.hymnId FROM hymn_scriptures AS hs WHERE hs.scriptureId = s.id AND hs.hymnId = h.id))) AS scriptures, (SELECT GROUP_CONCAT(name, \',\') FROM (SELECT DISTINCT p.name FROM portions AS p WHERE EXISTS (SELECT hp.hymnId FROM hymn_portions AS hp WHERE hp.portionId = p.id AND hp.hymnId = h.id))) AS portions, (SELECT GROUP_CONCAT(name, \',\') FROM (SELECT DISTINCT hy.name FROM hymnals AS hy WHERE EXISTS (SELECT hh.hymnId FROM hymn_hymnals AS hh WHERE hh.hymnalId = hy.id AND hh.hymnId = h.id))) AS hymnals FROM hymns AS h INNER JOIN hymns_fts ON h.id = hymns_fts."rowid" WHERE hymns_fts MATCH ?1 ORDER BY rank',
        variables: [
          Variable<String>(query)
        ],
        readsFrom: {
          topics,
          hymnTopics,
          hymns,
          scriptures,
          hymnScriptures,
          portions,
          hymnPortions,
          hymnals,
          hymnHymnals,
          hymnsFts,
        }).map((QueryRow row) => SearchHymnRowsResult(
          id: row.read<String>('id'),
          title: row.read<String>('title'),
          number: row.read<String>('number'),
          tuneName: row.readNullable<String>('tuneName'),
          startingKey: row.readNullable<String>('startingKey'),
          beatPattern: row.readNullable<String>('beatPattern'),
          startingPitch: row.readNullable<String>('startingPitch'),
          startingBeat: row.readNullable<String>('startingBeat'),
          startingPitchDirection:
              row.readNullable<String>('startingPitchDirection'),
          timeSignature: row.readNullable<String>('timeSignature'),
          complexTimeSignature:
              row.readNullable<String>('complexTimeSignature'),
          created: row.read<DateTime>('created'),
          updated: row.read<DateTime>('updated'),
          topics: row.readNullable<String>('topics'),
          scriptures: row.readNullable<String>('scriptures'),
          portions: row.readNullable<String>('portions'),
          hymnals: row.readNullable<String>('hymnals'),
        ));
  }

  Selectable<GetHymnRowsResult> getHymnRows() {
    return customSelect(
        'SELECT h.*, (SELECT GROUP_CONCAT(name, \',\') FROM (SELECT DISTINCT t.name FROM topics AS t WHERE EXISTS (SELECT ht.hymnId FROM hymn_topics AS ht WHERE ht.topicId = t.id AND ht.hymnId = h.id))) AS topics, (SELECT GROUP_CONCAT(name, \',\') FROM (SELECT DISTINCT s.name FROM scriptures AS s WHERE EXISTS (SELECT hs.hymnId FROM hymn_scriptures AS hs WHERE hs.scriptureId = s.id AND hs.hymnId = h.id))) AS scriptures, (SELECT GROUP_CONCAT(name, \',\') FROM (SELECT DISTINCT p.name FROM portions AS p WHERE EXISTS (SELECT hp.hymnId FROM hymn_portions AS hp WHERE hp.portionId = p.id AND hp.hymnId = h.id))) AS portions, (SELECT GROUP_CONCAT(name, \',\') FROM (SELECT DISTINCT hy.name FROM hymnals AS hy WHERE EXISTS (SELECT hh.hymnId FROM hymn_hymnals AS hh WHERE hh.hymnalId = hy.id AND hh.hymnId = h.id))) AS hymnals FROM hymns AS h',
        variables: [],
        readsFrom: {
          topics,
          hymnTopics,
          hymns,
          scriptures,
          hymnScriptures,
          portions,
          hymnPortions,
          hymnals,
          hymnHymnals,
        }).map((QueryRow row) => GetHymnRowsResult(
          id: row.read<String>('id'),
          title: row.read<String>('title'),
          number: row.read<String>('number'),
          tuneName: row.readNullable<String>('tuneName'),
          startingKey: row.readNullable<String>('startingKey'),
          beatPattern: row.readNullable<String>('beatPattern'),
          startingPitch: row.readNullable<String>('startingPitch'),
          startingBeat: row.readNullable<String>('startingBeat'),
          startingPitchDirection:
              row.readNullable<String>('startingPitchDirection'),
          timeSignature: row.readNullable<String>('timeSignature'),
          complexTimeSignature:
              row.readNullable<String>('complexTimeSignature'),
          created: row.read<DateTime>('created'),
          updated: row.read<DateTime>('updated'),
          topics: row.readNullable<String>('topics'),
          scriptures: row.readNullable<String>('scriptures'),
          portions: row.readNullable<String>('portions'),
          hymnals: row.readNullable<String>('hymnals'),
        ));
  }

  Selectable<Bundle> getBundles() {
    return customSelect('SELECT * FROM bundles', variables: [], readsFrom: {
      bundles,
    }).asyncMap(bundles.mapFromRow);
  }

  Selectable<GetBundlesHashesResult> getBundlesHashes() {
    return customSelect(
        'SELECT b.id AS bundle_id, b.hash AS bundle_hash, b.created AS bundle_created, b.updated AS bundle_updated,"hymn"."id" AS "nested_0.id", "hymn"."title" AS "nested_0.title", "hymn"."number" AS "nested_0.number", "hymn"."tuneName" AS "nested_0.tuneName", "hymn"."startingKey" AS "nested_0.startingKey", "hymn"."beatPattern" AS "nested_0.beatPattern", "hymn"."startingPitch" AS "nested_0.startingPitch", "hymn"."startingBeat" AS "nested_0.startingBeat", "hymn"."startingPitchDirection" AS "nested_0.startingPitchDirection", "hymn"."timeSignature" AS "nested_0.timeSignature", "hymn"."complexTimeSignature" AS "nested_0.complexTimeSignature", "hymn"."created" AS "nested_0.created", "hymn"."updated" AS "nested_0.updated" FROM hymns AS hymn LEFT JOIN bundles AS b ON hymn.id = b.hymnId',
        variables: [],
        readsFrom: {
          bundles,
          hymns,
        }).asyncMap((QueryRow row) async => GetBundlesHashesResult(
          bundleId: row.readNullable<int>('bundle_id'),
          bundleHash: row.readNullable<String>('bundle_hash'),
          bundleCreated: row.readNullable<DateTime>('bundle_created'),
          bundleUpdated: row.readNullable<DateTime>('bundle_updated'),
          hymn: await hymns.mapFromRow(row, tablePrefix: 'nested_0'),
        ));
  }

  Selectable<Bundle> getBundle(int id) {
    return customSelect('SELECT * FROM bundles WHERE id = ?1', variables: [
      Variable<int>(id)
    ], readsFrom: {
      bundles,
    }).asyncMap(bundles.mapFromRow);
  }

  Selectable<Bundle> getBundlesByHymnId(String hymnId) {
    return customSelect('SELECT * FROM bundles WHERE hymnId = ?1', variables: [
      Variable<String>(hymnId)
    ], readsFrom: {
      bundles,
    }).asyncMap(bundles.mapFromRow);
  }

  Selectable<Bundle> getBundleByHash(String hash) {
    return customSelect('SELECT * FROM bundles WHERE hash = ?1', variables: [
      Variable<String>(hash)
    ], readsFrom: {
      bundles,
    }).asyncMap(bundles.mapFromRow);
  }

  Future<List<Bundle>> createBundle(String hymnId, String hash,
      Uint8List? bytes, DateTime created, DateTime updated) {
    return customWriteReturning(
        'INSERT OR REPLACE INTO bundles (hymnId, hash, bytes, created, updated) VALUES (?1, ?2, ?3, ?4, ?5) RETURNING *',
        variables: [
          Variable<String>(hymnId),
          Variable<String>(hash),
          Variable<Uint8List>(bytes),
          Variable<DateTime>(created),
          Variable<DateTime>(updated)
        ],
        updates: {
          bundles
        }).then((rows) => Future.wait(rows.map(bundles.mapFromRow)));
  }

  Future<List<Bundle>> createNamedBundle(
      String hymnId,
      String hash,
      String? file,
      String? hymnTitle,
      String? hymnNumber,
      Uint8List? bytes,
      DateTime created,
      DateTime updated) {
    return customWriteReturning(
        'INSERT OR REPLACE INTO bundles (hymnId, hash, file, hymn_title, hymn_number, bytes, created, updated) VALUES (?1, ?2, ?3, ?4, ?5, ?6, ?7, ?8) RETURNING *',
        variables: [
          Variable<String>(hymnId),
          Variable<String>(hash),
          Variable<String>(file),
          Variable<String>(hymnTitle),
          Variable<String>(hymnNumber),
          Variable<Uint8List>(bytes),
          Variable<DateTime>(created),
          Variable<DateTime>(updated)
        ],
        updates: {
          bundles
        }).then((rows) => Future.wait(rows.map(bundles.mapFromRow)));
  }

  Future<int> updateBundle(
      String hymnId, String hash, Uint8List? bytes, DateTime updated, int id) {
    return customUpdate(
      'UPDATE bundles SET hymnId = ?1, hash = ?2, bytes = ?3, updated = ?4 WHERE id = ?5',
      variables: [
        Variable<String>(hymnId),
        Variable<String>(hash),
        Variable<Uint8List>(bytes),
        Variable<DateTime>(updated),
        Variable<int>(id)
      ],
      updates: {bundles},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> deleteBundle(int id) {
    return customUpdate(
      'DELETE FROM bundles WHERE id = ?1',
      variables: [Variable<int>(id)],
      updates: {bundles},
      updateKind: UpdateKind.delete,
    );
  }

  Selectable<Record> getRecordModels() {
    return customSelect('SELECT * FROM records', variables: [], readsFrom: {
      records,
    }).asyncMap(records.mapFromRow);
  }

  Selectable<Record> getRecordModel(String id) {
    return customSelect('SELECT * FROM records WHERE id = ?1', variables: [
      Variable<String>(id)
    ], readsFrom: {
      records,
    }).asyncMap(records.mapFromRow);
  }

  Selectable<Record> getRecordModelsByCollectionId(String collectionId) {
    return customSelect('SELECT * FROM records WHERE collection_id = ?1',
        variables: [
          Variable<String>(collectionId)
        ],
        readsFrom: {
          records,
        }).asyncMap(records.mapFromRow);
  }

  Selectable<Record> getRecordModelByCollectionId(
      String collectionId, String id) {
    return customSelect(
        'SELECT * FROM records WHERE collection_id = ?1 AND id = ?2',
        variables: [
          Variable<String>(collectionId),
          Variable<String>(id)
        ],
        readsFrom: {
          records,
        }).asyncMap(records.mapFromRow);
  }

  Selectable<Record> getRecordModelsByCollectionName(String collectionName) {
    return customSelect('SELECT * FROM records WHERE collection_name = ?1',
        variables: [
          Variable<String>(collectionName)
        ],
        readsFrom: {
          records,
        }).asyncMap(records.mapFromRow);
  }

  Selectable<Record> getRecordModelByCollectionName(
      String collectionName, String id) {
    return customSelect(
        'SELECT * FROM records WHERE collection_name = ?1 AND id = ?2',
        variables: [
          Variable<String>(collectionName),
          Variable<String>(id)
        ],
        readsFrom: {
          records,
        }).asyncMap(records.mapFromRow);
  }

  Future<int> createRecordModel(
      String id,
      String collectionId,
      String collectionName,
      String data,
      bool deleted,
      bool synced,
      DateTime created,
      DateTime updated) {
    return customInsert(
      'INSERT OR REPLACE INTO records (id, collection_id, collection_name, data, deleted, synced, created, updated) VALUES (?1, ?2, ?3, ?4, ?5, ?6, ?7, ?8)',
      variables: [
        Variable<String>(id),
        Variable<String>(collectionId),
        Variable<String>(collectionName),
        Variable<String>(data),
        Variable<bool>(deleted),
        Variable<bool>(synced),
        Variable<DateTime>(created),
        Variable<DateTime>(updated)
      ],
      updates: {records},
    );
  }

  Future<int> updateRecordModel(
      String data, bool deleted, bool synced, DateTime updated, String id) {
    return customUpdate(
      'UPDATE records SET data = ?1, deleted = ?2, synced = ?3, updated = ?4 WHERE id = ?5',
      variables: [
        Variable<String>(data),
        Variable<bool>(deleted),
        Variable<bool>(synced),
        Variable<DateTime>(updated),
        Variable<String>(id)
      ],
      updates: {records},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> deleteRecordModel(String id) {
    return customUpdate(
      'DELETE FROM records WHERE id = ?1',
      variables: [Variable<String>(id)],
      updates: {records},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> softDeleteRecordModel(DateTime updated, String id) {
    return customUpdate(
      'UPDATE records SET deleted = 1, updated = ?1 WHERE id = ?2',
      variables: [Variable<DateTime>(updated), Variable<String>(id)],
      updates: {records},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> setSyncStatusRecordModel(
      bool synced, DateTime updated, String id) {
    return customUpdate(
      'UPDATE records SET synced = ?1, updated = ?2 WHERE id = ?3',
      variables: [
        Variable<bool>(synced),
        Variable<DateTime>(updated),
        Variable<String>(id)
      ],
      updates: {records},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> setDeleteStatusRecordModel(
      bool deleted, DateTime updated, String id) {
    return customUpdate(
      'UPDATE records SET deleted = ?1, updated = ?2 WHERE id = ?3',
      variables: [
        Variable<bool>(deleted),
        Variable<DateTime>(updated),
        Variable<String>(id)
      ],
      updates: {records},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> deleteRecordModelByCollectionId(String collectionId) {
    return customUpdate(
      'DELETE FROM records WHERE collection_id = ?1',
      variables: [Variable<String>(collectionId)],
      updates: {records},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> deleteRecordModelByCollectionName(String collectionName) {
    return customUpdate(
      'DELETE FROM records WHERE collection_name = ?1',
      variables: [Variable<String>(collectionName)],
      updates: {records},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> deleteRecordModelByCollectionIdAndId(
      String collectionId, String id) {
    return customUpdate(
      'DELETE FROM records WHERE collection_id = ?1 AND id = ?2',
      variables: [Variable<String>(collectionId), Variable<String>(id)],
      updates: {records},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> deleteRecordModelByCollectionNameAndId(
      String collectionName, String id) {
    return customUpdate(
      'DELETE FROM records WHERE collection_name = ?1 AND id = ?2',
      variables: [Variable<String>(collectionName), Variable<String>(id)],
      updates: {records},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> deleteAllRecordModels() {
    return customUpdate(
      'DELETE FROM records',
      variables: [],
      updates: {records},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> deleteRecordModelsByCollectionNameBeforeDate(
      String collectionName, DateTime date) {
    return customUpdate(
      'DELETE FROM records WHERE collection_name = ?1 AND updated < ?2',
      variables: [Variable<String>(collectionName), Variable<DateTime>(date)],
      updates: {records},
      updateKind: UpdateKind.delete,
    );
  }

  Selectable<RecordsCacheData> getCollectionNameSyncedStatus(
      String collectionName) {
    return customSelect(
        'SELECT * FROM records_cache WHERE collection_name = ?1',
        variables: [
          Variable<String>(collectionName)
        ],
        readsFrom: {
          recordsCache,
        }).asyncMap(recordsCache.mapFromRow);
  }

  Future<int> setCollectionSyncedStatus(
      String collectionName, bool synced, DateTime created, DateTime updated) {
    return customInsert(
      'INSERT OR REPLACE INTO records_cache (collection_name, synced, created, updated) VALUES (?1, ?2, ?3, ?4)',
      variables: [
        Variable<String>(collectionName),
        Variable<bool>(synced),
        Variable<DateTime>(created),
        Variable<DateTime>(updated)
      ],
      updates: {recordsCache},
    );
  }

  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        users,
        requestCache,
        offlineQueue,
        offlineQueueFiles,
        offlineQueueDeleteTrigger,
        offlineQueueUsersDeleteTrigger,
        records,
        userRecords,
        analytics,
        userPurchases,
        userLibrary,
        userHymnLibrary,
        userStakeholderLibrary,
        userTopicLibrary,
        userPlaylistLibrary,
        localPlaylistItems,
        playlistItems,
        publicPlaylistItems,
        localPlaylists,
        playlists,
        publicPlaylists,
        playlistsFts,
        publicPlaylistsFts,
        hymnPortions,
        hymnPortionsIdxHymnId,
        hymnPortionsIdxPortionId,
        hymns,
        hymnPortionsDeleteHymn,
        portions,
        hymnPortionsDeletePortion,
        portionsIdxName,
        portionsIdxLyrics,
        portionsIdxHymnPortionId,
        portionsFts,
        portionsFtsInsert,
        portionsFtsUpdate,
        portionsFtsDelete,
        hymnHymnals,
        hymnHymnalsIdxHymnId,
        hymnHymnalsIdxHymnalId,
        hymnHymnalsDeleteHymn,
        hymnals,
        hymnHymnalsDeleteHymnal,
        hymnalsIdxName,
        hymnalsIdxAlias,
        hymnalsFts,
        hymnalsFtsInsert,
        hymnalsFtsUpdate,
        hymnalsFtsDelete,
        hymnScriptures,
        hymnScripturesIdxHymnId,
        hymnScripturesIdxScriptureId,
        hymnScripturesDeleteHymn,
        scriptures,
        hymnScripturesDeleteScripture,
        scripturesIdxName,
        scripturesFts,
        scripturesFtsInsert,
        scripturesFtsUpdate,
        scripturesFtsDelete,
        hymnStakeholders,
        hymnStakeholdersIdxHymnId,
        hymnStakeholdersIdxStakeholderId,
        hymnStakeholdersIdxRelationship,
        hymnStakeholdersDeleteHymn,
        stakeholders,
        hymnStakeholdersDeleteStakeholder,
        stakeholdersIdxName,
        stakeholdersFts,
        stakeholdersFtsInsert,
        stakeholdersFtsUpdate,
        stakeholdersFtsDelete,
        hymnTopics,
        hymnTopicsIdxHymnId,
        hymnTopicsIdxTopicId,
        hymnTopicsDeleteHymn,
        topics,
        hymnTopicsDeleteTopic,
        topicsIdxName,
        topicsFts,
        topicsFtsInsert,
        topicsFtsUpdate,
        topicsFtsDelete,
        hymnsIdxTitle,
        hymnsIdxNumber,
        hymnsFts,
        hymnsFtsInsert,
        hymnsFtsUpdate,
        hymnsFtsDelete,
        bundles,
        bundlesIdxHymnId,
        bundlesDeleteHymn,
        userRecordsUsersDeleteTrigger,
        recordsCache,
        recordsIdxCollection,
        recordsIdxData,
        recordsIdxStatus,
        recordsIdxDate
      ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules(
        [
          WritePropagation(
            on: TableUpdateQuery.onTableName('offline_queue',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('offline_queue_files', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('users',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('offline_queue', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('hymns',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('hymn_portions', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('portions',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('hymn_portions', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('portions',
                limitUpdateKind: UpdateKind.insert),
            result: [
              TableUpdate('portions_fts', kind: UpdateKind.insert),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('portions',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('portions_fts', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('portions',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('portions_fts', kind: UpdateKind.insert),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('hymns',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('hymn_hymnals', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('hymnals',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('hymn_hymnals', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('hymnals',
                limitUpdateKind: UpdateKind.insert),
            result: [
              TableUpdate('hymnals_fts', kind: UpdateKind.insert),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('hymnals',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('hymnals_fts', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('hymnals',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('hymnals_fts', kind: UpdateKind.insert),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('hymns',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('hymn_scriptures', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('scriptures',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('hymn_scriptures', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('scriptures',
                limitUpdateKind: UpdateKind.insert),
            result: [
              TableUpdate('scriptures_fts', kind: UpdateKind.insert),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('scriptures',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('scriptures_fts', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('scriptures',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('scriptures_fts', kind: UpdateKind.insert),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('hymns',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('hymn_stakeholders', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('stakeholders',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('hymn_stakeholders', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('stakeholders',
                limitUpdateKind: UpdateKind.insert),
            result: [
              TableUpdate('stakeholders_fts', kind: UpdateKind.insert),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('stakeholders',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('stakeholders_fts', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('stakeholders',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('stakeholders_fts', kind: UpdateKind.insert),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('hymns',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('hymn_topics', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('topics',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('hymn_topics', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('topics',
                limitUpdateKind: UpdateKind.insert),
            result: [
              TableUpdate('topics_fts', kind: UpdateKind.insert),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('topics',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('topics_fts', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('topics',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('topics_fts', kind: UpdateKind.insert),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('hymns',
                limitUpdateKind: UpdateKind.insert),
            result: [
              TableUpdate('hymns_fts', kind: UpdateKind.insert),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('hymns',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('hymns_fts', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('hymns',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('hymns_fts', kind: UpdateKind.insert),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('hymns',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('bundles', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('users',
                limitUpdateKind: UpdateKind.delete),
            result: [],
          ),
        ],
      );
  @override
  DriftDatabaseOptions get options =>
      const DriftDatabaseOptions(storeDateTimeAsText: true);
}

class GetRequestCacheCacheControlResult {
  int id;
  String cacheControl;
  GetRequestCacheCacheControlResult({
    required this.id,
    required this.cacheControl,
  });
}

class SearchPortionsResult {
  String id;
  String name;
  String lyrics;
  DateTime created;
  DateTime updated;
  SearchPortionsResult({
    required this.id,
    required this.name,
    required this.lyrics,
    required this.created,
    required this.updated,
  });
}

class SearchHymnalsResult {
  String id;
  String name;
  String alias;
  DateTime created;
  DateTime updated;
  SearchHymnalsResult({
    required this.id,
    required this.name,
    required this.alias,
    required this.created,
    required this.updated,
  });
}

class SearchScripturesResult {
  String id;
  String name;
  DateTime created;
  DateTime updated;
  SearchScripturesResult({
    required this.id,
    required this.name,
    required this.created,
    required this.updated,
  });
}

class GetStakeholdersWithRelationshipForHymnIdResult {
  String id;
  String name;
  DateTime created;
  DateTime updated;
  String relationship;
  GetStakeholdersWithRelationshipForHymnIdResult({
    required this.id,
    required this.name,
    required this.created,
    required this.updated,
    required this.relationship,
  });
}

class SearchStakeholdersResult {
  String id;
  String name;
  DateTime created;
  DateTime updated;
  SearchStakeholdersResult({
    required this.id,
    required this.name,
    required this.created,
    required this.updated,
  });
}

class SearchTopicsResult {
  String id;
  String name;
  DateTime created;
  DateTime updated;
  SearchTopicsResult({
    required this.id,
    required this.name,
    required this.created,
    required this.updated,
  });
}

class SearchHymnsResult {
  String id;
  String title;
  String number;
  String tuneName;
  String startingKey;
  String beatPattern;
  String startingPitch;
  String startingBeat;
  String startingPitchDirection;
  String timeSignature;
  String complexTimeSignature;
  DateTime created;
  DateTime updated;
  SearchHymnsResult({
    required this.id,
    required this.title,
    required this.number,
    required this.tuneName,
    required this.startingKey,
    required this.beatPattern,
    required this.startingPitch,
    required this.startingBeat,
    required this.startingPitchDirection,
    required this.timeSignature,
    required this.complexTimeSignature,
    required this.created,
    required this.updated,
  });
}

class SearchHymnRowsResult {
  String id;
  String title;
  String number;
  String? tuneName;
  String? startingKey;
  String? beatPattern;
  String? startingPitch;
  String? startingBeat;
  String? startingPitchDirection;
  String? timeSignature;
  String? complexTimeSignature;
  DateTime created;
  DateTime updated;
  String? topics;
  String? scriptures;
  String? portions;
  String? hymnals;
  SearchHymnRowsResult({
    required this.id,
    required this.title,
    required this.number,
    this.tuneName,
    this.startingKey,
    this.beatPattern,
    this.startingPitch,
    this.startingBeat,
    this.startingPitchDirection,
    this.timeSignature,
    this.complexTimeSignature,
    required this.created,
    required this.updated,
    this.topics,
    this.scriptures,
    this.portions,
    this.hymnals,
  });
}

class GetHymnRowsResult {
  String id;
  String title;
  String number;
  String? tuneName;
  String? startingKey;
  String? beatPattern;
  String? startingPitch;
  String? startingBeat;
  String? startingPitchDirection;
  String? timeSignature;
  String? complexTimeSignature;
  DateTime created;
  DateTime updated;
  String? topics;
  String? scriptures;
  String? portions;
  String? hymnals;
  GetHymnRowsResult({
    required this.id,
    required this.title,
    required this.number,
    this.tuneName,
    this.startingKey,
    this.beatPattern,
    this.startingPitch,
    this.startingBeat,
    this.startingPitchDirection,
    this.timeSignature,
    this.complexTimeSignature,
    required this.created,
    required this.updated,
    this.topics,
    this.scriptures,
    this.portions,
    this.hymnals,
  });
}

class GetBundlesHashesResult {
  int? bundleId;
  String? bundleHash;
  DateTime? bundleCreated;
  DateTime? bundleUpdated;
  Hymn hymn;
  GetBundlesHashesResult({
    this.bundleId,
    this.bundleHash,
    this.bundleCreated,
    this.bundleUpdated,
    required this.hymn,
  });
}
