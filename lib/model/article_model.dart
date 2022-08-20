//　article modelを作成するにはjson構造から
//　プロパティーをコピーしてdartオブジェクトを作成

class Article {
  String? name;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  //　コンストラクター
  Article(
      {this.name,
      this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content});

  //　次に、jsonをリストにマップする関数を作成
  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      name: json['source']['name'],
      author: json['author'],
      title: json['title'],
      description: json['description'],
      url: json['url'],
      urlToImage: json['urlToImage'],
      publishedAt: json['publishedAt'],
      content: json['content'],
    );
  }
}
