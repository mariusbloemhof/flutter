import 'dart:async';
import 'iprovider.dart';
import 'news_api_provider.dart';
import 'news_db_provider.dart';
import '../models/item_model.dart';

class Repository implements Source {
  var apiProvider = NewsApiProvider();
  var dbProvider = NewsDbProvider();

  final List<Source> sources = <Source>[NewsApiProvider(), newsDbProvider];
  final List<Cache> caches = <Cache>[newsDbProvider];

  Future<List<int>> fetchTopIds() async {
    return await apiProvider.fetchTopIds();
  }

  Future<ItemModel> fetchItem(int id) async {
    ItemModel item;
    Source source;

    for (source in sources) {
      item = await source.fetchItem(id);
      if (item != null) {
        break;
      }
    }
    if (item != null) {
      for (var cache in caches) {
        cache.addItem(item);
      }
    }

    return item;
  }
}
