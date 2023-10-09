import 'package:http/http.dart';
import 'package:news_app/screens/home/repository/repo.dart';

class LocalRepo extends BaseRepository {
  @override
  Future<Response>? getNewsData(String sourceId) {
    return null;
  }

  @override
  Future<Response>? getSources(String category) {
    return null;
  }
}