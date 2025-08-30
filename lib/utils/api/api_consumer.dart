abstract class ApiConsumer {
  Future<List<dynamic>> get(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  });
  post(String path, {dynamic data, Map<String, dynamic>? queryParameters});
  patch(String path, {dynamic data, Map<String, dynamic>? queryParameters});
  put(String path, {dynamic data, Map<String, dynamic>? queryParameters});
  delete(String path, {dynamic data, Map<String, dynamic>? queryParameters});
}
