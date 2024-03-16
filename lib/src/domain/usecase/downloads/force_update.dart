import '../../../data/source/pocketbase/client.dart';

class ForceUpdateHymn {
  final HfwStudio client;

  ForceUpdateHymn(this.client);

  Future<void> call(String hymnId) async {
    final client = this.client.httpClientFactory();
    final url =
        Uri.parse('https://hymnsforworship.studio/hymns/$hymnId/update');
    final res = await client.get(url);
    if (res.statusCode != 200) {
      throw Exception('Error updating hymn bundle');
    }
  }
}
