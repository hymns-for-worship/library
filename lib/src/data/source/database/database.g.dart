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
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {id, email, uid},
      ];
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
  List<String> get customConstraints => const ['UNIQUE(id, email, uid)'];
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
  static const VerificationMeta _dataMeta = const VerificationMeta('data');
  late final GeneratedColumn<String> data = GeneratedColumn<String>(
      'data', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      generatedAs: GeneratedAs(
          const CustomExpression('json_extract(data, \'\$.id\')'), false),
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints:
          'GENERATED ALWAYS AS (json_extract(data, \'\$.id\')) VIRTUAL NOT NULL');
  static const VerificationMeta _collectionIdMeta =
      const VerificationMeta('collectionId');
  late final GeneratedColumn<String> collectionId = GeneratedColumn<String>(
      'collection_id', aliasedName, false,
      generatedAs: GeneratedAs(
          const CustomExpression('json_extract(data, \'\$.collectionId\')'),
          false),
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints:
          'GENERATED ALWAYS AS (json_extract(data, \'\$.collectionId\')) VIRTUAL NOT NULL');
  static const VerificationMeta _collectionNameMeta =
      const VerificationMeta('collectionName');
  late final GeneratedColumn<String> collectionName = GeneratedColumn<String>(
      'collection_name', aliasedName, false,
      generatedAs: GeneratedAs(
          const CustomExpression('json_extract(data, \'\$.collectionName\')'),
          false),
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints:
          'GENERATED ALWAYS AS (json_extract(data, \'\$.collectionName\')) VIRTUAL NOT NULL');
  static const VerificationMeta _createdMeta =
      const VerificationMeta('created');
  late final GeneratedColumn<DateTime> created = GeneratedColumn<DateTime>(
      'created', aliasedName, false,
      generatedAs: GeneratedAs(
          const CustomExpression('json_extract(data, \'\$.created\')'), false),
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      $customConstraints:
          'GENERATED ALWAYS AS (json_extract(data, \'\$.created\')) VIRTUAL NOT NULL');
  static const VerificationMeta _updatedMeta =
      const VerificationMeta('updated');
  late final GeneratedColumn<DateTime> updated = GeneratedColumn<DateTime>(
      'updated', aliasedName, false,
      generatedAs: GeneratedAs(
          const CustomExpression('json_extract(data, \'\$.updated\')'), false),
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      $customConstraints:
          'GENERATED ALWAYS AS (json_extract(data, \'\$.updated\')) VIRTUAL NOT NULL');
  static const VerificationMeta _deletedMeta =
      const VerificationMeta('deleted');
  late final GeneratedColumn<bool> deleted = GeneratedColumn<bool>(
      'deleted', aliasedName, true,
      generatedAs: GeneratedAs(
          const CustomExpression('json_extract(data, \'\$.deleted\')'), false),
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      $customConstraints:
          'GENERATED ALWAYS AS (json_extract(data, \'\$.deleted\')) VIRTUAL');
  static const VerificationMeta _syncedMeta = const VerificationMeta('synced');
  late final GeneratedColumn<bool> synced = GeneratedColumn<bool>(
      'synced', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT 0',
      defaultValue: const CustomExpression('0'));
  static const VerificationMeta _freshMeta = const VerificationMeta('fresh');
  late final GeneratedColumn<bool> fresh = GeneratedColumn<bool>(
      'fresh', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      $customConstraints: '');
  @override
  List<GeneratedColumn> get $columns => [
        data,
        id,
        collectionId,
        collectionName,
        created,
        updated,
        deleted,
        synced,
        fresh
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
    if (data.containsKey('data')) {
      context.handle(
          _dataMeta, this.data.isAcceptableOrUnknown(data['data']!, _dataMeta));
    } else if (isInserting) {
      context.missing(_dataMeta);
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('collection_id')) {
      context.handle(
          _collectionIdMeta,
          collectionId.isAcceptableOrUnknown(
              data['collection_id']!, _collectionIdMeta));
    }
    if (data.containsKey('collection_name')) {
      context.handle(
          _collectionNameMeta,
          collectionName.isAcceptableOrUnknown(
              data['collection_name']!, _collectionNameMeta));
    }
    if (data.containsKey('created')) {
      context.handle(_createdMeta,
          created.isAcceptableOrUnknown(data['created']!, _createdMeta));
    }
    if (data.containsKey('updated')) {
      context.handle(_updatedMeta,
          updated.isAcceptableOrUnknown(data['updated']!, _updatedMeta));
    }
    if (data.containsKey('deleted')) {
      context.handle(_deletedMeta,
          deleted.isAcceptableOrUnknown(data['deleted']!, _deletedMeta));
    }
    if (data.containsKey('synced')) {
      context.handle(_syncedMeta,
          synced.isAcceptableOrUnknown(data['synced']!, _syncedMeta));
    }
    if (data.containsKey('fresh')) {
      context.handle(
          _freshMeta, fresh.isAcceptableOrUnknown(data['fresh']!, _freshMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {id, collectionName},
      ];
  @override
  Record map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Record(
      data: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}data'])!,
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      collectionId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}collection_id'])!,
      collectionName: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}collection_name'])!,
      created: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created'])!,
      updated: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated'])!,
      deleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}deleted']),
      synced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}synced'])!,
      fresh: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}fresh']),
    );
  }

  @override
  Records createAlias(String alias) {
    return Records(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const ['UNIQUE(id, collection_name)'];
  @override
  bool get dontWriteConstraints => true;
}

class Record extends DataClass implements Insertable<Record> {
  String data;
  String id;
  String collectionId;
  String collectionName;
  DateTime created;
  DateTime updated;
  bool? deleted;
  bool synced;
  bool? fresh;
  Record(
      {required this.data,
      required this.id,
      required this.collectionId,
      required this.collectionName,
      required this.created,
      required this.updated,
      this.deleted,
      required this.synced,
      this.fresh});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['data'] = Variable<String>(data);
    map['synced'] = Variable<bool>(synced);
    if (!nullToAbsent || fresh != null) {
      map['fresh'] = Variable<bool>(fresh);
    }
    return map;
  }

  RecordsCompanion toCompanion(bool nullToAbsent) {
    return RecordsCompanion(
      data: Value(data),
      synced: Value(synced),
      fresh:
          fresh == null && nullToAbsent ? const Value.absent() : Value(fresh),
    );
  }

  factory Record.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Record(
      data: serializer.fromJson<String>(json['data']),
      id: serializer.fromJson<String>(json['id']),
      collectionId: serializer.fromJson<String>(json['collection_id']),
      collectionName: serializer.fromJson<String>(json['collection_name']),
      created: serializer.fromJson<DateTime>(json['created']),
      updated: serializer.fromJson<DateTime>(json['updated']),
      deleted: serializer.fromJson<bool?>(json['deleted']),
      synced: serializer.fromJson<bool>(json['synced']),
      fresh: serializer.fromJson<bool?>(json['fresh']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'data': serializer.toJson<String>(data),
      'id': serializer.toJson<String>(id),
      'collection_id': serializer.toJson<String>(collectionId),
      'collection_name': serializer.toJson<String>(collectionName),
      'created': serializer.toJson<DateTime>(created),
      'updated': serializer.toJson<DateTime>(updated),
      'deleted': serializer.toJson<bool?>(deleted),
      'synced': serializer.toJson<bool>(synced),
      'fresh': serializer.toJson<bool?>(fresh),
    };
  }

  Record copyWith(
          {String? data,
          String? id,
          String? collectionId,
          String? collectionName,
          DateTime? created,
          DateTime? updated,
          Value<bool?> deleted = const Value.absent(),
          bool? synced,
          Value<bool?> fresh = const Value.absent()}) =>
      Record(
        data: data ?? this.data,
        id: id ?? this.id,
        collectionId: collectionId ?? this.collectionId,
        collectionName: collectionName ?? this.collectionName,
        created: created ?? this.created,
        updated: updated ?? this.updated,
        deleted: deleted.present ? deleted.value : this.deleted,
        synced: synced ?? this.synced,
        fresh: fresh.present ? fresh.value : this.fresh,
      );
  @override
  String toString() {
    return (StringBuffer('Record(')
          ..write('data: $data, ')
          ..write('id: $id, ')
          ..write('collectionId: $collectionId, ')
          ..write('collectionName: $collectionName, ')
          ..write('created: $created, ')
          ..write('updated: $updated, ')
          ..write('deleted: $deleted, ')
          ..write('synced: $synced, ')
          ..write('fresh: $fresh')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(data, id, collectionId, collectionName,
      created, updated, deleted, synced, fresh);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Record &&
          other.data == this.data &&
          other.id == this.id &&
          other.collectionId == this.collectionId &&
          other.collectionName == this.collectionName &&
          other.created == this.created &&
          other.updated == this.updated &&
          other.deleted == this.deleted &&
          other.synced == this.synced &&
          other.fresh == this.fresh);
}

class RecordsCompanion extends UpdateCompanion<Record> {
  Value<String> data;
  Value<bool> synced;
  Value<bool?> fresh;
  Value<int> rowid;
  RecordsCompanion({
    this.data = const Value.absent(),
    this.synced = const Value.absent(),
    this.fresh = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RecordsCompanion.insert({
    required String data,
    this.synced = const Value.absent(),
    this.fresh = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : data = Value(data);
  static Insertable<Record> custom({
    Expression<String>? data,
    Expression<bool>? synced,
    Expression<bool>? fresh,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (data != null) 'data': data,
      if (synced != null) 'synced': synced,
      if (fresh != null) 'fresh': fresh,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RecordsCompanion copyWith(
      {Value<String>? data,
      Value<bool>? synced,
      Value<bool?>? fresh,
      Value<int>? rowid}) {
    return RecordsCompanion(
      data: data ?? this.data,
      synced: synced ?? this.synced,
      fresh: fresh ?? this.fresh,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (data.present) {
      map['data'] = Variable<String>(data.value);
    }
    if (synced.present) {
      map['synced'] = Variable<bool>(synced.value);
    }
    if (fresh.present) {
      map['fresh'] = Variable<bool>(fresh.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecordsCompanion(')
          ..write('data: $data, ')
          ..write('synced: $synced, ')
          ..write('fresh: $fresh, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class UserRecord extends DataClass {
  String data;
  String id;
  String collectionId;
  String collectionName;
  DateTime created;
  DateTime updated;
  bool? deleted;
  bool synced;
  bool? fresh;
  String? user;
  String? uid;
  UserRecord(
      {required this.data,
      required this.id,
      required this.collectionId,
      required this.collectionName,
      required this.created,
      required this.updated,
      this.deleted,
      required this.synced,
      this.fresh,
      this.user,
      this.uid});
  factory UserRecord.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserRecord(
      data: serializer.fromJson<String>(json['data']),
      id: serializer.fromJson<String>(json['id']),
      collectionId: serializer.fromJson<String>(json['collection_id']),
      collectionName: serializer.fromJson<String>(json['collection_name']),
      created: serializer.fromJson<DateTime>(json['created']),
      updated: serializer.fromJson<DateTime>(json['updated']),
      deleted: serializer.fromJson<bool?>(json['deleted']),
      synced: serializer.fromJson<bool>(json['synced']),
      fresh: serializer.fromJson<bool?>(json['fresh']),
      user: serializer.fromJson<String?>(json['user']),
      uid: serializer.fromJson<String?>(json['uid']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'data': serializer.toJson<String>(data),
      'id': serializer.toJson<String>(id),
      'collection_id': serializer.toJson<String>(collectionId),
      'collection_name': serializer.toJson<String>(collectionName),
      'created': serializer.toJson<DateTime>(created),
      'updated': serializer.toJson<DateTime>(updated),
      'deleted': serializer.toJson<bool?>(deleted),
      'synced': serializer.toJson<bool>(synced),
      'fresh': serializer.toJson<bool?>(fresh),
      'user': serializer.toJson<String?>(user),
      'uid': serializer.toJson<String?>(uid),
    };
  }

  UserRecord copyWith(
          {String? data,
          String? id,
          String? collectionId,
          String? collectionName,
          DateTime? created,
          DateTime? updated,
          Value<bool?> deleted = const Value.absent(),
          bool? synced,
          Value<bool?> fresh = const Value.absent(),
          Value<String?> user = const Value.absent(),
          Value<String?> uid = const Value.absent()}) =>
      UserRecord(
        data: data ?? this.data,
        id: id ?? this.id,
        collectionId: collectionId ?? this.collectionId,
        collectionName: collectionName ?? this.collectionName,
        created: created ?? this.created,
        updated: updated ?? this.updated,
        deleted: deleted.present ? deleted.value : this.deleted,
        synced: synced ?? this.synced,
        fresh: fresh.present ? fresh.value : this.fresh,
        user: user.present ? user.value : this.user,
        uid: uid.present ? uid.value : this.uid,
      );
  @override
  String toString() {
    return (StringBuffer('UserRecord(')
          ..write('data: $data, ')
          ..write('id: $id, ')
          ..write('collectionId: $collectionId, ')
          ..write('collectionName: $collectionName, ')
          ..write('created: $created, ')
          ..write('updated: $updated, ')
          ..write('deleted: $deleted, ')
          ..write('synced: $synced, ')
          ..write('fresh: $fresh, ')
          ..write('user: $user, ')
          ..write('uid: $uid')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(data, id, collectionId, collectionName,
      created, updated, deleted, synced, fresh, user, uid);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserRecord &&
          other.data == this.data &&
          other.id == this.id &&
          other.collectionId == this.collectionId &&
          other.collectionName == this.collectionName &&
          other.created == this.created &&
          other.updated == this.updated &&
          other.deleted == this.deleted &&
          other.synced == this.synced &&
          other.fresh == this.fresh &&
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
        data,
        id,
        collectionId,
        collectionName,
        created,
        updated,
        deleted,
        synced,
        fresh,
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
            'CREATE VIEW user_records AS SELECT *, CASE WHEN json_extract(data, \'\$.user\') IS NOT NULL THEN CAST(json_extract(data, \'\$.user\') AS TEXT) ELSE NULL END AS user, CASE WHEN json_extract(data, \'\$.uid\') IS NOT NULL THEN CAST(json_extract(data, \'\$.uid\') AS TEXT) ELSE NULL END AS uid FROM records',
      };
  @override
  UserRecords get asDslTable => this;
  @override
  UserRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserRecord(
      data: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}data'])!,
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      collectionId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}collection_id'])!,
      collectionName: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}collection_name'])!,
      created: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created'])!,
      updated: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated'])!,
      deleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}deleted']),
      synced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}synced'])!,
      fresh: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}fresh']),
      user: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user']),
      uid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uid']),
    );
  }

  late final GeneratedColumn<String> data = GeneratedColumn<String>(
      'data', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> collectionId = GeneratedColumn<String>(
      'collection_id', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> collectionName = GeneratedColumn<String>(
      'collection_name', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<DateTime> created = GeneratedColumn<DateTime>(
      'created', aliasedName, false,
      type: DriftSqlType.dateTime);
  late final GeneratedColumn<DateTime> updated = GeneratedColumn<DateTime>(
      'updated', aliasedName, false,
      type: DriftSqlType.dateTime);
  late final GeneratedColumn<bool> deleted = GeneratedColumn<bool>(
      'deleted', aliasedName, true,
      type: DriftSqlType.bool,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("deleted" IN (0, 1))'));
  late final GeneratedColumn<bool> synced = GeneratedColumn<bool>(
      'synced', aliasedName, false,
      type: DriftSqlType.bool,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("synced" IN (0, 1))'));
  late final GeneratedColumn<bool> fresh = GeneratedColumn<bool>(
      'fresh', aliasedName, true,
      type: DriftSqlType.bool,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("fresh" IN (0, 1))'));
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
  String data;
  String id;
  String collectionId;
  String collectionName;
  DateTime created;
  DateTime updated;
  bool? deleted;
  bool synced;
  bool? fresh;
  String? user;
  String? uid;
  String type;
  String? metadata;
  String? version;
  String? platform;
  Analytic(
      {required this.data,
      required this.id,
      required this.collectionId,
      required this.collectionName,
      required this.created,
      required this.updated,
      this.deleted,
      required this.synced,
      this.fresh,
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
      data: serializer.fromJson<String>(json['data']),
      id: serializer.fromJson<String>(json['id']),
      collectionId: serializer.fromJson<String>(json['collection_id']),
      collectionName: serializer.fromJson<String>(json['collection_name']),
      created: serializer.fromJson<DateTime>(json['created']),
      updated: serializer.fromJson<DateTime>(json['updated']),
      deleted: serializer.fromJson<bool?>(json['deleted']),
      synced: serializer.fromJson<bool>(json['synced']),
      fresh: serializer.fromJson<bool?>(json['fresh']),
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
      'data': serializer.toJson<String>(data),
      'id': serializer.toJson<String>(id),
      'collection_id': serializer.toJson<String>(collectionId),
      'collection_name': serializer.toJson<String>(collectionName),
      'created': serializer.toJson<DateTime>(created),
      'updated': serializer.toJson<DateTime>(updated),
      'deleted': serializer.toJson<bool?>(deleted),
      'synced': serializer.toJson<bool>(synced),
      'fresh': serializer.toJson<bool?>(fresh),
      'user': serializer.toJson<String?>(user),
      'uid': serializer.toJson<String?>(uid),
      'type': serializer.toJson<String>(type),
      'metadata': serializer.toJson<String?>(metadata),
      'version': serializer.toJson<String?>(version),
      'platform': serializer.toJson<String?>(platform),
    };
  }

  Analytic copyWith(
          {String? data,
          String? id,
          String? collectionId,
          String? collectionName,
          DateTime? created,
          DateTime? updated,
          Value<bool?> deleted = const Value.absent(),
          bool? synced,
          Value<bool?> fresh = const Value.absent(),
          Value<String?> user = const Value.absent(),
          Value<String?> uid = const Value.absent(),
          String? type,
          Value<String?> metadata = const Value.absent(),
          Value<String?> version = const Value.absent(),
          Value<String?> platform = const Value.absent()}) =>
      Analytic(
        data: data ?? this.data,
        id: id ?? this.id,
        collectionId: collectionId ?? this.collectionId,
        collectionName: collectionName ?? this.collectionName,
        created: created ?? this.created,
        updated: updated ?? this.updated,
        deleted: deleted.present ? deleted.value : this.deleted,
        synced: synced ?? this.synced,
        fresh: fresh.present ? fresh.value : this.fresh,
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
          ..write('data: $data, ')
          ..write('id: $id, ')
          ..write('collectionId: $collectionId, ')
          ..write('collectionName: $collectionName, ')
          ..write('created: $created, ')
          ..write('updated: $updated, ')
          ..write('deleted: $deleted, ')
          ..write('synced: $synced, ')
          ..write('fresh: $fresh, ')
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
      data,
      id,
      collectionId,
      collectionName,
      created,
      updated,
      deleted,
      synced,
      fresh,
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
          other.data == this.data &&
          other.id == this.id &&
          other.collectionId == this.collectionId &&
          other.collectionName == this.collectionName &&
          other.created == this.created &&
          other.updated == this.updated &&
          other.deleted == this.deleted &&
          other.synced == this.synced &&
          other.fresh == this.fresh &&
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
        data,
        id,
        collectionId,
        collectionName,
        created,
        updated,
        deleted,
        synced,
        fresh,
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
      data: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}data'])!,
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      collectionId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}collection_id'])!,
      collectionName: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}collection_name'])!,
      created: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created'])!,
      updated: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated'])!,
      deleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}deleted']),
      synced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}synced'])!,
      fresh: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}fresh']),
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

  late final GeneratedColumn<String> data = GeneratedColumn<String>(
      'data', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> collectionId = GeneratedColumn<String>(
      'collection_id', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> collectionName = GeneratedColumn<String>(
      'collection_name', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<DateTime> created = GeneratedColumn<DateTime>(
      'created', aliasedName, false,
      type: DriftSqlType.dateTime);
  late final GeneratedColumn<DateTime> updated = GeneratedColumn<DateTime>(
      'updated', aliasedName, false,
      type: DriftSqlType.dateTime);
  late final GeneratedColumn<bool> deleted = GeneratedColumn<bool>(
      'deleted', aliasedName, true,
      type: DriftSqlType.bool,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("deleted" IN (0, 1))'));
  late final GeneratedColumn<bool> synced = GeneratedColumn<bool>(
      'synced', aliasedName, false,
      type: DriftSqlType.bool,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("synced" IN (0, 1))'));
  late final GeneratedColumn<bool> fresh = GeneratedColumn<bool>(
      'fresh', aliasedName, true,
      type: DriftSqlType.bool,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("fresh" IN (0, 1))'));
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
  String data;
  String id;
  String collectionId;
  String collectionName;
  DateTime created;
  DateTime updated;
  bool? deleted;
  bool synced;
  bool? fresh;
  String? user;
  String? uid;
  String productId;
  String? platform;
  double? amount;
  String? purchaseId;
  UserPurchase(
      {required this.data,
      required this.id,
      required this.collectionId,
      required this.collectionName,
      required this.created,
      required this.updated,
      this.deleted,
      required this.synced,
      this.fresh,
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
      data: serializer.fromJson<String>(json['data']),
      id: serializer.fromJson<String>(json['id']),
      collectionId: serializer.fromJson<String>(json['collection_id']),
      collectionName: serializer.fromJson<String>(json['collection_name']),
      created: serializer.fromJson<DateTime>(json['created']),
      updated: serializer.fromJson<DateTime>(json['updated']),
      deleted: serializer.fromJson<bool?>(json['deleted']),
      synced: serializer.fromJson<bool>(json['synced']),
      fresh: serializer.fromJson<bool?>(json['fresh']),
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
      'data': serializer.toJson<String>(data),
      'id': serializer.toJson<String>(id),
      'collection_id': serializer.toJson<String>(collectionId),
      'collection_name': serializer.toJson<String>(collectionName),
      'created': serializer.toJson<DateTime>(created),
      'updated': serializer.toJson<DateTime>(updated),
      'deleted': serializer.toJson<bool?>(deleted),
      'synced': serializer.toJson<bool>(synced),
      'fresh': serializer.toJson<bool?>(fresh),
      'user': serializer.toJson<String?>(user),
      'uid': serializer.toJson<String?>(uid),
      'product_id': serializer.toJson<String>(productId),
      'platform': serializer.toJson<String?>(platform),
      'amount': serializer.toJson<double?>(amount),
      'purchase_id': serializer.toJson<String?>(purchaseId),
    };
  }

  UserPurchase copyWith(
          {String? data,
          String? id,
          String? collectionId,
          String? collectionName,
          DateTime? created,
          DateTime? updated,
          Value<bool?> deleted = const Value.absent(),
          bool? synced,
          Value<bool?> fresh = const Value.absent(),
          Value<String?> user = const Value.absent(),
          Value<String?> uid = const Value.absent(),
          String? productId,
          Value<String?> platform = const Value.absent(),
          Value<double?> amount = const Value.absent(),
          Value<String?> purchaseId = const Value.absent()}) =>
      UserPurchase(
        data: data ?? this.data,
        id: id ?? this.id,
        collectionId: collectionId ?? this.collectionId,
        collectionName: collectionName ?? this.collectionName,
        created: created ?? this.created,
        updated: updated ?? this.updated,
        deleted: deleted.present ? deleted.value : this.deleted,
        synced: synced ?? this.synced,
        fresh: fresh.present ? fresh.value : this.fresh,
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
          ..write('data: $data, ')
          ..write('id: $id, ')
          ..write('collectionId: $collectionId, ')
          ..write('collectionName: $collectionName, ')
          ..write('created: $created, ')
          ..write('updated: $updated, ')
          ..write('deleted: $deleted, ')
          ..write('synced: $synced, ')
          ..write('fresh: $fresh, ')
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
      data,
      id,
      collectionId,
      collectionName,
      created,
      updated,
      deleted,
      synced,
      fresh,
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
          other.data == this.data &&
          other.id == this.id &&
          other.collectionId == this.collectionId &&
          other.collectionName == this.collectionName &&
          other.created == this.created &&
          other.updated == this.updated &&
          other.deleted == this.deleted &&
          other.synced == this.synced &&
          other.fresh == this.fresh &&
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
        data,
        id,
        collectionId,
        collectionName,
        created,
        updated,
        deleted,
        synced,
        fresh,
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
      data: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}data'])!,
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      collectionId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}collection_id'])!,
      collectionName: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}collection_name'])!,
      created: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created'])!,
      updated: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated'])!,
      deleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}deleted']),
      synced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}synced'])!,
      fresh: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}fresh']),
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

  late final GeneratedColumn<String> data = GeneratedColumn<String>(
      'data', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> collectionId = GeneratedColumn<String>(
      'collection_id', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> collectionName = GeneratedColumn<String>(
      'collection_name', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<DateTime> created = GeneratedColumn<DateTime>(
      'created', aliasedName, false,
      type: DriftSqlType.dateTime);
  late final GeneratedColumn<DateTime> updated = GeneratedColumn<DateTime>(
      'updated', aliasedName, false,
      type: DriftSqlType.dateTime);
  late final GeneratedColumn<bool> deleted = GeneratedColumn<bool>(
      'deleted', aliasedName, true,
      type: DriftSqlType.bool,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("deleted" IN (0, 1))'));
  late final GeneratedColumn<bool> synced = GeneratedColumn<bool>(
      'synced', aliasedName, false,
      type: DriftSqlType.bool,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("synced" IN (0, 1))'));
  late final GeneratedColumn<bool> fresh = GeneratedColumn<bool>(
      'fresh', aliasedName, true,
      type: DriftSqlType.bool,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("fresh" IN (0, 1))'));
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
  String data;
  String id;
  String collectionId;
  String collectionName;
  DateTime created;
  DateTime updated;
  bool? deleted;
  bool synced;
  bool? fresh;
  String? user;
  String? uid;
  String? hymnId;
  String? playlistId;
  String? topicId;
  String? stakeholderId;
  UserLibraryData(
      {required this.data,
      required this.id,
      required this.collectionId,
      required this.collectionName,
      required this.created,
      required this.updated,
      this.deleted,
      required this.synced,
      this.fresh,
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
      data: serializer.fromJson<String>(json['data']),
      id: serializer.fromJson<String>(json['id']),
      collectionId: serializer.fromJson<String>(json['collection_id']),
      collectionName: serializer.fromJson<String>(json['collection_name']),
      created: serializer.fromJson<DateTime>(json['created']),
      updated: serializer.fromJson<DateTime>(json['updated']),
      deleted: serializer.fromJson<bool?>(json['deleted']),
      synced: serializer.fromJson<bool>(json['synced']),
      fresh: serializer.fromJson<bool?>(json['fresh']),
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
      'data': serializer.toJson<String>(data),
      'id': serializer.toJson<String>(id),
      'collection_id': serializer.toJson<String>(collectionId),
      'collection_name': serializer.toJson<String>(collectionName),
      'created': serializer.toJson<DateTime>(created),
      'updated': serializer.toJson<DateTime>(updated),
      'deleted': serializer.toJson<bool?>(deleted),
      'synced': serializer.toJson<bool>(synced),
      'fresh': serializer.toJson<bool?>(fresh),
      'user': serializer.toJson<String?>(user),
      'uid': serializer.toJson<String?>(uid),
      'hymn_id': serializer.toJson<String?>(hymnId),
      'playlist_id': serializer.toJson<String?>(playlistId),
      'topic_id': serializer.toJson<String?>(topicId),
      'stakeholder_id': serializer.toJson<String?>(stakeholderId),
    };
  }

  UserLibraryData copyWith(
          {String? data,
          String? id,
          String? collectionId,
          String? collectionName,
          DateTime? created,
          DateTime? updated,
          Value<bool?> deleted = const Value.absent(),
          bool? synced,
          Value<bool?> fresh = const Value.absent(),
          Value<String?> user = const Value.absent(),
          Value<String?> uid = const Value.absent(),
          Value<String?> hymnId = const Value.absent(),
          Value<String?> playlistId = const Value.absent(),
          Value<String?> topicId = const Value.absent(),
          Value<String?> stakeholderId = const Value.absent()}) =>
      UserLibraryData(
        data: data ?? this.data,
        id: id ?? this.id,
        collectionId: collectionId ?? this.collectionId,
        collectionName: collectionName ?? this.collectionName,
        created: created ?? this.created,
        updated: updated ?? this.updated,
        deleted: deleted.present ? deleted.value : this.deleted,
        synced: synced ?? this.synced,
        fresh: fresh.present ? fresh.value : this.fresh,
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
          ..write('data: $data, ')
          ..write('id: $id, ')
          ..write('collectionId: $collectionId, ')
          ..write('collectionName: $collectionName, ')
          ..write('created: $created, ')
          ..write('updated: $updated, ')
          ..write('deleted: $deleted, ')
          ..write('synced: $synced, ')
          ..write('fresh: $fresh, ')
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
      data,
      id,
      collectionId,
      collectionName,
      created,
      updated,
      deleted,
      synced,
      fresh,
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
          other.data == this.data &&
          other.id == this.id &&
          other.collectionId == this.collectionId &&
          other.collectionName == this.collectionName &&
          other.created == this.created &&
          other.updated == this.updated &&
          other.deleted == this.deleted &&
          other.synced == this.synced &&
          other.fresh == this.fresh &&
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
        data,
        id,
        collectionId,
        collectionName,
        created,
        updated,
        deleted,
        synced,
        fresh,
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
      data: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}data'])!,
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      collectionId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}collection_id'])!,
      collectionName: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}collection_name'])!,
      created: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created'])!,
      updated: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated'])!,
      deleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}deleted']),
      synced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}synced'])!,
      fresh: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}fresh']),
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

  late final GeneratedColumn<String> data = GeneratedColumn<String>(
      'data', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> collectionId = GeneratedColumn<String>(
      'collection_id', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> collectionName = GeneratedColumn<String>(
      'collection_name', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<DateTime> created = GeneratedColumn<DateTime>(
      'created', aliasedName, false,
      type: DriftSqlType.dateTime);
  late final GeneratedColumn<DateTime> updated = GeneratedColumn<DateTime>(
      'updated', aliasedName, false,
      type: DriftSqlType.dateTime);
  late final GeneratedColumn<bool> deleted = GeneratedColumn<bool>(
      'deleted', aliasedName, true,
      type: DriftSqlType.bool,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("deleted" IN (0, 1))'));
  late final GeneratedColumn<bool> synced = GeneratedColumn<bool>(
      'synced', aliasedName, false,
      type: DriftSqlType.bool,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("synced" IN (0, 1))'));
  late final GeneratedColumn<bool> fresh = GeneratedColumn<bool>(
      'fresh', aliasedName, true,
      type: DriftSqlType.bool,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("fresh" IN (0, 1))'));
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

class UserPlaylistLibraryData extends DataClass {
  String data;
  String id;
  String collectionId;
  String collectionName;
  DateTime created;
  DateTime updated;
  bool? deleted;
  bool synced;
  bool? fresh;
  String? user;
  String? uid;
  String playlistId;
  UserPlaylistLibraryData(
      {required this.data,
      required this.id,
      required this.collectionId,
      required this.collectionName,
      required this.created,
      required this.updated,
      this.deleted,
      required this.synced,
      this.fresh,
      this.user,
      this.uid,
      required this.playlistId});
  factory UserPlaylistLibraryData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserPlaylistLibraryData(
      data: serializer.fromJson<String>(json['data']),
      id: serializer.fromJson<String>(json['id']),
      collectionId: serializer.fromJson<String>(json['collection_id']),
      collectionName: serializer.fromJson<String>(json['collection_name']),
      created: serializer.fromJson<DateTime>(json['created']),
      updated: serializer.fromJson<DateTime>(json['updated']),
      deleted: serializer.fromJson<bool?>(json['deleted']),
      synced: serializer.fromJson<bool>(json['synced']),
      fresh: serializer.fromJson<bool?>(json['fresh']),
      user: serializer.fromJson<String?>(json['user']),
      uid: serializer.fromJson<String?>(json['uid']),
      playlistId: serializer.fromJson<String>(json['playlist_id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'data': serializer.toJson<String>(data),
      'id': serializer.toJson<String>(id),
      'collection_id': serializer.toJson<String>(collectionId),
      'collection_name': serializer.toJson<String>(collectionName),
      'created': serializer.toJson<DateTime>(created),
      'updated': serializer.toJson<DateTime>(updated),
      'deleted': serializer.toJson<bool?>(deleted),
      'synced': serializer.toJson<bool>(synced),
      'fresh': serializer.toJson<bool?>(fresh),
      'user': serializer.toJson<String?>(user),
      'uid': serializer.toJson<String?>(uid),
      'playlist_id': serializer.toJson<String>(playlistId),
    };
  }

  UserPlaylistLibraryData copyWith(
          {String? data,
          String? id,
          String? collectionId,
          String? collectionName,
          DateTime? created,
          DateTime? updated,
          Value<bool?> deleted = const Value.absent(),
          bool? synced,
          Value<bool?> fresh = const Value.absent(),
          Value<String?> user = const Value.absent(),
          Value<String?> uid = const Value.absent(),
          String? playlistId}) =>
      UserPlaylistLibraryData(
        data: data ?? this.data,
        id: id ?? this.id,
        collectionId: collectionId ?? this.collectionId,
        collectionName: collectionName ?? this.collectionName,
        created: created ?? this.created,
        updated: updated ?? this.updated,
        deleted: deleted.present ? deleted.value : this.deleted,
        synced: synced ?? this.synced,
        fresh: fresh.present ? fresh.value : this.fresh,
        user: user.present ? user.value : this.user,
        uid: uid.present ? uid.value : this.uid,
        playlistId: playlistId ?? this.playlistId,
      );
  @override
  String toString() {
    return (StringBuffer('UserPlaylistLibraryData(')
          ..write('data: $data, ')
          ..write('id: $id, ')
          ..write('collectionId: $collectionId, ')
          ..write('collectionName: $collectionName, ')
          ..write('created: $created, ')
          ..write('updated: $updated, ')
          ..write('deleted: $deleted, ')
          ..write('synced: $synced, ')
          ..write('fresh: $fresh, ')
          ..write('user: $user, ')
          ..write('uid: $uid, ')
          ..write('playlistId: $playlistId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(data, id, collectionId, collectionName,
      created, updated, deleted, synced, fresh, user, uid, playlistId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserPlaylistLibraryData &&
          other.data == this.data &&
          other.id == this.id &&
          other.collectionId == this.collectionId &&
          other.collectionName == this.collectionName &&
          other.created == this.created &&
          other.updated == this.updated &&
          other.deleted == this.deleted &&
          other.synced == this.synced &&
          other.fresh == this.fresh &&
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
        data,
        id,
        collectionId,
        collectionName,
        created,
        updated,
        deleted,
        synced,
        fresh,
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
      data: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}data'])!,
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      collectionId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}collection_id'])!,
      collectionName: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}collection_name'])!,
      created: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created'])!,
      updated: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated'])!,
      deleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}deleted']),
      synced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}synced'])!,
      fresh: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}fresh']),
      user: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user']),
      uid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uid']),
      playlistId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}playlist_id'])!,
    );
  }

  late final GeneratedColumn<String> data = GeneratedColumn<String>(
      'data', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> collectionId = GeneratedColumn<String>(
      'collection_id', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> collectionName = GeneratedColumn<String>(
      'collection_name', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<DateTime> created = GeneratedColumn<DateTime>(
      'created', aliasedName, false,
      type: DriftSqlType.dateTime);
  late final GeneratedColumn<DateTime> updated = GeneratedColumn<DateTime>(
      'updated', aliasedName, false,
      type: DriftSqlType.dateTime);
  late final GeneratedColumn<bool> deleted = GeneratedColumn<bool>(
      'deleted', aliasedName, true,
      type: DriftSqlType.bool,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("deleted" IN (0, 1))'));
  late final GeneratedColumn<bool> synced = GeneratedColumn<bool>(
      'synced', aliasedName, false,
      type: DriftSqlType.bool,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("synced" IN (0, 1))'));
  late final GeneratedColumn<bool> fresh = GeneratedColumn<bool>(
      'fresh', aliasedName, true,
      type: DriftSqlType.bool,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("fresh" IN (0, 1))'));
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

class LocalPlaylist extends DataClass {
  String data;
  String id;
  String collectionId;
  String collectionName;
  DateTime created;
  DateTime updated;
  bool? deleted;
  bool synced;
  bool? fresh;
  String? user;
  String? uid;
  String name;
  String? description;
  bool? public;
  bool? medly;
  bool? supplement;
  String? event;
  LocalPlaylist(
      {required this.data,
      required this.id,
      required this.collectionId,
      required this.collectionName,
      required this.created,
      required this.updated,
      this.deleted,
      required this.synced,
      this.fresh,
      this.user,
      this.uid,
      required this.name,
      this.description,
      this.public,
      this.medly,
      this.supplement,
      this.event});
  factory LocalPlaylist.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocalPlaylist(
      data: serializer.fromJson<String>(json['data']),
      id: serializer.fromJson<String>(json['id']),
      collectionId: serializer.fromJson<String>(json['collection_id']),
      collectionName: serializer.fromJson<String>(json['collection_name']),
      created: serializer.fromJson<DateTime>(json['created']),
      updated: serializer.fromJson<DateTime>(json['updated']),
      deleted: serializer.fromJson<bool?>(json['deleted']),
      synced: serializer.fromJson<bool>(json['synced']),
      fresh: serializer.fromJson<bool?>(json['fresh']),
      user: serializer.fromJson<String?>(json['user']),
      uid: serializer.fromJson<String?>(json['uid']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      public: serializer.fromJson<bool?>(json['public']),
      medly: serializer.fromJson<bool?>(json['medly']),
      supplement: serializer.fromJson<bool?>(json['supplement']),
      event: serializer.fromJson<String?>(json['event']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'data': serializer.toJson<String>(data),
      'id': serializer.toJson<String>(id),
      'collection_id': serializer.toJson<String>(collectionId),
      'collection_name': serializer.toJson<String>(collectionName),
      'created': serializer.toJson<DateTime>(created),
      'updated': serializer.toJson<DateTime>(updated),
      'deleted': serializer.toJson<bool?>(deleted),
      'synced': serializer.toJson<bool>(synced),
      'fresh': serializer.toJson<bool?>(fresh),
      'user': serializer.toJson<String?>(user),
      'uid': serializer.toJson<String?>(uid),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'public': serializer.toJson<bool?>(public),
      'medly': serializer.toJson<bool?>(medly),
      'supplement': serializer.toJson<bool?>(supplement),
      'event': serializer.toJson<String?>(event),
    };
  }

  LocalPlaylist copyWith(
          {String? data,
          String? id,
          String? collectionId,
          String? collectionName,
          DateTime? created,
          DateTime? updated,
          Value<bool?> deleted = const Value.absent(),
          bool? synced,
          Value<bool?> fresh = const Value.absent(),
          Value<String?> user = const Value.absent(),
          Value<String?> uid = const Value.absent(),
          String? name,
          Value<String?> description = const Value.absent(),
          Value<bool?> public = const Value.absent(),
          Value<bool?> medly = const Value.absent(),
          Value<bool?> supplement = const Value.absent(),
          Value<String?> event = const Value.absent()}) =>
      LocalPlaylist(
        data: data ?? this.data,
        id: id ?? this.id,
        collectionId: collectionId ?? this.collectionId,
        collectionName: collectionName ?? this.collectionName,
        created: created ?? this.created,
        updated: updated ?? this.updated,
        deleted: deleted.present ? deleted.value : this.deleted,
        synced: synced ?? this.synced,
        fresh: fresh.present ? fresh.value : this.fresh,
        user: user.present ? user.value : this.user,
        uid: uid.present ? uid.value : this.uid,
        name: name ?? this.name,
        description: description.present ? description.value : this.description,
        public: public.present ? public.value : this.public,
        medly: medly.present ? medly.value : this.medly,
        supplement: supplement.present ? supplement.value : this.supplement,
        event: event.present ? event.value : this.event,
      );
  @override
  String toString() {
    return (StringBuffer('LocalPlaylist(')
          ..write('data: $data, ')
          ..write('id: $id, ')
          ..write('collectionId: $collectionId, ')
          ..write('collectionName: $collectionName, ')
          ..write('created: $created, ')
          ..write('updated: $updated, ')
          ..write('deleted: $deleted, ')
          ..write('synced: $synced, ')
          ..write('fresh: $fresh, ')
          ..write('user: $user, ')
          ..write('uid: $uid, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('public: $public, ')
          ..write('medly: $medly, ')
          ..write('supplement: $supplement, ')
          ..write('event: $event')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      data,
      id,
      collectionId,
      collectionName,
      created,
      updated,
      deleted,
      synced,
      fresh,
      user,
      uid,
      name,
      description,
      public,
      medly,
      supplement,
      event);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocalPlaylist &&
          other.data == this.data &&
          other.id == this.id &&
          other.collectionId == this.collectionId &&
          other.collectionName == this.collectionName &&
          other.created == this.created &&
          other.updated == this.updated &&
          other.deleted == this.deleted &&
          other.synced == this.synced &&
          other.fresh == this.fresh &&
          other.user == this.user &&
          other.uid == this.uid &&
          other.name == this.name &&
          other.description == this.description &&
          other.public == this.public &&
          other.medly == this.medly &&
          other.supplement == this.supplement &&
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
        data,
        id,
        collectionId,
        collectionName,
        created,
        updated,
        deleted,
        synced,
        fresh,
        user,
        uid,
        name,
        description,
        public,
        medly,
        supplement,
        event
      ];
  @override
  String get aliasedName => _alias ?? entityName;
  @override
  String get entityName => 'local_playlists';
  @override
  Map<SqlDialect, String> get createViewStatements => {
        SqlDialect.sqlite:
            'CREATE VIEW local_playlists AS SELECT *, CAST(json_extract(data, \'\$.name\') AS TEXT) AS name, CASE WHEN json_extract(data, \'\$.description\') IS NOT NULL THEN CAST(json_extract(data, \'\$.description\') AS TEXT) ELSE NULL END AS description, CASE WHEN json_extract(data, \'\$.public\') IS NOT NULL THEN CAST(json_extract(data, \'\$.public\') AS INT) ELSE NULL END AS public, CASE WHEN json_extract(data, \'\$.medly\') IS NOT NULL THEN CAST(json_extract(data, \'\$.medly\') AS INT) ELSE NULL END AS medly, CASE WHEN json_extract(data, \'\$.supplement\') IS NOT NULL THEN CAST(json_extract(data, \'\$.supplement\') AS INT) ELSE NULL END AS supplement, CASE WHEN json_extract(data, \'\$.event\') IS NOT NULL THEN CAST(json_extract(data, \'\$.event\') AS TEXT) ELSE NULL END AS event FROM user_records WHERE collection_name = \'public_playlists\' OR collection_name = \'playlists\'',
      };
  @override
  LocalPlaylists get asDslTable => this;
  @override
  LocalPlaylist map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalPlaylist(
      data: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}data'])!,
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      collectionId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}collection_id'])!,
      collectionName: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}collection_name'])!,
      created: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created'])!,
      updated: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated'])!,
      deleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}deleted']),
      synced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}synced'])!,
      fresh: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}fresh']),
      user: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user']),
      uid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uid']),
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      public: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}public']),
      medly: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}medly']),
      supplement: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}supplement']),
      event: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}event']),
    );
  }

  late final GeneratedColumn<String> data = GeneratedColumn<String>(
      'data', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> collectionId = GeneratedColumn<String>(
      'collection_id', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> collectionName = GeneratedColumn<String>(
      'collection_name', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<DateTime> created = GeneratedColumn<DateTime>(
      'created', aliasedName, false,
      type: DriftSqlType.dateTime);
  late final GeneratedColumn<DateTime> updated = GeneratedColumn<DateTime>(
      'updated', aliasedName, false,
      type: DriftSqlType.dateTime);
  late final GeneratedColumn<bool> deleted = GeneratedColumn<bool>(
      'deleted', aliasedName, true,
      type: DriftSqlType.bool,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("deleted" IN (0, 1))'));
  late final GeneratedColumn<bool> synced = GeneratedColumn<bool>(
      'synced', aliasedName, false,
      type: DriftSqlType.bool,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("synced" IN (0, 1))'));
  late final GeneratedColumn<bool> fresh = GeneratedColumn<bool>(
      'fresh', aliasedName, true,
      type: DriftSqlType.bool,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("fresh" IN (0, 1))'));
  late final GeneratedColumn<String> user = GeneratedColumn<String>(
      'user', aliasedName, true,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> uid = GeneratedColumn<String>(
      'uid', aliasedName, true,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
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
  late final GeneratedColumn<bool> supplement = GeneratedColumn<bool>(
      'supplement', aliasedName, true,
      type: DriftSqlType.bool,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("supplement" IN (0, 1))'));
  late final GeneratedColumn<String> event = GeneratedColumn<String>(
      'event', aliasedName, true,
      type: DriftSqlType.string);
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
  String data;
  String id;
  String collectionId;
  String collectionName;
  DateTime created;
  DateTime updated;
  bool? deleted;
  bool synced;
  bool? fresh;
  String? user;
  String? uid;
  String name;
  String? description;
  bool? public;
  bool? medly;
  bool? supplement;
  String? event;
  Playlist(
      {required this.data,
      required this.id,
      required this.collectionId,
      required this.collectionName,
      required this.created,
      required this.updated,
      this.deleted,
      required this.synced,
      this.fresh,
      this.user,
      this.uid,
      required this.name,
      this.description,
      this.public,
      this.medly,
      this.supplement,
      this.event});
  factory Playlist.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Playlist(
      data: serializer.fromJson<String>(json['data']),
      id: serializer.fromJson<String>(json['id']),
      collectionId: serializer.fromJson<String>(json['collection_id']),
      collectionName: serializer.fromJson<String>(json['collection_name']),
      created: serializer.fromJson<DateTime>(json['created']),
      updated: serializer.fromJson<DateTime>(json['updated']),
      deleted: serializer.fromJson<bool?>(json['deleted']),
      synced: serializer.fromJson<bool>(json['synced']),
      fresh: serializer.fromJson<bool?>(json['fresh']),
      user: serializer.fromJson<String?>(json['user']),
      uid: serializer.fromJson<String?>(json['uid']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      public: serializer.fromJson<bool?>(json['public']),
      medly: serializer.fromJson<bool?>(json['medly']),
      supplement: serializer.fromJson<bool?>(json['supplement']),
      event: serializer.fromJson<String?>(json['event']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'data': serializer.toJson<String>(data),
      'id': serializer.toJson<String>(id),
      'collection_id': serializer.toJson<String>(collectionId),
      'collection_name': serializer.toJson<String>(collectionName),
      'created': serializer.toJson<DateTime>(created),
      'updated': serializer.toJson<DateTime>(updated),
      'deleted': serializer.toJson<bool?>(deleted),
      'synced': serializer.toJson<bool>(synced),
      'fresh': serializer.toJson<bool?>(fresh),
      'user': serializer.toJson<String?>(user),
      'uid': serializer.toJson<String?>(uid),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'public': serializer.toJson<bool?>(public),
      'medly': serializer.toJson<bool?>(medly),
      'supplement': serializer.toJson<bool?>(supplement),
      'event': serializer.toJson<String?>(event),
    };
  }

  Playlist copyWith(
          {String? data,
          String? id,
          String? collectionId,
          String? collectionName,
          DateTime? created,
          DateTime? updated,
          Value<bool?> deleted = const Value.absent(),
          bool? synced,
          Value<bool?> fresh = const Value.absent(),
          Value<String?> user = const Value.absent(),
          Value<String?> uid = const Value.absent(),
          String? name,
          Value<String?> description = const Value.absent(),
          Value<bool?> public = const Value.absent(),
          Value<bool?> medly = const Value.absent(),
          Value<bool?> supplement = const Value.absent(),
          Value<String?> event = const Value.absent()}) =>
      Playlist(
        data: data ?? this.data,
        id: id ?? this.id,
        collectionId: collectionId ?? this.collectionId,
        collectionName: collectionName ?? this.collectionName,
        created: created ?? this.created,
        updated: updated ?? this.updated,
        deleted: deleted.present ? deleted.value : this.deleted,
        synced: synced ?? this.synced,
        fresh: fresh.present ? fresh.value : this.fresh,
        user: user.present ? user.value : this.user,
        uid: uid.present ? uid.value : this.uid,
        name: name ?? this.name,
        description: description.present ? description.value : this.description,
        public: public.present ? public.value : this.public,
        medly: medly.present ? medly.value : this.medly,
        supplement: supplement.present ? supplement.value : this.supplement,
        event: event.present ? event.value : this.event,
      );
  @override
  String toString() {
    return (StringBuffer('Playlist(')
          ..write('data: $data, ')
          ..write('id: $id, ')
          ..write('collectionId: $collectionId, ')
          ..write('collectionName: $collectionName, ')
          ..write('created: $created, ')
          ..write('updated: $updated, ')
          ..write('deleted: $deleted, ')
          ..write('synced: $synced, ')
          ..write('fresh: $fresh, ')
          ..write('user: $user, ')
          ..write('uid: $uid, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('public: $public, ')
          ..write('medly: $medly, ')
          ..write('supplement: $supplement, ')
          ..write('event: $event')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      data,
      id,
      collectionId,
      collectionName,
      created,
      updated,
      deleted,
      synced,
      fresh,
      user,
      uid,
      name,
      description,
      public,
      medly,
      supplement,
      event);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Playlist &&
          other.data == this.data &&
          other.id == this.id &&
          other.collectionId == this.collectionId &&
          other.collectionName == this.collectionName &&
          other.created == this.created &&
          other.updated == this.updated &&
          other.deleted == this.deleted &&
          other.synced == this.synced &&
          other.fresh == this.fresh &&
          other.user == this.user &&
          other.uid == this.uid &&
          other.name == this.name &&
          other.description == this.description &&
          other.public == this.public &&
          other.medly == this.medly &&
          other.supplement == this.supplement &&
          other.event == this.event);
}

class Playlists extends ViewInfo<Playlists, Playlist> implements HasResultSet {
  final String? _alias;
  @override
  final _$HfwDatabase attachedDatabase;
  Playlists(this.attachedDatabase, [this._alias]);
  @override
  List<GeneratedColumn> get $columns => [
        data,
        id,
        collectionId,
        collectionName,
        created,
        updated,
        deleted,
        synced,
        fresh,
        user,
        uid,
        name,
        description,
        public,
        medly,
        supplement,
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
      data: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}data'])!,
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      collectionId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}collection_id'])!,
      collectionName: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}collection_name'])!,
      created: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created'])!,
      updated: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated'])!,
      deleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}deleted']),
      synced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}synced'])!,
      fresh: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}fresh']),
      user: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user']),
      uid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uid']),
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      public: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}public']),
      medly: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}medly']),
      supplement: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}supplement']),
      event: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}event']),
    );
  }

  late final GeneratedColumn<String> data = GeneratedColumn<String>(
      'data', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> collectionId = GeneratedColumn<String>(
      'collection_id', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> collectionName = GeneratedColumn<String>(
      'collection_name', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<DateTime> created = GeneratedColumn<DateTime>(
      'created', aliasedName, false,
      type: DriftSqlType.dateTime);
  late final GeneratedColumn<DateTime> updated = GeneratedColumn<DateTime>(
      'updated', aliasedName, false,
      type: DriftSqlType.dateTime);
  late final GeneratedColumn<bool> deleted = GeneratedColumn<bool>(
      'deleted', aliasedName, true,
      type: DriftSqlType.bool,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("deleted" IN (0, 1))'));
  late final GeneratedColumn<bool> synced = GeneratedColumn<bool>(
      'synced', aliasedName, false,
      type: DriftSqlType.bool,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("synced" IN (0, 1))'));
  late final GeneratedColumn<bool> fresh = GeneratedColumn<bool>(
      'fresh', aliasedName, true,
      type: DriftSqlType.bool,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("fresh" IN (0, 1))'));
  late final GeneratedColumn<String> user = GeneratedColumn<String>(
      'user', aliasedName, true,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> uid = GeneratedColumn<String>(
      'uid', aliasedName, true,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
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
  late final GeneratedColumn<bool> supplement = GeneratedColumn<bool>(
      'supplement', aliasedName, true,
      type: DriftSqlType.bool,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("supplement" IN (0, 1))'));
  late final GeneratedColumn<String> event = GeneratedColumn<String>(
      'event', aliasedName, true,
      type: DriftSqlType.string);
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
  String data;
  String id;
  String collectionId;
  String collectionName;
  DateTime created;
  DateTime updated;
  bool? deleted;
  bool synced;
  bool? fresh;
  String? user;
  String? uid;
  String name;
  String? description;
  bool? public;
  bool? medly;
  bool? supplement;
  String? event;
  PublicPlaylist(
      {required this.data,
      required this.id,
      required this.collectionId,
      required this.collectionName,
      required this.created,
      required this.updated,
      this.deleted,
      required this.synced,
      this.fresh,
      this.user,
      this.uid,
      required this.name,
      this.description,
      this.public,
      this.medly,
      this.supplement,
      this.event});
  factory PublicPlaylist.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PublicPlaylist(
      data: serializer.fromJson<String>(json['data']),
      id: serializer.fromJson<String>(json['id']),
      collectionId: serializer.fromJson<String>(json['collection_id']),
      collectionName: serializer.fromJson<String>(json['collection_name']),
      created: serializer.fromJson<DateTime>(json['created']),
      updated: serializer.fromJson<DateTime>(json['updated']),
      deleted: serializer.fromJson<bool?>(json['deleted']),
      synced: serializer.fromJson<bool>(json['synced']),
      fresh: serializer.fromJson<bool?>(json['fresh']),
      user: serializer.fromJson<String?>(json['user']),
      uid: serializer.fromJson<String?>(json['uid']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      public: serializer.fromJson<bool?>(json['public']),
      medly: serializer.fromJson<bool?>(json['medly']),
      supplement: serializer.fromJson<bool?>(json['supplement']),
      event: serializer.fromJson<String?>(json['event']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'data': serializer.toJson<String>(data),
      'id': serializer.toJson<String>(id),
      'collection_id': serializer.toJson<String>(collectionId),
      'collection_name': serializer.toJson<String>(collectionName),
      'created': serializer.toJson<DateTime>(created),
      'updated': serializer.toJson<DateTime>(updated),
      'deleted': serializer.toJson<bool?>(deleted),
      'synced': serializer.toJson<bool>(synced),
      'fresh': serializer.toJson<bool?>(fresh),
      'user': serializer.toJson<String?>(user),
      'uid': serializer.toJson<String?>(uid),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'public': serializer.toJson<bool?>(public),
      'medly': serializer.toJson<bool?>(medly),
      'supplement': serializer.toJson<bool?>(supplement),
      'event': serializer.toJson<String?>(event),
    };
  }

  PublicPlaylist copyWith(
          {String? data,
          String? id,
          String? collectionId,
          String? collectionName,
          DateTime? created,
          DateTime? updated,
          Value<bool?> deleted = const Value.absent(),
          bool? synced,
          Value<bool?> fresh = const Value.absent(),
          Value<String?> user = const Value.absent(),
          Value<String?> uid = const Value.absent(),
          String? name,
          Value<String?> description = const Value.absent(),
          Value<bool?> public = const Value.absent(),
          Value<bool?> medly = const Value.absent(),
          Value<bool?> supplement = const Value.absent(),
          Value<String?> event = const Value.absent()}) =>
      PublicPlaylist(
        data: data ?? this.data,
        id: id ?? this.id,
        collectionId: collectionId ?? this.collectionId,
        collectionName: collectionName ?? this.collectionName,
        created: created ?? this.created,
        updated: updated ?? this.updated,
        deleted: deleted.present ? deleted.value : this.deleted,
        synced: synced ?? this.synced,
        fresh: fresh.present ? fresh.value : this.fresh,
        user: user.present ? user.value : this.user,
        uid: uid.present ? uid.value : this.uid,
        name: name ?? this.name,
        description: description.present ? description.value : this.description,
        public: public.present ? public.value : this.public,
        medly: medly.present ? medly.value : this.medly,
        supplement: supplement.present ? supplement.value : this.supplement,
        event: event.present ? event.value : this.event,
      );
  @override
  String toString() {
    return (StringBuffer('PublicPlaylist(')
          ..write('data: $data, ')
          ..write('id: $id, ')
          ..write('collectionId: $collectionId, ')
          ..write('collectionName: $collectionName, ')
          ..write('created: $created, ')
          ..write('updated: $updated, ')
          ..write('deleted: $deleted, ')
          ..write('synced: $synced, ')
          ..write('fresh: $fresh, ')
          ..write('user: $user, ')
          ..write('uid: $uid, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('public: $public, ')
          ..write('medly: $medly, ')
          ..write('supplement: $supplement, ')
          ..write('event: $event')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      data,
      id,
      collectionId,
      collectionName,
      created,
      updated,
      deleted,
      synced,
      fresh,
      user,
      uid,
      name,
      description,
      public,
      medly,
      supplement,
      event);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PublicPlaylist &&
          other.data == this.data &&
          other.id == this.id &&
          other.collectionId == this.collectionId &&
          other.collectionName == this.collectionName &&
          other.created == this.created &&
          other.updated == this.updated &&
          other.deleted == this.deleted &&
          other.synced == this.synced &&
          other.fresh == this.fresh &&
          other.user == this.user &&
          other.uid == this.uid &&
          other.name == this.name &&
          other.description == this.description &&
          other.public == this.public &&
          other.medly == this.medly &&
          other.supplement == this.supplement &&
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
        data,
        id,
        collectionId,
        collectionName,
        created,
        updated,
        deleted,
        synced,
        fresh,
        user,
        uid,
        name,
        description,
        public,
        medly,
        supplement,
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
      data: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}data'])!,
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      collectionId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}collection_id'])!,
      collectionName: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}collection_name'])!,
      created: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created'])!,
      updated: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated'])!,
      deleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}deleted']),
      synced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}synced'])!,
      fresh: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}fresh']),
      user: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user']),
      uid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uid']),
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      public: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}public']),
      medly: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}medly']),
      supplement: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}supplement']),
      event: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}event']),
    );
  }

  late final GeneratedColumn<String> data = GeneratedColumn<String>(
      'data', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> collectionId = GeneratedColumn<String>(
      'collection_id', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> collectionName = GeneratedColumn<String>(
      'collection_name', aliasedName, false,
      type: DriftSqlType.string);
  late final GeneratedColumn<DateTime> created = GeneratedColumn<DateTime>(
      'created', aliasedName, false,
      type: DriftSqlType.dateTime);
  late final GeneratedColumn<DateTime> updated = GeneratedColumn<DateTime>(
      'updated', aliasedName, false,
      type: DriftSqlType.dateTime);
  late final GeneratedColumn<bool> deleted = GeneratedColumn<bool>(
      'deleted', aliasedName, true,
      type: DriftSqlType.bool,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("deleted" IN (0, 1))'));
  late final GeneratedColumn<bool> synced = GeneratedColumn<bool>(
      'synced', aliasedName, false,
      type: DriftSqlType.bool,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("synced" IN (0, 1))'));
  late final GeneratedColumn<bool> fresh = GeneratedColumn<bool>(
      'fresh', aliasedName, true,
      type: DriftSqlType.bool,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("fresh" IN (0, 1))'));
  late final GeneratedColumn<String> user = GeneratedColumn<String>(
      'user', aliasedName, true,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> uid = GeneratedColumn<String>(
      'uid', aliasedName, true,
      type: DriftSqlType.string);
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
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
  late final GeneratedColumn<bool> supplement = GeneratedColumn<bool>(
      'supplement', aliasedName, true,
      type: DriftSqlType.bool,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("supplement" IN (0, 1))'));
  late final GeneratedColumn<String> event = GeneratedColumn<String>(
      'event', aliasedName, true,
      type: DriftSqlType.string);
  @override
  PublicPlaylists createAlias(String alias) {
    return PublicPlaylists(attachedDatabase, alias);
  }

  @override
  Query? get query => null;
  @override
  Set<String> get readTables => const {'records'};
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
  static const VerificationMeta _translatedTitleMeta =
      const VerificationMeta('translatedTitle');
  late final GeneratedColumn<String> translatedTitle = GeneratedColumn<String>(
      'translatedTitle', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _numberMeta = const VerificationMeta('number');
  late final GeneratedColumn<String> number = GeneratedColumn<String>(
      'number', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
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
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
      'key', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _skuMeta = const VerificationMeta('sku');
  late final GeneratedColumn<String> sku = GeneratedColumn<String>(
      'sku', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _electronicVersionMeta =
      const VerificationMeta('electronicVersion');
  late final GeneratedColumn<String> electronicVersion =
      GeneratedColumn<String>('electronicVersion', aliasedName, true,
          type: DriftSqlType.string,
          requiredDuringInsert: false,
          $customConstraints: '');
  static const VerificationMeta _tuneNameMeta =
      const VerificationMeta('tuneName');
  late final GeneratedColumn<String> tuneName = GeneratedColumn<String>(
      'tuneName', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _arrangementMeta =
      const VerificationMeta('arrangement');
  late final GeneratedColumn<String> arrangement = GeneratedColumn<String>(
      'arrangement', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _languageMeta =
      const VerificationMeta('language');
  late final GeneratedColumn<String> language = GeneratedColumn<String>(
      'language', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _copyrightMeta =
      const VerificationMeta('copyright');
  late final GeneratedColumn<String> copyright = GeneratedColumn<String>(
      'copyright', aliasedName, true,
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
        translatedTitle,
        number,
        startingKey,
        beatPattern,
        startingPitch,
        startingBeat,
        startingPitchDirection,
        timeSignature,
        complexTimeSignature,
        status,
        key,
        sku,
        electronicVersion,
        tuneName,
        arrangement,
        language,
        copyright,
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
    if (data.containsKey('translatedTitle')) {
      context.handle(
          _translatedTitleMeta,
          translatedTitle.isAcceptableOrUnknown(
              data['translatedTitle']!, _translatedTitleMeta));
    }
    if (data.containsKey('number')) {
      context.handle(_numberMeta,
          number.isAcceptableOrUnknown(data['number']!, _numberMeta));
    } else if (isInserting) {
      context.missing(_numberMeta);
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
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('key')) {
      context.handle(
          _keyMeta, key.isAcceptableOrUnknown(data['key']!, _keyMeta));
    }
    if (data.containsKey('sku')) {
      context.handle(
          _skuMeta, sku.isAcceptableOrUnknown(data['sku']!, _skuMeta));
    }
    if (data.containsKey('electronicVersion')) {
      context.handle(
          _electronicVersionMeta,
          electronicVersion.isAcceptableOrUnknown(
              data['electronicVersion']!, _electronicVersionMeta));
    }
    if (data.containsKey('tuneName')) {
      context.handle(_tuneNameMeta,
          tuneName.isAcceptableOrUnknown(data['tuneName']!, _tuneNameMeta));
    }
    if (data.containsKey('arrangement')) {
      context.handle(
          _arrangementMeta,
          arrangement.isAcceptableOrUnknown(
              data['arrangement']!, _arrangementMeta));
    }
    if (data.containsKey('language')) {
      context.handle(_languageMeta,
          language.isAcceptableOrUnknown(data['language']!, _languageMeta));
    }
    if (data.containsKey('copyright')) {
      context.handle(_copyrightMeta,
          copyright.isAcceptableOrUnknown(data['copyright']!, _copyrightMeta));
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
      translatedTitle: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}translatedTitle']),
      number: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}number'])!,
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
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status']),
      key: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}key']),
      sku: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sku']),
      electronicVersion: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}electronicVersion']),
      tuneName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tuneName']),
      arrangement: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}arrangement']),
      language: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}language']),
      copyright: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}copyright']),
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
  String? translatedTitle;
  String number;
  String? startingKey;
  String? beatPattern;
  String? startingPitch;
  String? startingBeat;
  String? startingPitchDirection;
  String? timeSignature;
  String? complexTimeSignature;
  String? status;
  String? key;
  String? sku;
  String? electronicVersion;
  String? tuneName;
  String? arrangement;
  String? language;
  String? copyright;
  DateTime created;
  DateTime updated;
  Hymn(
      {required this.id,
      required this.title,
      this.translatedTitle,
      required this.number,
      this.startingKey,
      this.beatPattern,
      this.startingPitch,
      this.startingBeat,
      this.startingPitchDirection,
      this.timeSignature,
      this.complexTimeSignature,
      this.status,
      this.key,
      this.sku,
      this.electronicVersion,
      this.tuneName,
      this.arrangement,
      this.language,
      this.copyright,
      required this.created,
      required this.updated});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || translatedTitle != null) {
      map['translatedTitle'] = Variable<String>(translatedTitle);
    }
    map['number'] = Variable<String>(number);
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
    if (!nullToAbsent || status != null) {
      map['status'] = Variable<String>(status);
    }
    if (!nullToAbsent || key != null) {
      map['key'] = Variable<String>(key);
    }
    if (!nullToAbsent || sku != null) {
      map['sku'] = Variable<String>(sku);
    }
    if (!nullToAbsent || electronicVersion != null) {
      map['electronicVersion'] = Variable<String>(electronicVersion);
    }
    if (!nullToAbsent || tuneName != null) {
      map['tuneName'] = Variable<String>(tuneName);
    }
    if (!nullToAbsent || arrangement != null) {
      map['arrangement'] = Variable<String>(arrangement);
    }
    if (!nullToAbsent || language != null) {
      map['language'] = Variable<String>(language);
    }
    if (!nullToAbsent || copyright != null) {
      map['copyright'] = Variable<String>(copyright);
    }
    map['created'] = Variable<DateTime>(created);
    map['updated'] = Variable<DateTime>(updated);
    return map;
  }

  HymnsCompanion toCompanion(bool nullToAbsent) {
    return HymnsCompanion(
      id: Value(id),
      title: Value(title),
      translatedTitle: translatedTitle == null && nullToAbsent
          ? const Value.absent()
          : Value(translatedTitle),
      number: Value(number),
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
      status:
          status == null && nullToAbsent ? const Value.absent() : Value(status),
      key: key == null && nullToAbsent ? const Value.absent() : Value(key),
      sku: sku == null && nullToAbsent ? const Value.absent() : Value(sku),
      electronicVersion: electronicVersion == null && nullToAbsent
          ? const Value.absent()
          : Value(electronicVersion),
      tuneName: tuneName == null && nullToAbsent
          ? const Value.absent()
          : Value(tuneName),
      arrangement: arrangement == null && nullToAbsent
          ? const Value.absent()
          : Value(arrangement),
      language: language == null && nullToAbsent
          ? const Value.absent()
          : Value(language),
      copyright: copyright == null && nullToAbsent
          ? const Value.absent()
          : Value(copyright),
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
      translatedTitle: serializer.fromJson<String?>(json['translatedTitle']),
      number: serializer.fromJson<String>(json['number']),
      startingKey: serializer.fromJson<String?>(json['startingKey']),
      beatPattern: serializer.fromJson<String?>(json['beatPattern']),
      startingPitch: serializer.fromJson<String?>(json['startingPitch']),
      startingBeat: serializer.fromJson<String?>(json['startingBeat']),
      startingPitchDirection:
          serializer.fromJson<String?>(json['startingPitchDirection']),
      timeSignature: serializer.fromJson<String?>(json['timeSignature']),
      complexTimeSignature:
          serializer.fromJson<String?>(json['complexTimeSignature']),
      status: serializer.fromJson<String?>(json['status']),
      key: serializer.fromJson<String?>(json['key']),
      sku: serializer.fromJson<String?>(json['sku']),
      electronicVersion:
          serializer.fromJson<String?>(json['electronicVersion']),
      tuneName: serializer.fromJson<String?>(json['tuneName']),
      arrangement: serializer.fromJson<String?>(json['arrangement']),
      language: serializer.fromJson<String?>(json['language']),
      copyright: serializer.fromJson<String?>(json['copyright']),
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
      'translatedTitle': serializer.toJson<String?>(translatedTitle),
      'number': serializer.toJson<String>(number),
      'startingKey': serializer.toJson<String?>(startingKey),
      'beatPattern': serializer.toJson<String?>(beatPattern),
      'startingPitch': serializer.toJson<String?>(startingPitch),
      'startingBeat': serializer.toJson<String?>(startingBeat),
      'startingPitchDirection':
          serializer.toJson<String?>(startingPitchDirection),
      'timeSignature': serializer.toJson<String?>(timeSignature),
      'complexTimeSignature': serializer.toJson<String?>(complexTimeSignature),
      'status': serializer.toJson<String?>(status),
      'key': serializer.toJson<String?>(key),
      'sku': serializer.toJson<String?>(sku),
      'electronicVersion': serializer.toJson<String?>(electronicVersion),
      'tuneName': serializer.toJson<String?>(tuneName),
      'arrangement': serializer.toJson<String?>(arrangement),
      'language': serializer.toJson<String?>(language),
      'copyright': serializer.toJson<String?>(copyright),
      'created': serializer.toJson<DateTime>(created),
      'updated': serializer.toJson<DateTime>(updated),
    };
  }

  Hymn copyWith(
          {String? id,
          String? title,
          Value<String?> translatedTitle = const Value.absent(),
          String? number,
          Value<String?> startingKey = const Value.absent(),
          Value<String?> beatPattern = const Value.absent(),
          Value<String?> startingPitch = const Value.absent(),
          Value<String?> startingBeat = const Value.absent(),
          Value<String?> startingPitchDirection = const Value.absent(),
          Value<String?> timeSignature = const Value.absent(),
          Value<String?> complexTimeSignature = const Value.absent(),
          Value<String?> status = const Value.absent(),
          Value<String?> key = const Value.absent(),
          Value<String?> sku = const Value.absent(),
          Value<String?> electronicVersion = const Value.absent(),
          Value<String?> tuneName = const Value.absent(),
          Value<String?> arrangement = const Value.absent(),
          Value<String?> language = const Value.absent(),
          Value<String?> copyright = const Value.absent(),
          DateTime? created,
          DateTime? updated}) =>
      Hymn(
        id: id ?? this.id,
        title: title ?? this.title,
        translatedTitle: translatedTitle.present
            ? translatedTitle.value
            : this.translatedTitle,
        number: number ?? this.number,
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
        status: status.present ? status.value : this.status,
        key: key.present ? key.value : this.key,
        sku: sku.present ? sku.value : this.sku,
        electronicVersion: electronicVersion.present
            ? electronicVersion.value
            : this.electronicVersion,
        tuneName: tuneName.present ? tuneName.value : this.tuneName,
        arrangement: arrangement.present ? arrangement.value : this.arrangement,
        language: language.present ? language.value : this.language,
        copyright: copyright.present ? copyright.value : this.copyright,
        created: created ?? this.created,
        updated: updated ?? this.updated,
      );
  @override
  String toString() {
    return (StringBuffer('Hymn(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('translatedTitle: $translatedTitle, ')
          ..write('number: $number, ')
          ..write('startingKey: $startingKey, ')
          ..write('beatPattern: $beatPattern, ')
          ..write('startingPitch: $startingPitch, ')
          ..write('startingBeat: $startingBeat, ')
          ..write('startingPitchDirection: $startingPitchDirection, ')
          ..write('timeSignature: $timeSignature, ')
          ..write('complexTimeSignature: $complexTimeSignature, ')
          ..write('status: $status, ')
          ..write('key: $key, ')
          ..write('sku: $sku, ')
          ..write('electronicVersion: $electronicVersion, ')
          ..write('tuneName: $tuneName, ')
          ..write('arrangement: $arrangement, ')
          ..write('language: $language, ')
          ..write('copyright: $copyright, ')
          ..write('created: $created, ')
          ..write('updated: $updated')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        id,
        title,
        translatedTitle,
        number,
        startingKey,
        beatPattern,
        startingPitch,
        startingBeat,
        startingPitchDirection,
        timeSignature,
        complexTimeSignature,
        status,
        key,
        sku,
        electronicVersion,
        tuneName,
        arrangement,
        language,
        copyright,
        created,
        updated
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Hymn &&
          other.id == this.id &&
          other.title == this.title &&
          other.translatedTitle == this.translatedTitle &&
          other.number == this.number &&
          other.startingKey == this.startingKey &&
          other.beatPattern == this.beatPattern &&
          other.startingPitch == this.startingPitch &&
          other.startingBeat == this.startingBeat &&
          other.startingPitchDirection == this.startingPitchDirection &&
          other.timeSignature == this.timeSignature &&
          other.complexTimeSignature == this.complexTimeSignature &&
          other.status == this.status &&
          other.key == this.key &&
          other.sku == this.sku &&
          other.electronicVersion == this.electronicVersion &&
          other.tuneName == this.tuneName &&
          other.arrangement == this.arrangement &&
          other.language == this.language &&
          other.copyright == this.copyright &&
          other.created == this.created &&
          other.updated == this.updated);
}

class HymnsCompanion extends UpdateCompanion<Hymn> {
  Value<String> id;
  Value<String> title;
  Value<String?> translatedTitle;
  Value<String> number;
  Value<String?> startingKey;
  Value<String?> beatPattern;
  Value<String?> startingPitch;
  Value<String?> startingBeat;
  Value<String?> startingPitchDirection;
  Value<String?> timeSignature;
  Value<String?> complexTimeSignature;
  Value<String?> status;
  Value<String?> key;
  Value<String?> sku;
  Value<String?> electronicVersion;
  Value<String?> tuneName;
  Value<String?> arrangement;
  Value<String?> language;
  Value<String?> copyright;
  Value<DateTime> created;
  Value<DateTime> updated;
  Value<int> rowid;
  HymnsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.translatedTitle = const Value.absent(),
    this.number = const Value.absent(),
    this.startingKey = const Value.absent(),
    this.beatPattern = const Value.absent(),
    this.startingPitch = const Value.absent(),
    this.startingBeat = const Value.absent(),
    this.startingPitchDirection = const Value.absent(),
    this.timeSignature = const Value.absent(),
    this.complexTimeSignature = const Value.absent(),
    this.status = const Value.absent(),
    this.key = const Value.absent(),
    this.sku = const Value.absent(),
    this.electronicVersion = const Value.absent(),
    this.tuneName = const Value.absent(),
    this.arrangement = const Value.absent(),
    this.language = const Value.absent(),
    this.copyright = const Value.absent(),
    this.created = const Value.absent(),
    this.updated = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  HymnsCompanion.insert({
    required String id,
    required String title,
    this.translatedTitle = const Value.absent(),
    required String number,
    this.startingKey = const Value.absent(),
    this.beatPattern = const Value.absent(),
    this.startingPitch = const Value.absent(),
    this.startingBeat = const Value.absent(),
    this.startingPitchDirection = const Value.absent(),
    this.timeSignature = const Value.absent(),
    this.complexTimeSignature = const Value.absent(),
    this.status = const Value.absent(),
    this.key = const Value.absent(),
    this.sku = const Value.absent(),
    this.electronicVersion = const Value.absent(),
    this.tuneName = const Value.absent(),
    this.arrangement = const Value.absent(),
    this.language = const Value.absent(),
    this.copyright = const Value.absent(),
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
    Expression<String>? translatedTitle,
    Expression<String>? number,
    Expression<String>? startingKey,
    Expression<String>? beatPattern,
    Expression<String>? startingPitch,
    Expression<String>? startingBeat,
    Expression<String>? startingPitchDirection,
    Expression<String>? timeSignature,
    Expression<String>? complexTimeSignature,
    Expression<String>? status,
    Expression<String>? key,
    Expression<String>? sku,
    Expression<String>? electronicVersion,
    Expression<String>? tuneName,
    Expression<String>? arrangement,
    Expression<String>? language,
    Expression<String>? copyright,
    Expression<DateTime>? created,
    Expression<DateTime>? updated,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (translatedTitle != null) 'translatedTitle': translatedTitle,
      if (number != null) 'number': number,
      if (startingKey != null) 'startingKey': startingKey,
      if (beatPattern != null) 'beatPattern': beatPattern,
      if (startingPitch != null) 'startingPitch': startingPitch,
      if (startingBeat != null) 'startingBeat': startingBeat,
      if (startingPitchDirection != null)
        'startingPitchDirection': startingPitchDirection,
      if (timeSignature != null) 'timeSignature': timeSignature,
      if (complexTimeSignature != null)
        'complexTimeSignature': complexTimeSignature,
      if (status != null) 'status': status,
      if (key != null) 'key': key,
      if (sku != null) 'sku': sku,
      if (electronicVersion != null) 'electronicVersion': electronicVersion,
      if (tuneName != null) 'tuneName': tuneName,
      if (arrangement != null) 'arrangement': arrangement,
      if (language != null) 'language': language,
      if (copyright != null) 'copyright': copyright,
      if (created != null) 'created': created,
      if (updated != null) 'updated': updated,
      if (rowid != null) 'rowid': rowid,
    });
  }

  HymnsCompanion copyWith(
      {Value<String>? id,
      Value<String>? title,
      Value<String?>? translatedTitle,
      Value<String>? number,
      Value<String?>? startingKey,
      Value<String?>? beatPattern,
      Value<String?>? startingPitch,
      Value<String?>? startingBeat,
      Value<String?>? startingPitchDirection,
      Value<String?>? timeSignature,
      Value<String?>? complexTimeSignature,
      Value<String?>? status,
      Value<String?>? key,
      Value<String?>? sku,
      Value<String?>? electronicVersion,
      Value<String?>? tuneName,
      Value<String?>? arrangement,
      Value<String?>? language,
      Value<String?>? copyright,
      Value<DateTime>? created,
      Value<DateTime>? updated,
      Value<int>? rowid}) {
    return HymnsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      translatedTitle: translatedTitle ?? this.translatedTitle,
      number: number ?? this.number,
      startingKey: startingKey ?? this.startingKey,
      beatPattern: beatPattern ?? this.beatPattern,
      startingPitch: startingPitch ?? this.startingPitch,
      startingBeat: startingBeat ?? this.startingBeat,
      startingPitchDirection:
          startingPitchDirection ?? this.startingPitchDirection,
      timeSignature: timeSignature ?? this.timeSignature,
      complexTimeSignature: complexTimeSignature ?? this.complexTimeSignature,
      status: status ?? this.status,
      key: key ?? this.key,
      sku: sku ?? this.sku,
      electronicVersion: electronicVersion ?? this.electronicVersion,
      tuneName: tuneName ?? this.tuneName,
      arrangement: arrangement ?? this.arrangement,
      language: language ?? this.language,
      copyright: copyright ?? this.copyright,
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
    if (translatedTitle.present) {
      map['translatedTitle'] = Variable<String>(translatedTitle.value);
    }
    if (number.present) {
      map['number'] = Variable<String>(number.value);
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
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (sku.present) {
      map['sku'] = Variable<String>(sku.value);
    }
    if (electronicVersion.present) {
      map['electronicVersion'] = Variable<String>(electronicVersion.value);
    }
    if (tuneName.present) {
      map['tuneName'] = Variable<String>(tuneName.value);
    }
    if (arrangement.present) {
      map['arrangement'] = Variable<String>(arrangement.value);
    }
    if (language.present) {
      map['language'] = Variable<String>(language.value);
    }
    if (copyright.present) {
      map['copyright'] = Variable<String>(copyright.value);
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
          ..write('translatedTitle: $translatedTitle, ')
          ..write('number: $number, ')
          ..write('startingKey: $startingKey, ')
          ..write('beatPattern: $beatPattern, ')
          ..write('startingPitch: $startingPitch, ')
          ..write('startingBeat: $startingBeat, ')
          ..write('startingPitchDirection: $startingPitchDirection, ')
          ..write('timeSignature: $timeSignature, ')
          ..write('complexTimeSignature: $complexTimeSignature, ')
          ..write('status: $status, ')
          ..write('key: $key, ')
          ..write('sku: $sku, ')
          ..write('electronicVersion: $electronicVersion, ')
          ..write('tuneName: $tuneName, ')
          ..write('arrangement: $arrangement, ')
          ..write('language: $language, ')
          ..write('copyright: $copyright, ')
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

class HymnCategories extends Table
    with TableInfo<HymnCategories, HymnCategory> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  HymnCategories(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'PRIMARY KEY AUTOINCREMENT');
  static const VerificationMeta _categoryIdMeta =
      const VerificationMeta('categoryId');
  late final GeneratedColumn<String> categoryId = GeneratedColumn<String>(
      'categoryId', aliasedName, false,
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
      [id, categoryId, hymnId, created, updated];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'hymn_categories';
  @override
  VerificationContext validateIntegrity(Insertable<HymnCategory> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('categoryId')) {
      context.handle(
          _categoryIdMeta,
          categoryId.isAcceptableOrUnknown(
              data['categoryId']!, _categoryIdMeta));
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
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
        {categoryId, hymnId},
      ];
  @override
  HymnCategory map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HymnCategory(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      categoryId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}categoryId'])!,
      hymnId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}hymnId'])!,
      created: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created'])!,
      updated: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated'])!,
    );
  }

  @override
  HymnCategories createAlias(String alias) {
    return HymnCategories(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const ['UNIQUE(categoryId, hymnId)'];
  @override
  bool get dontWriteConstraints => true;
}

class HymnCategory extends DataClass implements Insertable<HymnCategory> {
  int id;
  String categoryId;
  String hymnId;
  DateTime created;
  DateTime updated;
  HymnCategory(
      {required this.id,
      required this.categoryId,
      required this.hymnId,
      required this.created,
      required this.updated});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['categoryId'] = Variable<String>(categoryId);
    map['hymnId'] = Variable<String>(hymnId);
    map['created'] = Variable<DateTime>(created);
    map['updated'] = Variable<DateTime>(updated);
    return map;
  }

  HymnCategoriesCompanion toCompanion(bool nullToAbsent) {
    return HymnCategoriesCompanion(
      id: Value(id),
      categoryId: Value(categoryId),
      hymnId: Value(hymnId),
      created: Value(created),
      updated: Value(updated),
    );
  }

  factory HymnCategory.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HymnCategory(
      id: serializer.fromJson<int>(json['id']),
      categoryId: serializer.fromJson<String>(json['categoryId']),
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
      'categoryId': serializer.toJson<String>(categoryId),
      'hymnId': serializer.toJson<String>(hymnId),
      'created': serializer.toJson<DateTime>(created),
      'updated': serializer.toJson<DateTime>(updated),
    };
  }

  HymnCategory copyWith(
          {int? id,
          String? categoryId,
          String? hymnId,
          DateTime? created,
          DateTime? updated}) =>
      HymnCategory(
        id: id ?? this.id,
        categoryId: categoryId ?? this.categoryId,
        hymnId: hymnId ?? this.hymnId,
        created: created ?? this.created,
        updated: updated ?? this.updated,
      );
  @override
  String toString() {
    return (StringBuffer('HymnCategory(')
          ..write('id: $id, ')
          ..write('categoryId: $categoryId, ')
          ..write('hymnId: $hymnId, ')
          ..write('created: $created, ')
          ..write('updated: $updated')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, categoryId, hymnId, created, updated);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HymnCategory &&
          other.id == this.id &&
          other.categoryId == this.categoryId &&
          other.hymnId == this.hymnId &&
          other.created == this.created &&
          other.updated == this.updated);
}

class HymnCategoriesCompanion extends UpdateCompanion<HymnCategory> {
  Value<int> id;
  Value<String> categoryId;
  Value<String> hymnId;
  Value<DateTime> created;
  Value<DateTime> updated;
  HymnCategoriesCompanion({
    this.id = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.hymnId = const Value.absent(),
    this.created = const Value.absent(),
    this.updated = const Value.absent(),
  });
  HymnCategoriesCompanion.insert({
    this.id = const Value.absent(),
    required String categoryId,
    required String hymnId,
    required DateTime created,
    required DateTime updated,
  })  : categoryId = Value(categoryId),
        hymnId = Value(hymnId),
        created = Value(created),
        updated = Value(updated);
  static Insertable<HymnCategory> custom({
    Expression<int>? id,
    Expression<String>? categoryId,
    Expression<String>? hymnId,
    Expression<DateTime>? created,
    Expression<DateTime>? updated,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (categoryId != null) 'categoryId': categoryId,
      if (hymnId != null) 'hymnId': hymnId,
      if (created != null) 'created': created,
      if (updated != null) 'updated': updated,
    });
  }

  HymnCategoriesCompanion copyWith(
      {Value<int>? id,
      Value<String>? categoryId,
      Value<String>? hymnId,
      Value<DateTime>? created,
      Value<DateTime>? updated}) {
    return HymnCategoriesCompanion(
      id: id ?? this.id,
      categoryId: categoryId ?? this.categoryId,
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
    if (categoryId.present) {
      map['categoryId'] = Variable<String>(categoryId.value);
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
    return (StringBuffer('HymnCategoriesCompanion(')
          ..write('id: $id, ')
          ..write('categoryId: $categoryId, ')
          ..write('hymnId: $hymnId, ')
          ..write('created: $created, ')
          ..write('updated: $updated')
          ..write(')'))
        .toString();
  }
}

class Categories extends Table with TableInfo<Categories, Category> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Categories(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  late final GeneratedColumn<String> price = GeneratedColumn<String>(
      'price', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _limitedMeta =
      const VerificationMeta('limited');
  late final GeneratedColumn<String> limited = GeneratedColumn<String>(
      'limited', aliasedName, true,
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
      [id, name, description, price, limited, created, updated];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'categories';
  @override
  VerificationContext validateIntegrity(Insertable<Category> instance,
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
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    }
    if (data.containsKey('limited')) {
      context.handle(_limitedMeta,
          limited.isAcceptableOrUnknown(data['limited']!, _limitedMeta));
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
  Category map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Category(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}price']),
      limited: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}limited']),
      created: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created'])!,
      updated: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated'])!,
    );
  }

  @override
  Categories createAlias(String alias) {
    return Categories(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const ['UNIQUE(name)'];
  @override
  bool get dontWriteConstraints => true;
}

class Category extends DataClass implements Insertable<Category> {
  String id;
  String name;
  String description;
  String? price;
  String? limited;
  DateTime created;
  DateTime updated;
  Category(
      {required this.id,
      required this.name,
      required this.description,
      this.price,
      this.limited,
      required this.created,
      required this.updated});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    if (!nullToAbsent || price != null) {
      map['price'] = Variable<String>(price);
    }
    if (!nullToAbsent || limited != null) {
      map['limited'] = Variable<String>(limited);
    }
    map['created'] = Variable<DateTime>(created);
    map['updated'] = Variable<DateTime>(updated);
    return map;
  }

  CategoriesCompanion toCompanion(bool nullToAbsent) {
    return CategoriesCompanion(
      id: Value(id),
      name: Value(name),
      description: Value(description),
      price:
          price == null && nullToAbsent ? const Value.absent() : Value(price),
      limited: limited == null && nullToAbsent
          ? const Value.absent()
          : Value(limited),
      created: Value(created),
      updated: Value(updated),
    );
  }

  factory Category.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Category(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      price: serializer.fromJson<String?>(json['price']),
      limited: serializer.fromJson<String?>(json['limited']),
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
      'description': serializer.toJson<String>(description),
      'price': serializer.toJson<String?>(price),
      'limited': serializer.toJson<String?>(limited),
      'created': serializer.toJson<DateTime>(created),
      'updated': serializer.toJson<DateTime>(updated),
    };
  }

  Category copyWith(
          {String? id,
          String? name,
          String? description,
          Value<String?> price = const Value.absent(),
          Value<String?> limited = const Value.absent(),
          DateTime? created,
          DateTime? updated}) =>
      Category(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        price: price.present ? price.value : this.price,
        limited: limited.present ? limited.value : this.limited,
        created: created ?? this.created,
        updated: updated ?? this.updated,
      );
  @override
  String toString() {
    return (StringBuffer('Category(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('price: $price, ')
          ..write('limited: $limited, ')
          ..write('created: $created, ')
          ..write('updated: $updated')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, description, price, limited, created, updated);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Category &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.price == this.price &&
          other.limited == this.limited &&
          other.created == this.created &&
          other.updated == this.updated);
}

class CategoriesCompanion extends UpdateCompanion<Category> {
  Value<String> id;
  Value<String> name;
  Value<String> description;
  Value<String?> price;
  Value<String?> limited;
  Value<DateTime> created;
  Value<DateTime> updated;
  Value<int> rowid;
  CategoriesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.price = const Value.absent(),
    this.limited = const Value.absent(),
    this.created = const Value.absent(),
    this.updated = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CategoriesCompanion.insert({
    required String id,
    required String name,
    required String description,
    this.price = const Value.absent(),
    this.limited = const Value.absent(),
    required DateTime created,
    required DateTime updated,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        description = Value(description),
        created = Value(created),
        updated = Value(updated);
  static Insertable<Category> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? price,
    Expression<String>? limited,
    Expression<DateTime>? created,
    Expression<DateTime>? updated,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (price != null) 'price': price,
      if (limited != null) 'limited': limited,
      if (created != null) 'created': created,
      if (updated != null) 'updated': updated,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CategoriesCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String>? description,
      Value<String?>? price,
      Value<String?>? limited,
      Value<DateTime>? created,
      Value<DateTime>? updated,
      Value<int>? rowid}) {
    return CategoriesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      limited: limited ?? this.limited,
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
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (price.present) {
      map['price'] = Variable<String>(price.value);
    }
    if (limited.present) {
      map['limited'] = Variable<String>(limited.value);
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
    return (StringBuffer('CategoriesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('price: $price, ')
          ..write('limited: $limited, ')
          ..write('created: $created, ')
          ..write('updated: $updated, ')
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
      alias: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}alias'])!,
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
  String alias;
  DateTime created;
  DateTime updated;
  Topic(
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

  TopicsCompanion toCompanion(bool nullToAbsent) {
    return TopicsCompanion(
      id: Value(id),
      name: Value(name),
      alias: Value(alias),
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

  Topic copyWith(
          {String? id,
          String? name,
          String? alias,
          DateTime? created,
          DateTime? updated}) =>
      Topic(
        id: id ?? this.id,
        name: name ?? this.name,
        alias: alias ?? this.alias,
        created: created ?? this.created,
        updated: updated ?? this.updated,
      );
  @override
  String toString() {
    return (StringBuffer('Topic(')
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
      (other is Topic &&
          other.id == this.id &&
          other.name == this.name &&
          other.alias == this.alias &&
          other.created == this.created &&
          other.updated == this.updated);
}

class TopicsCompanion extends UpdateCompanion<Topic> {
  Value<String> id;
  Value<String> name;
  Value<String> alias;
  Value<DateTime> created;
  Value<DateTime> updated;
  Value<int> rowid;
  TopicsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.alias = const Value.absent(),
    this.created = const Value.absent(),
    this.updated = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TopicsCompanion.insert({
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
  static Insertable<Topic> custom({
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

  TopicsCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String>? alias,
      Value<DateTime>? created,
      Value<DateTime>? updated,
      Value<int>? rowid}) {
    return TopicsCompanion(
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
    return (StringBuffer('TopicsCompanion(')
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
        {hymnId},
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
  List<String> get customConstraints => const ['UNIQUE(hymnId)'];
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
  static const VerificationMeta _collectionMeta =
      const VerificationMeta('collection');
  late final GeneratedColumn<String> collection = GeneratedColumn<String>(
      'collection', aliasedName, false,
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
      [id, collection, synced, created, updated];
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
    if (data.containsKey('collection')) {
      context.handle(
          _collectionMeta,
          collection.isAcceptableOrUnknown(
              data['collection']!, _collectionMeta));
    } else if (isInserting) {
      context.missing(_collectionMeta);
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
        {collection},
      ];
  @override
  RecordsCacheData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RecordsCacheData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      collection: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}collection'])!,
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
  List<String> get customConstraints => const ['UNIQUE(collection)'];
  @override
  bool get dontWriteConstraints => true;
}

class RecordsCacheData extends DataClass
    implements Insertable<RecordsCacheData> {
  int id;
  String collection;
  bool synced;
  DateTime created;
  DateTime updated;
  RecordsCacheData(
      {required this.id,
      required this.collection,
      required this.synced,
      required this.created,
      required this.updated});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['collection'] = Variable<String>(collection);
    map['synced'] = Variable<bool>(synced);
    map['created'] = Variable<DateTime>(created);
    map['updated'] = Variable<DateTime>(updated);
    return map;
  }

  RecordsCacheCompanion toCompanion(bool nullToAbsent) {
    return RecordsCacheCompanion(
      id: Value(id),
      collection: Value(collection),
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
      collection: serializer.fromJson<String>(json['collection']),
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
      'collection': serializer.toJson<String>(collection),
      'synced': serializer.toJson<bool>(synced),
      'created': serializer.toJson<DateTime>(created),
      'updated': serializer.toJson<DateTime>(updated),
    };
  }

  RecordsCacheData copyWith(
          {int? id,
          String? collection,
          bool? synced,
          DateTime? created,
          DateTime? updated}) =>
      RecordsCacheData(
        id: id ?? this.id,
        collection: collection ?? this.collection,
        synced: synced ?? this.synced,
        created: created ?? this.created,
        updated: updated ?? this.updated,
      );
  @override
  String toString() {
    return (StringBuffer('RecordsCacheData(')
          ..write('id: $id, ')
          ..write('collection: $collection, ')
          ..write('synced: $synced, ')
          ..write('created: $created, ')
          ..write('updated: $updated')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, collection, synced, created, updated);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RecordsCacheData &&
          other.id == this.id &&
          other.collection == this.collection &&
          other.synced == this.synced &&
          other.created == this.created &&
          other.updated == this.updated);
}

class RecordsCacheCompanion extends UpdateCompanion<RecordsCacheData> {
  Value<int> id;
  Value<String> collection;
  Value<bool> synced;
  Value<DateTime> created;
  Value<DateTime> updated;
  RecordsCacheCompanion({
    this.id = const Value.absent(),
    this.collection = const Value.absent(),
    this.synced = const Value.absent(),
    this.created = const Value.absent(),
    this.updated = const Value.absent(),
  });
  RecordsCacheCompanion.insert({
    this.id = const Value.absent(),
    required String collection,
    this.synced = const Value.absent(),
    required DateTime created,
    required DateTime updated,
  })  : collection = Value(collection),
        created = Value(created),
        updated = Value(updated);
  static Insertable<RecordsCacheData> custom({
    Expression<int>? id,
    Expression<String>? collection,
    Expression<bool>? synced,
    Expression<DateTime>? created,
    Expression<DateTime>? updated,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (collection != null) 'collection': collection,
      if (synced != null) 'synced': synced,
      if (created != null) 'created': created,
      if (updated != null) 'updated': updated,
    });
  }

  RecordsCacheCompanion copyWith(
      {Value<int>? id,
      Value<String>? collection,
      Value<bool>? synced,
      Value<DateTime>? created,
      Value<DateTime>? updated}) {
    return RecordsCacheCompanion(
      id: id ?? this.id,
      collection: collection ?? this.collection,
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
    if (collection.present) {
      map['collection'] = Variable<String>(collection.value);
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
          ..write('collection: $collection, ')
          ..write('synced: $synced, ')
          ..write('created: $created, ')
          ..write('updated: $updated')
          ..write(')'))
        .toString();
  }
}

class RecordsFts extends Table
    with
        TableInfo<RecordsFts, RecordsFt>,
        VirtualTableInfo<RecordsFts, RecordsFt> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  RecordsFts(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _dataMeta = const VerificationMeta('data');
  late final GeneratedColumn<String> data = GeneratedColumn<String>(
      'data', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: '');
  @override
  List<GeneratedColumn> get $columns => [data];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'records_fts';
  @override
  VerificationContext validateIntegrity(Insertable<RecordsFt> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('data')) {
      context.handle(
          _dataMeta, this.data.isAcceptableOrUnknown(data['data']!, _dataMeta));
    } else if (isInserting) {
      context.missing(_dataMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  RecordsFt map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RecordsFt(
      data: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}data'])!,
    );
  }

  @override
  RecordsFts createAlias(String alias) {
    return RecordsFts(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
  @override
  String get moduleAndArgs => 'fts5(data, content=records, content_rowid=id)';
}

class RecordsFt extends DataClass implements Insertable<RecordsFt> {
  String data;
  RecordsFt({required this.data});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['data'] = Variable<String>(data);
    return map;
  }

  RecordsFtsCompanion toCompanion(bool nullToAbsent) {
    return RecordsFtsCompanion(
      data: Value(data),
    );
  }

  factory RecordsFt.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RecordsFt(
      data: serializer.fromJson<String>(json['data']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'data': serializer.toJson<String>(data),
    };
  }

  RecordsFt copyWith({String? data}) => RecordsFt(
        data: data ?? this.data,
      );
  @override
  String toString() {
    return (StringBuffer('RecordsFt(')
          ..write('data: $data')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => data.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is RecordsFt && other.data == this.data);
}

class RecordsFtsCompanion extends UpdateCompanion<RecordsFt> {
  Value<String> data;
  Value<int> rowid;
  RecordsFtsCompanion({
    this.data = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RecordsFtsCompanion.insert({
    required String data,
    this.rowid = const Value.absent(),
  }) : data = Value(data);
  static Insertable<RecordsFt> custom({
    Expression<String>? data,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (data != null) 'data': data,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RecordsFtsCompanion copyWith({Value<String>? data, Value<int>? rowid}) {
    return RecordsFtsCompanion(
      data: data ?? this.data,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (data.present) {
      map['data'] = Variable<String>(data.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecordsFtsCompanion(')
          ..write('data: $data, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$HfwDatabase extends GeneratedDatabase {
  _$HfwDatabase(QueryExecutor e) : super(e);
  late final Users users = Users(this);
  late final RequestCache requestCache = RequestCache(this);
  late final Index requestCacheIdxUrl = Index('request_cache_idx_url',
      'CREATE INDEX request_cache_idx_url ON request_cache (url)');
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
  late final UserPlaylistLibrary userPlaylistLibrary =
      UserPlaylistLibrary(this);
  late final LocalPlaylists localPlaylists = LocalPlaylists(this);
  late final Playlists playlists = Playlists(this);
  late final PublicPlaylists publicPlaylists = PublicPlaylists(this);
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
  late final HymnCategories hymnCategories = HymnCategories(this);
  late final Index hymnCategoriesIdxHymnId = Index('hymn_categories_idx_hymnId',
      'CREATE INDEX hymn_categories_idx_hymnId ON hymn_categories (hymnId)');
  late final Index hymnCategoriesIdxCategoryId = Index(
      'hymn_categories_idx_categoryId',
      'CREATE INDEX hymn_categories_idx_categoryId ON hymn_categories (categoryId)');
  late final Trigger hymnCategoriesDeleteHymn = Trigger(
      'CREATE TRIGGER hymn_categories_delete_hymn AFTER DELETE ON hymns BEGIN DELETE FROM hymn_categories WHERE hymnId = old.id;END',
      'hymn_categories_delete_hymn');
  late final Categories categories = Categories(this);
  late final Trigger hymnCategoriesDeleteCategory = Trigger(
      'CREATE TRIGGER hymn_categories_delete_category AFTER DELETE ON categories BEGIN DELETE FROM hymn_categories WHERE categoryId = old.id;END',
      'hymn_categories_delete_category');
  late final Index categoriesIdxName = Index('categories_idx_name',
      'CREATE INDEX categories_idx_name ON categories (name)');
  late final Index categoriesIdxDescription = Index(
      'categories_idx_description',
      'CREATE INDEX categories_idx_description ON categories (description)');
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
  late final Index topicsIdxAlias = Index(
      'topics_idx_alias', 'CREATE INDEX topics_idx_alias ON topics (alias)');
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
  late final RecordsFts recordsFts = RecordsFts(this);
  late final Trigger recordsFtsInsert = Trigger(
      'CREATE TRIGGER records_fts_insert AFTER INSERT ON records BEGIN INSERT INTO records_fts ("rowid", data) VALUES (new."ROWID", new.data);END',
      'records_fts_insert');
  late final Trigger recordsFtsUpdate = Trigger(
      'CREATE TRIGGER records_fts_update AFTER UPDATE ON records BEGIN UPDATE records_fts SET data = new.data WHERE "rowid" = old."ROWID";END',
      'records_fts_update');
  late final Trigger recordsFtsDelete = Trigger(
      'CREATE TRIGGER records_fts_delete AFTER DELETE ON records BEGIN INSERT INTO records_fts (records_fts, "rowid", data) VALUES (\'delete\', old."ROWID", old.data);END',
      'records_fts_delete');
  late final Index recordsIdxData = Index(
      'records_idx_data', 'CREATE INDEX records_idx_data ON records (data)');
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

  Selectable<UserLibraryData> getUserLibrary(String? user) {
    return customSelect(
        'SELECT * FROM user_library WHERE(user = ?1 OR uid = ?1)',
        variables: [
          Variable<String>(user)
        ],
        readsFrom: {
          records,
        }).asyncMap(userLibrary.mapFromRow);
  }

  Selectable<UserLibraryData> getUserLibraryMatch(String? user, String? hymnId,
      String? playlistId, String? topicId, String? stakeholderId) {
    return customSelect(
        'SELECT * FROM user_library WHERE(user = ?1 OR uid = ?1)AND(hymn_id = ?2 AND playlist_id = ?3 AND topic_id = ?4 AND stakeholder_id = ?5)',
        variables: [
          Variable<String>(user),
          Variable<String>(hymnId),
          Variable<String>(playlistId),
          Variable<String>(topicId),
          Variable<String>(stakeholderId)
        ],
        readsFrom: {
          records,
        }).asyncMap(userLibrary.mapFromRow);
  }

  Selectable<UserLibraryData> getUserLibraryById(String? user, String id) {
    return customSelect(
        'SELECT * FROM user_library WHERE(user = ?1 OR uid = ?1)AND id = ?2',
        variables: [
          Variable<String>(user),
          Variable<String>(id)
        ],
        readsFrom: {
          records,
        }).asyncMap(userLibrary.mapFromRow);
  }

  Selectable<UserLibraryData> getUserHymnLibrary(String? user) {
    return customSelect(
        'SELECT * FROM user_library WHERE(user = ?1 OR uid = ?1)AND hymn_id IS NOT NULL AND hymn_id != \'\'',
        variables: [
          Variable<String>(user)
        ],
        readsFrom: {
          records,
        }).asyncMap(userLibrary.mapFromRow);
  }

  Selectable<UserLibraryData> getUserStakeholderLibrary(String? user) {
    return customSelect(
        'SELECT * FROM user_library WHERE(user = ?1 OR uid = ?1)AND stakeholder_id IS NOT NULL AND stakeholder_id != \'\'',
        variables: [
          Variable<String>(user)
        ],
        readsFrom: {
          records,
        }).asyncMap(userLibrary.mapFromRow);
  }

  Selectable<UserLibraryData> getUserTopicLibrary(String? user) {
    return customSelect(
        'SELECT * FROM user_library WHERE(user = ?1 OR uid = ?1)AND topic_id IS NOT NULL AND topic_id != \'\'',
        variables: [
          Variable<String>(user)
        ],
        readsFrom: {
          records,
        }).asyncMap(userLibrary.mapFromRow);
  }

  Selectable<UserPlaylistLibraryData> getUserPlaylistLibrary(String? user) {
    return customSelect(
        'SELECT * FROM user_playlist_library WHERE user = ?1 OR uid = ?1',
        variables: [
          Variable<String>(user)
        ],
        readsFrom: {
          records,
        }).asyncMap(userPlaylistLibrary.mapFromRow);
  }

  Selectable<UserPlaylistLibraryData> getUserPlaylistLibraryById(
      String? user, String id) {
    return customSelect(
        'SELECT * FROM user_playlist_library WHERE(user = ?1 OR uid = ?1)AND id = ?2',
        variables: [
          Variable<String>(user),
          Variable<String>(id)
        ],
        readsFrom: {
          records,
        }).asyncMap(userPlaylistLibrary.mapFromRow);
  }

  Selectable<UserPlaylistLibraryData> getUserPlaylistLibraryByPlaylistId(
      String? user, String playlistId) {
    return customSelect(
        'SELECT * FROM user_playlist_library WHERE(user = ?1 OR uid = ?1)AND playlist_id = ?2',
        variables: [
          Variable<String>(user),
          Variable<String>(playlistId)
        ],
        readsFrom: {
          records,
        }).asyncMap(userPlaylistLibrary.mapFromRow);
  }

  Selectable<Playlist> getPlaylists(String? user) {
    return customSelect(
        'SELECT * FROM playlists WHERE user = ?1 ORDER BY updated DESC',
        variables: [
          Variable<String>(user)
        ],
        readsFrom: {
          records,
        }).asyncMap(playlists.mapFromRow);
  }

  Selectable<Playlist> getPlaylist(String? user, String id) {
    return customSelect('SELECT * FROM playlists WHERE user = ?1 AND id = ?2',
        variables: [
          Variable<String>(user),
          Variable<String>(id)
        ],
        readsFrom: {
          records,
        }).asyncMap(playlists.mapFromRow);
  }

  Selectable<PublicPlaylist> getPublicPlaylists() {
    return customSelect(
        'SELECT * FROM public_playlists WHERE deleted != 1 ORDER BY updated DESC',
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

  Selectable<Playlist> getPlaylistByUserAndId(String? user, String id) {
    return customSelect('SELECT * FROM playlists WHERE user = ?1 AND id = ?2',
        variables: [
          Variable<String>(user),
          Variable<String>(id)
        ],
        readsFrom: {
          records,
        }).asyncMap(playlists.mapFromRow);
  }

  Selectable<PublicPlaylist> getPublicPlaylistByUserAndId(
      String? user, String id) {
    return customSelect(
        'SELECT * FROM public_playlists WHERE user = ?1 AND id = ?2',
        variables: [
          Variable<String>(user),
          Variable<String>(id)
        ],
        readsFrom: {
          records,
        }).asyncMap(publicPlaylists.mapFromRow);
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

  Selectable<GetPortionsWithHymnIdResult> getPortionsWithHymnId() {
    return customSelect(
        'SELECT p.*, hp.hymnId FROM portions AS p INNER JOIN hymn_portions AS hp ON hp.portionId = p.id',
        variables: [],
        readsFrom: {
          hymnPortions,
          portions,
        }).map((QueryRow row) => GetPortionsWithHymnIdResult(
          id: row.read<String>('id'),
          name: row.read<String>('name'),
          lyrics: row.read<String>('lyrics'),
          hymnPortionId: row.readNullable<String>('hymnPortionId'),
          created: row.read<DateTime>('created'),
          updated: row.read<DateTime>('updated'),
          hymnId: row.read<String>('hymnId'),
        ));
  }

  Selectable<GetPortionsWithHymnIdByHymnIdResult> getPortionsWithHymnIdByHymnId(
      String hymnId) {
    return customSelect(
        'SELECT"portion"."id" AS "nested_0.id", "portion"."name" AS "nested_0.name", "portion"."lyrics" AS "nested_0.lyrics", "portion"."hymnPortionId" AS "nested_0.hymnPortionId", "portion"."created" AS "nested_0.created", "portion"."updated" AS "nested_0.updated", hp.hymnId FROM portions AS portion INNER JOIN hymn_portions AS hp ON hp.portionId = portion.id WHERE hp.hymnId = ?1',
        variables: [
          Variable<String>(hymnId)
        ],
        readsFrom: {
          hymnPortions,
          portions,
        }).asyncMap((QueryRow row) async => GetPortionsWithHymnIdByHymnIdResult(
          portion: await portions.mapFromRow(row, tablePrefix: 'nested_0'),
          hymnId: row.read<String>('hymnId'),
        ));
  }

  Selectable<SearchPortionsResult> searchPortions(String query) {
    return customSelect(
        'SELECT"portion"."id" AS "nested_0.id", "portion"."name" AS "nested_0.name", "portion"."lyrics" AS "nested_0.lyrics", "portion"."hymnPortionId" AS "nested_0.hymnPortionId", "portion"."created" AS "nested_0.created", "portion"."updated" AS "nested_0.updated","hymnPortion"."id" AS "nested_1.id", "hymnPortion"."portionId" AS "nested_1.portionId", "hymnPortion"."hymnId" AS "nested_1.hymnId", "hymnPortion"."created" AS "nested_1.created", "hymnPortion"."updated" AS "nested_1.updated" FROM hymn_portions AS hymnPortion INNER JOIN portions AS portion ON portion.id = hymnPortion.portionId WHERE portion.name LIKE ?1 OR portion.lyrics LIKE ?1 ORDER BY portion.name ASC',
        variables: [
          Variable<String>(query)
        ],
        readsFrom: {
          hymnPortions,
          portions,
        }).asyncMap((QueryRow row) async => SearchPortionsResult(
          portion: await portions.mapFromRow(row, tablePrefix: 'nested_0'),
          hymnPortion:
              await hymnPortions.mapFromRow(row, tablePrefix: 'nested_1'),
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

  Selectable<Hymnal> searchHymnals(String query) {
    return customSelect(
        'SELECT * FROM hymnals WHERE(name LIKE ?1 OR alias LIKE ?1)AND id != \'000000000000004\' ORDER BY name ASC',
        variables: [
          Variable<String>(query)
        ],
        readsFrom: {
          hymnals,
        }).asyncMap(hymnals.mapFromRow);
  }

  Selectable<Hymnal> getHymnals() {
    return customSelect(
        'SELECT * FROM hymnals WHERE id != \'000000000000004\' ORDER BY name ASC',
        variables: [],
        readsFrom: {
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

  Selectable<HymnCategory> getHymnCategories() {
    return customSelect('SELECT * FROM hymn_categories',
        variables: [],
        readsFrom: {
          hymnCategories,
        }).asyncMap(hymnCategories.mapFromRow);
  }

  Selectable<HymnCategory> getHymnCategory(int id) {
    return customSelect('SELECT * FROM hymn_categories WHERE id = ?1',
        variables: [
          Variable<int>(id)
        ],
        readsFrom: {
          hymnCategories,
        }).asyncMap(hymnCategories.mapFromRow);
  }

  Selectable<HymnCategory> getHymnCategoriesByCategoryId(String categoryId) {
    return customSelect('SELECT * FROM hymn_categories WHERE categoryId = ?1',
        variables: [
          Variable<String>(categoryId)
        ],
        readsFrom: {
          hymnCategories,
        }).asyncMap(hymnCategories.mapFromRow);
  }

  Selectable<HymnCategory> getHymnCategoriesByHymnId(String hymnId) {
    return customSelect('SELECT * FROM hymn_categories WHERE hymnId = ?1',
        variables: [
          Variable<String>(hymnId)
        ],
        readsFrom: {
          hymnCategories,
        }).asyncMap(hymnCategories.mapFromRow);
  }

  Future<List<HymnCategory>> createHymnCategory(
      String categoryId, String hymnId, DateTime created, DateTime updated) {
    return customWriteReturning(
        'INSERT OR REPLACE INTO hymn_categories (categoryId, hymnId, created, updated) VALUES (?1, ?2, ?3, ?4) RETURNING *',
        variables: [
          Variable<String>(categoryId),
          Variable<String>(hymnId),
          Variable<DateTime>(created),
          Variable<DateTime>(updated)
        ],
        updates: {
          hymnCategories
        }).then((rows) => Future.wait(rows.map(hymnCategories.mapFromRow)));
  }

  Future<int> updateHymnCategory(
      String categoryId, String hymnId, DateTime updated, int id) {
    return customUpdate(
      'UPDATE hymn_categories SET categoryId = ?1, hymnId = ?2, updated = ?3 WHERE id = ?4',
      variables: [
        Variable<String>(categoryId),
        Variable<String>(hymnId),
        Variable<DateTime>(updated),
        Variable<int>(id)
      ],
      updates: {hymnCategories},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> deleteHymnCategory(int id) {
    return customUpdate(
      'DELETE FROM hymn_categories WHERE id = ?1',
      variables: [Variable<int>(id)],
      updates: {hymnCategories},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> deleteHymnCategories() {
    return customUpdate(
      'DELETE FROM hymn_categories',
      variables: [],
      updates: {hymnCategories},
      updateKind: UpdateKind.delete,
    );
  }

  Selectable<Hymn> getHymnsByCategoryId(String categoryId) {
    return customSelect(
        'SELECT h.* FROM hymns AS h WHERE EXISTS (SELECT hymnId FROM hymn_categories WHERE hymnId = h.id AND categoryId = ?1)',
        variables: [
          Variable<String>(categoryId)
        ],
        readsFrom: {
          hymns,
          hymnCategories,
        }).asyncMap(hymns.mapFromRow);
  }

  Selectable<Category> getCategoriesByHymnId(String hymnId) {
    return customSelect(
        'SELECT t.* FROM categories AS t WHERE EXISTS (SELECT categoryId FROM hymn_categories WHERE categoryId = t.id AND hymnId = ?1)',
        variables: [
          Variable<String>(hymnId)
        ],
        readsFrom: {
          categories,
          hymnCategories,
        }).asyncMap(categories.mapFromRow);
  }

  Selectable<GetCategoriesWithHymnIdResult> getCategoriesWithHymnId() {
    return customSelect(
        'SELECT t.*, ht.hymnId FROM categories AS t INNER JOIN hymn_categories AS ht ON ht.categoryId = t.id',
        variables: [],
        readsFrom: {
          hymnCategories,
          categories,
        }).map((QueryRow row) => GetCategoriesWithHymnIdResult(
          id: row.read<String>('id'),
          name: row.read<String>('name'),
          description: row.read<String>('description'),
          price: row.readNullable<String>('price'),
          limited: row.readNullable<String>('limited'),
          created: row.read<DateTime>('created'),
          updated: row.read<DateTime>('updated'),
          hymnId: row.read<String>('hymnId'),
        ));
  }

  Selectable<Hymn> getPublicDomainHymns() {
    return customSelect(
        'SELECT h.* FROM hymns AS h WHERE EXISTS (SELECT hymnId FROM hymn_categories WHERE hymnId = h.id AND categoryId = \'hcdtp5ebb7c5b0f\')',
        variables: [],
        readsFrom: {
          hymns,
          hymnCategories,
        }).asyncMap(hymns.mapFromRow);
  }

  Selectable<Category> getCategories() {
    return customSelect('SELECT * FROM categories ORDER BY name ASC',
        variables: [],
        readsFrom: {
          categories,
        }).asyncMap(categories.mapFromRow);
  }

  Selectable<Category> getCategory(String id) {
    return customSelect('SELECT * FROM categories WHERE id = ?1', variables: [
      Variable<String>(id)
    ], readsFrom: {
      categories,
    }).asyncMap(categories.mapFromRow);
  }

  Selectable<Category> getCategoryByName(String name) {
    return customSelect('SELECT * FROM categories WHERE name = ?1', variables: [
      Variable<String>(name)
    ], readsFrom: {
      categories,
    }).asyncMap(categories.mapFromRow);
  }

  Future<List<Category>> createCategory(String id, String name,
      String description, DateTime created, DateTime updated) {
    return customWriteReturning(
        'INSERT OR REPLACE INTO categories (id, name, description, created, updated) VALUES (?1, ?2, ?3, ?4, ?5) RETURNING *',
        variables: [
          Variable<String>(id),
          Variable<String>(name),
          Variable<String>(description),
          Variable<DateTime>(created),
          Variable<DateTime>(updated)
        ],
        updates: {
          categories
        }).then((rows) => Future.wait(rows.map(categories.mapFromRow)));
  }

  Future<int> updateCategory(
      String name, String description, DateTime updated, String id) {
    return customUpdate(
      'UPDATE categories SET name = ?1, description = ?2, updated = ?3 WHERE id = ?4',
      variables: [
        Variable<String>(name),
        Variable<String>(description),
        Variable<DateTime>(updated),
        Variable<String>(id)
      ],
      updates: {categories},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> deleteCategory(String id) {
    return customUpdate(
      'DELETE FROM categories WHERE id = ?1',
      variables: [Variable<String>(id)],
      updates: {categories},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> deleteCategoryByName(String name) {
    return customUpdate(
      'DELETE FROM categories WHERE name = ?1',
      variables: [Variable<String>(name)],
      updates: {categories},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> deleteCategories() {
    return customUpdate(
      'DELETE FROM categories',
      variables: [],
      updates: {categories},
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

  Selectable<GetScripturesWithHymnIdResult> getScripturesWithHymnId() {
    return customSelect(
        'SELECT s.*, hs.hymnId FROM scriptures AS s INNER JOIN hymn_scriptures AS hs ON hs.scriptureId = s.id',
        variables: [],
        readsFrom: {
          hymnScriptures,
          scriptures,
        }).map((QueryRow row) => GetScripturesWithHymnIdResult(
          id: row.read<String>('id'),
          name: row.read<String>('name'),
          created: row.read<DateTime>('created'),
          updated: row.read<DateTime>('updated'),
          hymnId: row.read<String>('hymnId'),
        ));
  }

  Selectable<Scripture> searchScriptures(String query) {
    return customSelect(
        'SELECT * FROM scriptures WHERE name LIKE ?1 ORDER BY name ASC',
        variables: [
          Variable<String>(query)
        ],
        readsFrom: {
          scriptures,
        }).asyncMap(scriptures.mapFromRow);
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

  Selectable<Stakeholder> searchStakeholders(String query) {
    return customSelect(
        'SELECT * FROM stakeholders WHERE name LIKE ?1 ORDER BY name ASC',
        variables: [
          Variable<String>(query)
        ],
        readsFrom: {
          stakeholders,
        }).asyncMap(stakeholders.mapFromRow);
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

  Selectable<GetTopicsWithHymnIdResult> getTopicsWithHymnId() {
    return customSelect(
        'SELECT t.*, ht.hymnId FROM topics AS t INNER JOIN hymn_topics AS ht ON ht.topicId = t.id',
        variables: [],
        readsFrom: {
          hymnTopics,
          topics,
        }).map((QueryRow row) => GetTopicsWithHymnIdResult(
          id: row.read<String>('id'),
          name: row.read<String>('name'),
          alias: row.read<String>('alias'),
          created: row.read<DateTime>('created'),
          updated: row.read<DateTime>('updated'),
          hymnId: row.read<String>('hymnId'),
        ));
  }

  Selectable<Topic> searchTopics(String query) {
    return customSelect(
        'SELECT * FROM topics WHERE name LIKE ?1 OR alias LIKE ?1 ORDER BY name ASC',
        variables: [
          Variable<String>(query)
        ],
        readsFrom: {
          topics,
        }).asyncMap(topics.mapFromRow);
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

  Future<List<Topic>> createTopic(String id, String name, String alias,
      DateTime created, DateTime updated) {
    return customWriteReturning(
        'INSERT OR REPLACE INTO topics (id, name, alias, created, updated) VALUES (?1, ?2, ?3, ?4, ?5) RETURNING *',
        variables: [
          Variable<String>(id),
          Variable<String>(name),
          Variable<String>(alias),
          Variable<DateTime>(created),
          Variable<DateTime>(updated)
        ],
        updates: {
          topics
        }).then((rows) => Future.wait(rows.map(topics.mapFromRow)));
  }

  Future<int> updateTopic(
      String name, String alias, DateTime updated, String id) {
    return customUpdate(
      'UPDATE topics SET name = ?1, alias = ?2, updated = ?3 WHERE id = ?4',
      variables: [
        Variable<String>(name),
        Variable<String>(alias),
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

  Future<int> deleteTopicByAlias(String alias) {
    return customUpdate(
      'DELETE FROM topics WHERE alias = ?1',
      variables: [Variable<String>(alias)],
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

  Selectable<Hymn> searchHymns(String query) {
    return customSelect(
        'SELECT * FROM hymns WHERE title LIKE ?1 OR number LIKE ?1 OR tuneName LIKE ?1 OR startingKey LIKE ?1 OR beatPattern LIKE ?1 OR startingPitch LIKE ?1 OR startingBeat LIKE ?1 OR startingPitchDirection LIKE ?1 OR timeSignature LIKE ?1 OR complexTimeSignature LIKE ?1 ORDER BY number ASC',
        variables: [
          Variable<String>(query)
        ],
        readsFrom: {
          hymns,
        }).asyncMap(hymns.mapFromRow);
  }

  Selectable<Hymn> getHymns() {
    return customSelect(
        'SELECT * FROM hymns WHERE status = \'Purchased\' OR status = \'Browsable\' ORDER BY number ASC',
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
          translatedTitle: row.readNullable<String>('translatedTitle'),
          number: row.read<String>('number'),
          startingKey: row.readNullable<String>('startingKey'),
          beatPattern: row.readNullable<String>('beatPattern'),
          startingPitch: row.readNullable<String>('startingPitch'),
          startingBeat: row.readNullable<String>('startingBeat'),
          startingPitchDirection:
              row.readNullable<String>('startingPitchDirection'),
          timeSignature: row.readNullable<String>('timeSignature'),
          complexTimeSignature:
              row.readNullable<String>('complexTimeSignature'),
          status: row.readNullable<String>('status'),
          key: row.readNullable<String>('key'),
          sku: row.readNullable<String>('sku'),
          electronicVersion: row.readNullable<String>('electronicVersion'),
          tuneName: row.readNullable<String>('tuneName'),
          arrangement: row.readNullable<String>('arrangement'),
          language: row.readNullable<String>('language'),
          copyright: row.readNullable<String>('copyright'),
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
          translatedTitle: row.readNullable<String>('translatedTitle'),
          number: row.read<String>('number'),
          startingKey: row.readNullable<String>('startingKey'),
          beatPattern: row.readNullable<String>('beatPattern'),
          startingPitch: row.readNullable<String>('startingPitch'),
          startingBeat: row.readNullable<String>('startingBeat'),
          startingPitchDirection:
              row.readNullable<String>('startingPitchDirection'),
          timeSignature: row.readNullable<String>('timeSignature'),
          complexTimeSignature:
              row.readNullable<String>('complexTimeSignature'),
          status: row.readNullable<String>('status'),
          key: row.readNullable<String>('key'),
          sku: row.readNullable<String>('sku'),
          electronicVersion: row.readNullable<String>('electronicVersion'),
          tuneName: row.readNullable<String>('tuneName'),
          arrangement: row.readNullable<String>('arrangement'),
          language: row.readNullable<String>('language'),
          copyright: row.readNullable<String>('copyright'),
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
        'SELECT b.id AS bundle_id, b.hash AS bundle_hash, b.created AS bundle_created, b.updated AS bundle_updated,"hymn"."id" AS "nested_0.id", "hymn"."title" AS "nested_0.title", "hymn"."translatedTitle" AS "nested_0.translatedTitle", "hymn"."number" AS "nested_0.number", "hymn"."startingKey" AS "nested_0.startingKey", "hymn"."beatPattern" AS "nested_0.beatPattern", "hymn"."startingPitch" AS "nested_0.startingPitch", "hymn"."startingBeat" AS "nested_0.startingBeat", "hymn"."startingPitchDirection" AS "nested_0.startingPitchDirection", "hymn"."timeSignature" AS "nested_0.timeSignature", "hymn"."complexTimeSignature" AS "nested_0.complexTimeSignature", "hymn"."status" AS "nested_0.status", "hymn"."key" AS "nested_0.key", "hymn"."sku" AS "nested_0.sku", "hymn"."electronicVersion" AS "nested_0.electronicVersion", "hymn"."tuneName" AS "nested_0.tuneName", "hymn"."arrangement" AS "nested_0.arrangement", "hymn"."language" AS "nested_0.language", "hymn"."copyright" AS "nested_0.copyright", "hymn"."created" AS "nested_0.created", "hymn"."updated" AS "nested_0.updated", CASE WHEN b.bytes IS NOT NULL THEN 1 ELSE 0 END AS downloaded FROM hymns AS hymn LEFT JOIN bundles AS b ON hymn.id = b.hymnId',
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
          downloaded: row.read<int>('downloaded'),
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

  Future<int> removeAllDownloads() {
    return customUpdate(
      'UPDATE bundles SET bytes = NULL WHERE bytes IS NOT NULL',
      variables: [],
      updates: {bundles},
      updateKind: UpdateKind.update,
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

  Selectable<Record> getRecordModelsByCollection(String collection) {
    return customSelect(
        'SELECT * FROM records WHERE collection_id = ?1 OR collection_name = ?1',
        variables: [
          Variable<String>(collection)
        ],
        readsFrom: {
          records,
        }).asyncMap(records.mapFromRow);
  }

  Selectable<Record> getRecordModelByCollection(String collection, String id) {
    return customSelect(
        'SELECT * FROM records WHERE(collection_id = ?1 OR collection_name = ?1)AND id = ?2',
        variables: [
          Variable<String>(collection),
          Variable<String>(id)
        ],
        readsFrom: {
          records,
        }).asyncMap(records.mapFromRow);
  }

  Future<List<Record>> setRecordModel(String data, bool synced, bool? fresh) {
    return customWriteReturning(
        'INSERT OR REPLACE INTO records (data, synced, fresh) VALUES (?1, ?2, ?3) RETURNING *',
        variables: [
          Variable<String>(data),
          Variable<bool>(synced),
          Variable<bool>(fresh)
        ],
        updates: {
          records
        }).then((rows) => Future.wait(rows.map(records.mapFromRow)));
  }

  Future<List<Record>> createRecordModel(String data, bool synced) {
    return customWriteReturning(
        'INSERT OR REPLACE INTO records (data, synced, fresh) VALUES (?1, ?2, 1) RETURNING *',
        variables: [
          Variable<String>(data),
          Variable<bool>(synced)
        ],
        updates: {
          records
        }).then((rows) => Future.wait(rows.map(records.mapFromRow)));
  }

  Future<int> updateRecordModel(
      String data, bool synced, String id, String collection) {
    return customUpdate(
      'UPDATE records SET data = ?1, synced = ?2 WHERE id = ?3 AND(collection_id = ?4 OR collection_name = ?4)',
      variables: [
        Variable<String>(data),
        Variable<bool>(synced),
        Variable<String>(id),
        Variable<String>(collection)
      ],
      updates: {records},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> deleteRecordModel(String id, String collection) {
    return customUpdate(
      'UPDATE records SET data = json_set(data, \'\$.deleted\', IFNULL(json_extract(data, \'\$.deleted\'), 0) + 1) WHERE id = ?1 AND(collection_id = ?2 OR collection_name = ?2)',
      variables: [Variable<String>(id), Variable<String>(collection)],
      updates: {records},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> undoDeleteRecordModel(String id, String collection) {
    return customUpdate(
      'UPDATE records SET data = json_set(data, \'\$.deleted\', IFNULL(json_extract(data, \'\$.deleted\'), 1) - 1) WHERE id = ?1 AND(collection_id = ?2 OR collection_name = ?2)',
      variables: [Variable<String>(id), Variable<String>(collection)],
      updates: {records},
      updateKind: UpdateKind.update,
    );
  }

  Selectable<Record> getDeletedRecordModels() {
    return customSelect('SELECT * FROM records WHERE deleted = 1',
        variables: [],
        readsFrom: {
          records,
        }).asyncMap(records.mapFromRow);
  }

  Selectable<Record> getDeletedRecordModelsByCollection(String collection) {
    return customSelect(
        'SELECT * FROM records WHERE deleted = 1 AND(collection_id = ?1 OR collection_name = ?1)',
        variables: [
          Variable<String>(collection)
        ],
        readsFrom: {
          records,
        }).asyncMap(records.mapFromRow);
  }

  Future<int> setSyncStatusRecordModel(
      bool synced, String id, String collection) {
    return customUpdate(
      'UPDATE records SET synced = ?1 WHERE id = ?2 AND(collection_id = ?3 OR collection_name = ?3)',
      variables: [
        Variable<bool>(synced),
        Variable<String>(id),
        Variable<String>(collection)
      ],
      updates: {records},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> setFreshStatusRecordModel(
      bool? fresh, String id, String collection) {
    return customUpdate(
      'UPDATE records SET fresh = ?1 WHERE id = ?2 AND(collection_id = ?3 OR collection_name = ?3)',
      variables: [
        Variable<bool>(fresh),
        Variable<String>(id),
        Variable<String>(collection)
      ],
      updates: {records},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> deleteRecordModelByCollection(String collection) {
    return customUpdate(
      'DELETE FROM records WHERE collection_id = ?1 OR collection_name = ?1',
      variables: [Variable<String>(collection)],
      updates: {records},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> deleteRecordModelByCollectionAndId(String collection, String id) {
    return customUpdate(
      'DELETE FROM records WHERE(collection_id = ?1 OR collection_name = ?1)AND id = ?2',
      variables: [Variable<String>(collection), Variable<String>(id)],
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

  Selectable<RecordsCacheData> getCollectionSyncedStatus(String collection) {
    return customSelect('SELECT * FROM records_cache WHERE collection = ?1',
        variables: [
          Variable<String>(collection)
        ],
        readsFrom: {
          recordsCache,
        }).asyncMap(recordsCache.mapFromRow);
  }

  Future<int> setCollectionSyncedStatus(
      String collection, bool synced, DateTime created, DateTime updated) {
    return customInsert(
      'INSERT OR REPLACE INTO records_cache (collection, synced, created, updated) VALUES (?1, ?2, ?3, ?4)',
      variables: [
        Variable<String>(collection),
        Variable<bool>(synced),
        Variable<DateTime>(created),
        Variable<DateTime>(updated)
      ],
      updates: {recordsCache},
    );
  }

  Future<int> deleteOldRecords(DateTime date) {
    return customUpdate(
      'DELETE FROM records WHERE deleted = 1 AND updated > ?1',
      variables: [Variable<DateTime>(date)],
      updates: {records},
      updateKind: UpdateKind.delete,
    );
  }

  Selectable<UserRecord> findLegacyRecords(
      String? uid, List<String> collections) {
    var $arrayStartIndex = 2;
    final expandedcollections =
        $expandVar($arrayStartIndex, collections.length);
    $arrayStartIndex += collections.length;
    return customSelect(
        'SELECT * FROM user_records WHERE uid IS NOT NULL AND uid = ?1 AND(user IS NULL OR user = \'\')AND(collection_name IN ($expandedcollections) OR collection_id IN ($expandedcollections))',
        variables: [
          Variable<String>(uid),
          for (var $ in collections) Variable<String>($)
        ],
        readsFrom: {
          records,
        }).asyncMap(userRecords.mapFromRow);
  }

  Selectable<UserRecord> getUnsyncedUserRecords(List<String> collections) {
    var $arrayStartIndex = 1;
    final expandedcollections =
        $expandVar($arrayStartIndex, collections.length);
    $arrayStartIndex += collections.length;
    return customSelect(
        'SELECT * FROM user_records WHERE synced = 0 AND(collection_name IN ($expandedcollections) OR collection_id IN ($expandedcollections))',
        variables: [
          for (var $ in collections) Variable<String>($)
        ],
        readsFrom: {
          records,
        }).asyncMap(userRecords.mapFromRow);
  }

  Selectable<UserRecord> getUnsyncedRecordsByUser(String? user) {
    return customSelect(
        'SELECT * FROM user_records WHERE synced = 0 AND(user = ?1 OR uid = ?1)AND collection_name != \'users\'',
        variables: [
          Variable<String>(user)
        ],
        readsFrom: {
          records,
        }).asyncMap(userRecords.mapFromRow);
  }

  Selectable<SearchRecordsResult> searchRecords(String query) {
    return customSelect(
        'SELECT r.id, r.collection_id, r.collection_name, highlight(records_fts, 2, \'<b>\', \'</b>\') AS data, r.created, r.updated FROM records_fts INNER JOIN records AS r ON r.id = records_fts."ROWID" WHERE records_fts MATCH ?1 ORDER BY rank',
        variables: [
          Variable<String>(query)
        ],
        readsFrom: {
          records,
          recordsFts,
        }).map((QueryRow row) => SearchRecordsResult(
          id: row.read<String>('id'),
          collectionId: row.read<String>('collection_id'),
          collectionName: row.read<String>('collection_name'),
          data: row.read<String>('data'),
          created: row.read<DateTime>('created'),
          updated: row.read<DateTime>('updated'),
        ));
  }

  Future<int> setRecordModelDeleted(String id, String collection) {
    return customUpdate(
      'UPDATE records SET deleted = 1 WHERE id = ?1 AND(collection_id = ?2 OR collection_name = ?2)',
      variables: [Variable<String>(id), Variable<String>(collection)],
      updates: {records},
      updateKind: UpdateKind.update,
    );
  }

  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        users,
        requestCache,
        requestCacheIdxUrl,
        offlineQueue,
        offlineQueueFiles,
        offlineQueueDeleteTrigger,
        offlineQueueUsersDeleteTrigger,
        records,
        userRecords,
        analytics,
        userPurchases,
        userLibrary,
        userPlaylistLibrary,
        localPlaylists,
        playlists,
        publicPlaylists,
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
        hymnHymnals,
        hymnHymnalsIdxHymnId,
        hymnHymnalsIdxHymnalId,
        hymnHymnalsDeleteHymn,
        hymnals,
        hymnHymnalsDeleteHymnal,
        hymnalsIdxName,
        hymnalsIdxAlias,
        hymnCategories,
        hymnCategoriesIdxHymnId,
        hymnCategoriesIdxCategoryId,
        hymnCategoriesDeleteHymn,
        categories,
        hymnCategoriesDeleteCategory,
        categoriesIdxName,
        categoriesIdxDescription,
        hymnScriptures,
        hymnScripturesIdxHymnId,
        hymnScripturesIdxScriptureId,
        hymnScripturesDeleteHymn,
        scriptures,
        hymnScripturesDeleteScripture,
        scripturesIdxName,
        hymnStakeholders,
        hymnStakeholdersIdxHymnId,
        hymnStakeholdersIdxStakeholderId,
        hymnStakeholdersIdxRelationship,
        hymnStakeholdersDeleteHymn,
        stakeholders,
        hymnStakeholdersDeleteStakeholder,
        stakeholdersIdxName,
        hymnTopics,
        hymnTopicsIdxHymnId,
        hymnTopicsIdxTopicId,
        hymnTopicsDeleteHymn,
        topics,
        hymnTopicsDeleteTopic,
        topicsIdxName,
        topicsIdxAlias,
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
        recordsFts,
        recordsFtsInsert,
        recordsFtsUpdate,
        recordsFtsDelete,
        recordsIdxData
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
            on: TableUpdateQuery.onTableName('hymns',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('hymn_categories', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('categories',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('hymn_categories', kind: UpdateKind.delete),
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
          WritePropagation(
            on: TableUpdateQuery.onTableName('records',
                limitUpdateKind: UpdateKind.insert),
            result: [
              TableUpdate('records_fts', kind: UpdateKind.insert),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('records',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('records_fts', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('records',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('records_fts', kind: UpdateKind.insert),
            ],
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

class GetPortionsWithHymnIdResult {
  String id;
  String name;
  String lyrics;
  String? hymnPortionId;
  DateTime created;
  DateTime updated;
  String hymnId;
  GetPortionsWithHymnIdResult({
    required this.id,
    required this.name,
    required this.lyrics,
    this.hymnPortionId,
    required this.created,
    required this.updated,
    required this.hymnId,
  });
}

class GetPortionsWithHymnIdByHymnIdResult {
  Portion portion;
  String hymnId;
  GetPortionsWithHymnIdByHymnIdResult({
    required this.portion,
    required this.hymnId,
  });
}

class SearchPortionsResult {
  Portion portion;
  HymnPortion hymnPortion;
  SearchPortionsResult({
    required this.portion,
    required this.hymnPortion,
  });
}

class GetCategoriesWithHymnIdResult {
  String id;
  String name;
  String description;
  String? price;
  String? limited;
  DateTime created;
  DateTime updated;
  String hymnId;
  GetCategoriesWithHymnIdResult({
    required this.id,
    required this.name,
    required this.description,
    this.price,
    this.limited,
    required this.created,
    required this.updated,
    required this.hymnId,
  });
}

class GetScripturesWithHymnIdResult {
  String id;
  String name;
  DateTime created;
  DateTime updated;
  String hymnId;
  GetScripturesWithHymnIdResult({
    required this.id,
    required this.name,
    required this.created,
    required this.updated,
    required this.hymnId,
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

class GetTopicsWithHymnIdResult {
  String id;
  String name;
  String alias;
  DateTime created;
  DateTime updated;
  String hymnId;
  GetTopicsWithHymnIdResult({
    required this.id,
    required this.name,
    required this.alias,
    required this.created,
    required this.updated,
    required this.hymnId,
  });
}

class SearchHymnRowsResult {
  String id;
  String title;
  String? translatedTitle;
  String number;
  String? startingKey;
  String? beatPattern;
  String? startingPitch;
  String? startingBeat;
  String? startingPitchDirection;
  String? timeSignature;
  String? complexTimeSignature;
  String? status;
  String? key;
  String? sku;
  String? electronicVersion;
  String? tuneName;
  String? arrangement;
  String? language;
  String? copyright;
  DateTime created;
  DateTime updated;
  String? topics;
  String? scriptures;
  String? portions;
  String? hymnals;
  SearchHymnRowsResult({
    required this.id,
    required this.title,
    this.translatedTitle,
    required this.number,
    this.startingKey,
    this.beatPattern,
    this.startingPitch,
    this.startingBeat,
    this.startingPitchDirection,
    this.timeSignature,
    this.complexTimeSignature,
    this.status,
    this.key,
    this.sku,
    this.electronicVersion,
    this.tuneName,
    this.arrangement,
    this.language,
    this.copyright,
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
  String? translatedTitle;
  String number;
  String? startingKey;
  String? beatPattern;
  String? startingPitch;
  String? startingBeat;
  String? startingPitchDirection;
  String? timeSignature;
  String? complexTimeSignature;
  String? status;
  String? key;
  String? sku;
  String? electronicVersion;
  String? tuneName;
  String? arrangement;
  String? language;
  String? copyright;
  DateTime created;
  DateTime updated;
  String? topics;
  String? scriptures;
  String? portions;
  String? hymnals;
  GetHymnRowsResult({
    required this.id,
    required this.title,
    this.translatedTitle,
    required this.number,
    this.startingKey,
    this.beatPattern,
    this.startingPitch,
    this.startingBeat,
    this.startingPitchDirection,
    this.timeSignature,
    this.complexTimeSignature,
    this.status,
    this.key,
    this.sku,
    this.electronicVersion,
    this.tuneName,
    this.arrangement,
    this.language,
    this.copyright,
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
  int downloaded;
  GetBundlesHashesResult({
    this.bundleId,
    this.bundleHash,
    this.bundleCreated,
    this.bundleUpdated,
    required this.hymn,
    required this.downloaded,
  });
}

class SearchRecordsResult {
  String id;
  String collectionId;
  String collectionName;
  String data;
  DateTime created;
  DateTime updated;
  SearchRecordsResult({
    required this.id,
    required this.collectionId,
    required this.collectionName,
    required this.data,
    required this.created,
    required this.updated,
  });
}
