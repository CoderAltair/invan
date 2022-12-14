import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:invan_aplication/services/http_networks.dart';
import 'package:invan_aplication/services/users_local_data.dart';
import '../../models/posts_model.dart';
part 'get_posts_event.dart';
part 'get_posts_state.dart';

class GetPostsBloc extends Bloc<GetPostsEvent, GetPostsState> {
  GetPostsBloc() : super(GetPostsInitial()) {
    on<PostsSuccesEvent>(getPosts);
  }

  Future<void> getPosts(
    PostsSuccesEvent event,
    Emitter<GetPostsState> emmit,
  ) async {
    String responsePost = '';
    emmit(PostsProccesState());
    try {
      await Network.getData(Network.posts, Network.params()).then((value) => {
            responsePost = value!,
          });
      if (responsePost.isNotEmpty) {
        UserLocalData().storePosts(responsePost);
        emmit(
          PostsSuccesState(
            getPosts: Posts.fromJsonToList(jsonDecode(responsePost)),
          ),
        );
      } else {}
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }
}
