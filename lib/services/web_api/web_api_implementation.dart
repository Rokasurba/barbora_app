import 'dart:convert';

import 'package:barbora_app/services/web_api/web_api.dart';
import 'package:http/http.dart' as http;

import '../../constants.dart';

class WebApiImpl implements WebApi {
  @override
  Future<dynamic> getStockList(offset) async {
    try {
      Map<String, String> queryParams = {
        'offset': offset.toString(),
        'categoryId': '4209',
        'limit': Constants.stockPaginationLimit.toString(),
        'store': 'US',
      };

      Map<String, String> headers = {
        // never upload private keys to github :)
        'x-rapidapi-key': '8c6948b18bmsh6b8acaac972f972p1395e3jsn1dd8490ca241',
        'x-rapidapi-host': 'asos2.p.rapidapi.com',
      };

      final url =
          Uri.https(Constants.API_URL, Constants.API_PRODUCT_LIST, queryParams);

      final r = await http.get(url, headers: headers);
      print(r.body);
      if (r.statusCode != 200) {
        throw "Error when fecthing data";
      }
      return jsonDecode(r.body);
    } catch (error) {
      print(error);
      throw error;
    }
  }
}
