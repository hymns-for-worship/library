import '../../../../data/source/database/database.dart';

class GetPublicDomainHymns {
  final HfwDatabase db;
  const GetPublicDomainHymns(this.db);

  Stream<List<Hymn>> call() async* {
    yield* db.getPublicDomainHymns().watch();
  }
}
