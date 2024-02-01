class HymnDownload {
  final String hymnId, hymnTitle, hymnNumber, hymnalName, hash;
  final DateTime created, updated;

  final Uri url;

  const HymnDownload({
    required this.hymnId,
    required this.hymnTitle,
    required this.hymnNumber,
    required this.hymnalName,
    required this.created,
    required this.updated,
    required this.hash,
    required this.url,
  });
}
