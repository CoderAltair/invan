import 'package:invan_aplication/models/posts_model.dart';

class PostsList {
  final List<Posts> posts;
  PostsList({required this.posts});
  PostsList.fromJson(Map<String, dynamic> json)
      : posts = List<Posts>.from(
          json[''].map(
            (x) => Posts.fromJson(x),
          ),
        );

  Map<String, dynamic> toJson() => {
        '': List<dynamic>.from(
          posts.map(
            (e) => e.toJson(),
          ),
        )
      };
}
