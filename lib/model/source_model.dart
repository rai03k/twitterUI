//　jsonを解析しやすくなります
class Source {
  String id;
  String name;

  //　コンストラクター作成
  Source({required this.id, required this.name});

  //　jsonをmapするファクトリー関数
  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(id: json['id'], name: json['name']);
  }
}

/*
  factory functionとは。
  同じプロパティを共有する小さなオブジェクトを複数作成する場合に便利

  const createUser = ({ firstName, lastName, email }) => ({
  firstName,
  lastName,
  email,
  fullName() {
    return `${this.firstName} ${this.lastName}`;
  }
});

const user1 = createUser({
  firstName: "John",
  lastName: "Doe",
  email: "john@doe.com"
});

const user2 = createUser({
  firstName: "Jane",
  lastName: "Doe",
  email: "jane@doe.com"
});

console.log(user1);
console.log(user2);
*/
