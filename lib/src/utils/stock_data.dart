import 'package:http/http.dart' as http;

// ignore: non_constant_identifier_names
fetchTrendingList(String Url) async {
  http.Response response = await http.get(Uri.parse(Url));
  return response.body;
}

// ignore: non_constant_identifier_names
fetchStockData(String Url) async {
  http.Response response = await http.get(Uri.parse(Url));
  return response.body;
}