import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_application_2/models/category_model.dart';

class NewsCategoriesRepo {
  Future<CategoriesNewsMdl> fetchNewsCategoires(String category) async {
    String newsUrl =
        'https://newsapi.org/v2/everything?q=$category&apiKey=4f377273fdd74ca7bfbd7ebcaffdc618';
    final response = await http.get(Uri.parse(newsUrl));
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);

      return CategoriesNewsMdl.fromJson(body);
    } else {
      throw Exception('Error');
    }
  }
}
