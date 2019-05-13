import 'dart:convert';
import 'package:http/http.dart' show Client;
import '../models/item_model.dart';

final _rootUrl = 'https://hacker-news.firebaseio.com/v0';

class NewsApiProvider {
  final Client client = Client();

  fetchTopIds() async {
    final response = await client.get('$_rootUrl/topstories.json');
    final ids = json.decode(response.body);

    return ids;
  }

  fetchItem({int id}) async {
    final response = await client.get('$_rootUrl/item/$id.json');
    var parsedJson = json.decode(response.body);

    return ItemModel.fromJson(parsedJson);
  }
}
