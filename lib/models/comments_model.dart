class Comments {
  final int postId;
  final int id;
  final String name;
  final String email;
  final String body;

  Comments({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });
  static List<Comments> fromJsonToList(List<dynamic> list) =>
      list.map((item) => Comments.fromJson(item)).toList();

  Comments.fromJson(Map<String, dynamic> json)
      : postId = json['postId'],
        id = json['id'],
        name = json['name'],
        email = json['email'],
        body = json['body'];

  Map<String, dynamic> toJson() => {
        'postId': postId,
        'email': email,
        'name': name,
        'body': body,
        'id': id, 
      };
}
