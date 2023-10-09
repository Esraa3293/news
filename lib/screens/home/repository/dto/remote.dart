import 'package:http/http.dart';
import 'package:news_app/screens/home/repository/repo.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/style/constants.dart';

class RemoteRepo extends BaseRepository {
  @override
  Future<Response> getNewsData(String sourceId) {
    Uri URL = Uri.https(baseUrl, "/v2/everything",
        {"apiKey": apiKey, "sources": sourceId});
    return http.get(URL);
  }

  @override
  Future<Response> getSources(String category) {
    Uri URL = Uri.https(baseUrl, "/v2/top-headlines/sources",
        {"apiKey": apiKey, "category": category});
    return http.get(URL);
  }
}
