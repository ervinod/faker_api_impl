import 'package:http/http.dart' as http;
import 'package:faker_api_impl/core/utils/app_log.dart';

class ApiClient {
  http.Client client = http.Client();

  Future<http.Response> get(Uri url) async {
    var response = await client.get(url, headers: {
      "Content-Type": "application/json",
    });
    AppLog().debug("${response.request}\n${response.body}");
    return response;
  }

  Future<http.Response> post(Uri url, var bodyData) async {
    var response = await client.post(url, body: bodyData, headers: {
      "Content-Type": "application/json",
    });
    AppLog().debug("${response.request}\n${response.body}");
    return response;
  }

  Future<http.Response> delete(Uri url, {var bodyData}) async {
    var response = await client.delete(url, body: bodyData, headers: {
      "Content-Type": "application/json",
    });
    AppLog().debug("${response.request}\n${response.body}");
    return response;
  }

  Future<http.Response> put(Uri url, var bodyData) async {
    var response = await client.put(url, body: bodyData, headers: {
      "Content-Type": "application/json",
    });
    AppLog().debug("${response.request}\n${response.body}");
    return response;
  }
}
