abstract class IHtppService {
  Future<dynamic> get(String url);

  Future<dynamic> post(String url, dynamic object);

  Future<dynamic> put(String url, dynamic object);

  Future<dynamic> delete(String url);
}
