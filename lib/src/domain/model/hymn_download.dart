class HymnDownload {
  final String hymnId, hymnTitle, hymnNumber, hash, file;
  final DateTime created, updated;

  final Uri url;

  const HymnDownload({
    required this.hymnId,
    required this.hymnTitle,
    required this.hymnNumber,
    required this.created,
    required this.updated,
    required this.hash,
    required this.file,
    required this.url,
  });
}
