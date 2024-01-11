import '../../data/source/database/database.dart';

extension HymnX on Hymn {
  String? get notation {
    if (startingKey != null && timeSignature != null && startingBeat != null && startingPitch != null) {
      return '${startingKey!.trim()} - ${timeSignature!.trim()} on ${startingBeat!.trim()} - ${startingPitch!.trim()}';
    } else {
      return null;
    }
  }
}
