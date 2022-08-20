import 'dart:convert';

import 'package:http/http.dart';
import 'package:twitter_ui/model/article_model.dart';

// それでは、http リクエスト サービスを作成しましょう
// このclassにより単純なget httpリクエストを作成できます
// APIから記事を取得し、記事のリストを返します

class ApiService {
  final endPointUrl =
      "https://newsapi.org/v2/top-headlines?country=jp&apiKey=e0c6b1eab154423a8009dc570dbf9765";

  Future<List<Article>> getArticle() async {
    Response res = await get(Uri.parse(endPointUrl));

    // ステータスコード200はリクエストが成功した場合に返されるコード
    // httpリクエストに成功したときの処理
    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);
      List<dynamic> body = json['articles'];

      // この行により、json ファイルからさまざまな記事を取得し、それらをリストに入れることができます。
      List<Article> articles =
          body.map((dynamic item) => new Article.fromJson(item)).toList();
      return articles;
    } else {
      throw ('Cant get ther Articles');
    }
  }
}
