class ServiceConstants {
  static const String apiKey = '';
  static const String webUrl = 'http://ansar.kg/api/clients/?format=json';
  static const String loginUrl = 'http://ansar.kg/api/auth/token/login/';

  static String urlBuCountry(int id) {
    return 'http://ansar.kg/api/clients/$id/?format=json';
  }
}
