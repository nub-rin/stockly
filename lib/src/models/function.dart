import 'package:http/http.dart' as http;

fetchData(String Url) async {
  http.Response response = await http.get(Uri.parse(Url));
  return response.body;
}
