class Collection {
  final String id;
  final String name;
  final String? alias;
  final Uri? file;
  final String? hymnalId;
  final bool? deleted;

  Collection({
    required this.id,
    required this.name,
    required this.alias,
    required this.file,
    required this.hymnalId,
    required this.deleted,
  });
}

class HymnCollection {
  final String id;
  final String title;
  final String? number;
  final String? collectionId;
  final String? hymnId;
  final bool? deleted;

  HymnCollection({
    required this.id,
    required this.title,
    required this.number,
    required this.collectionId,
    required this.hymnId,
    required this.deleted,
  });
}
