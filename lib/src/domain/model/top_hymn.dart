class TopHymn {
  final String hymnId, title, number;
  final DateTime viewDate;
  final int viewCount;

  const TopHymn({
    required this.hymnId,
    required this.title,
    required this.number,
    required this.viewDate,
    required this.viewCount,
  });
}
