import 'package:news/src/resources/news_api_provider.dart';
import 'dart:convert';
import 'package:test/test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';

void main() {
  test('fetchTopIds returns a list of ids', () {
    //setup of test case
    final newsApi = NewsApiProvider();
    var mockClient = MockClient( (request) {
      return json.encode([1,2]);
    });
    newsApi.client = mockClient;
    // expectation
    expect(sum, 4);
    // result
  });
}
