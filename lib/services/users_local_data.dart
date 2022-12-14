import 'dart:convert';

import 'package:hive/hive.dart';
import '../models/posts_model.dart';
import '../models/users_model.dart';

class UserLocalData {
  String userKey = 'user';
  String paginationKey = 'paginationNumber';
  var box = Hive.box('user_data');
  //store user info
  void storeUser(User user) async {
    box.put(userKey, user.toJson());
  }

//load user info
  User loadUser() {
    var user = User.fromJson(
      box.get(userKey),
    );
    return user;
  }

  //remove user info
  void removeUser() async {
    box.delete(userKey);
  }

  //write pagination number
  void storePaginationNumber(int number) async {
    box.put(paginationKey, number);
  }

  //load pagination number
  int? loadPaginationNumber() {
    var number = box.get(paginationKey);

    return number;
  }

  //store post data
  void storePosts(String post) async {
    box.put(userKey, post);
  }

//load post data
  List<Posts> loadPosts() {
    var posts = Posts.fromJsonToList(
      jsonDecode(box.get(userKey)),
    );

    return posts;
  }
}
