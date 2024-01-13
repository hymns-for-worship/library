class Collection {
  final String id;
  final String name;
  final String? alias;
  final Uri? file;
  final String? hymnalId;

  Collection({
    required this.id,
    required this.name,
    required this.alias,
    required this.file,
    required this.hymnalId,
  });
}

class HymnCollection {
  final String id;
  final String title;
  final String? number;
  final String? collectionId;
  final String? hymnId;

  HymnCollection({
    required this.id,
    required this.title,
    required this.number,
    required this.collectionId,
    required this.hymnId,
  });
}
