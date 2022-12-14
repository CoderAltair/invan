import 'dart:convert';

import 'package:http/http.dart';

import '../models/post_list_model.dart';

class Network {
  static String base = 'jsonplaceholder.typicode.com';
  static Map<String, String> headers = {
    'Content-Type': 'application/json; charset=UTF-8'
  };

  static String posts = '/posts';
  static String comments = '/comments';
  static String photos = '/photos';
  static String users = '/users';
//Methods
  static Future<String?> getData(String api, Map<String, String> params) async {
    var url = Uri.https(base, api, params);
    var response = await get(url, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  //Params
  static Map<String, String> params() {
    Map<String, String> params = Map();
    return params;
  }

  static Map<String, String> commentsParams(
    int a,
  ) {
    Map<String, String> params = {
      'postId': '$a',
    };
    return params;
  }

  static Map<String, String> photosParams() {
    Map<String, String> params = {
      'albumId': '1',
    };
    return params;
  }

  //Parsing
  static PostsList parsePostsList(String response) {
    dynamic json = jsonDecode(response);
    var data = PostsList.fromJson(json);
    return data;
  }
}
