import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: non_constant_identifier_names

class UserLibrary {
  final String id;
  final String? hymn_id;
  final String? stakeholder_id;
  final String? topic_id;
  final String? playlist_id;
  final String? uid;
  final String? user;
  final DateTime created;
  final DateTime updated;

  UserLibrary({
    required this.id,
    required this.hymn_id,
    required this.stakeholder_id,
    required this.topic_id,
    required this.playlist_id,
    required this.uid,
    required this.user,
    required this.created,
    required this.updated,
  });

  @override
  bool operator ==(covariant UserLibrary other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.hymn_id == hymn_id &&
        other.stakeholder_id == stakeholder_id &&
        other.topic_id == topic_id &&
        other.playlist_id == playlist_id &&
        other.uid == uid &&
        other.user == user &&
        other.created == created &&
        other.updated == updated;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        hymn_id.hashCode ^
        stakeholder_id.hashCode ^
        topic_id.hashCode ^
        playlist_id.hashCode ^
        uid.hashCode ^
        user.hashCode ^
        created.hashCode ^
        updated.hashCode;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'hymn_id': hymn_id,
      'stakeholder_id': stakeholder_id,
      'topic_id': topic_id,
      'playlist_id': playlist_id,
      'uid': uid,
      'user': user,
      'created': created.toIso8601String(),
      'updated': updated.toIso8601String(),
    };
  }

  factory UserLibrary.fromMap(Map<String, dynamic> map) {
    return UserLibrary(
      id: map['id'] as String,
      hymn_id: map['hymn_id'] != null ? map['hymn_id'] as String : null,
      stakeholder_id:
          map['stakeholder_id'] != null ? map['stakeholder_id'] as String : null,
      topic_id: map['topic_id'] != null ? map['topic_id'] as String : null,
      playlist_id:
          map['playlist_id'] != null ? map['playlist_id'] as String : null,
      uid: map['uid'] != null ? map['uid'] as String : null,
      user: map['user'] != null ? map['user'] as String : null,
      updated: DateTime.parse(map['updated'] as String),
      created: DateTime.parse(map['created'] as String),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserLibrary.fromJson(String source) =>
      UserLibrary.fromMap(json.decode(source) as Map<String, dynamic>);
}
