import 'package:http_request/service/base_network.dart';

class CovidDataSource {
  static CovidDataSource instance = CovidDataSource();

  // loadCountries() mengembalikan nilai dari class BaseNetwork dengan method get()
  // diisi dengan parameter “countries” dikarenakan kita ingin mengambil list dari
  // negara-negara.
  Future<Map<String, dynamic>> loadCountries() {
    return BaseNetwork.get("countries");
  }
}
