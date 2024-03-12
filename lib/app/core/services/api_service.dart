import 'package:pokedex_app/app/core/services/api/response/http_response.dart';

abstract class ApiService {
  Future<HttpResponse> postDataTo(String endpoint, data);
  Future<HttpResponse> putDataTo(String endpoint, data);
  Future<HttpResponse> getDataFrom(String endpoint);
  Future<HttpResponse> getDataWithFullUrl(String ur);
}
