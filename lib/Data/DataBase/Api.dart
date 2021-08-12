import 'dart:convert';

import 'package:http/http.dart' as http;

class Api {
  Future<List> requestData() async {
    http.Response response;
    while (response == null) response = await http.get(Uri.parse("https://fakestoreapi.com/products/"));
    List data = jsonDecode(response.body);
    return data;
  }
}
