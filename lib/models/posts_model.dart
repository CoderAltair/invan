class Posts {
  final int userId;
  final int id;
  final String title;
  final String body;

  Posts({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });
static List<Posts> fromJsonToList(List<dynamic> list) =>
      list.map((item) => Posts.fromJson(item)).toList();
      
  Posts.fromJson(Map<String, dynamic> json)
      : userId = json['userId'],
        id = json['id'],
        title = json['title'],
        body = json['body'];

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'email': id,
        'title': title,
        'body': body,
      };
}
