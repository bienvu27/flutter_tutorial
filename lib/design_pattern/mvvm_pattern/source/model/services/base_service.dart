abstract class BaseService {
  final String mediaBaseUrl = "https://jatinderji.github.io";
  static String endPoint = "/users_pets_api/users_pets.json";

  Future<dynamic> getResponse(String url);
}
