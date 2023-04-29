import 'package:stockly/src/models/news.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RecipeApi {
  static Future<List<News>> getRecipe() async {
    var uri = Uri.https(
      "yahoo-finance15.p.rapidapi.com",
      "/api/yahoo/ne/news",
    );

    final response = await http.get(uri, headers: {
      'content-type': 'application/octet-stream',
      'X-RapidAPI-Key': '109cc2a367msh997f1cf12a41d0ap16e59bjsn2c2c6a655460',
      'X-RapidAPI-Host': 'yahoo-finance15.p.rapidapi.com'
    });
    List<News> lst = [];
    final parsedData = json.decode(response.body) as List;
    print(parsedData);
    parsedData.forEach((element) {
      lst.add(News.fromJson(element));
    });
    return lst;
  }
}
