import 'dart:convert';
import 'package:http/http.dart' show Client;
import '../models/item_model.dart';
import 'iprovider.dart';

final _rootUrl = 'https://hacker-news.firebaseio.com/v0';

class NewsApiProvider implements Source {
  Client client = Client();

  Future<List<int>> fetchTopIds() async {
    final response = await client.get('$_rootUrl/topstories.json');
    final ids = json.decode(response.body);

    return ids.cast<int>();
  }

  Future<ItemModel> fetchItem(int id) async {
    final response = await client.get('$_rootUrl/item/$id.json');
    var parsedJson = json.decode(response.body);

    return ItemModel.fromJson(parsedJson);
  }
}
