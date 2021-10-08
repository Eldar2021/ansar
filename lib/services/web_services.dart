import 'package:ansar/models/client_model.dart';
import 'package:ansar/utils/serices_constants.dart';
import 'package:dio/dio.dart';

class WebService {
  Dio dio = Dio();

  Future<ClientModel> getClientById(int id) async {
    final response = await dio.get(ServiceConstants.urlBuCountry(id));
    if (response.statusCode == 200) {
      final dynamic result = response.data;
      print(result);
      return ClientModel.fromJson(result);
    } else {
      throw Exception("your have error");
    }
  }

  Future<List<ClientModel>> getClients() async {
    final response = await dio.get(ServiceConstants.webUrl);
    if (response.statusCode == 200) {
      final dynamic result = response.data;
      Iterable list = result["results"];
      print(response);
      return list.map((e) => ClientModel.fromJson(e)).toList();
    } else {
      throw Exception("your have error");
    }
  }
}
