import 'package:sqlite3/common.dart';

class Slides {
  final int id;
  final String path;

  const Slides({
    required this.id,
    required this.path,
  });

  factory Slides.fromRow(Row row) {
    return Slides(
      id: row['id'] as int,
      path: row['path'] as String,
    );
  }
}

class HymnSlides {
  final int id;
  final int hymnId;
  final int slideId;
  final int portionId;
  final int order;

  const HymnSlides({
    required this.id,
    required this.hymnId,
    required this.slideId,
    required this.portionId,
    required this.order,
  });

  factory HymnSlides.fromRow(Row row) {
    return HymnSlides(
      id: row['id'] as int,
      hymnId: row['hymnId'] as int,
      slideId: row['slideId'] as int,
      portionId: row['portionId'] as int,
      order: row['order'] as int,
    );
  }
}
