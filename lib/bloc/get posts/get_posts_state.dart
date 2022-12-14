part of 'get_posts_bloc.dart';

abstract class GetPostsState extends Equatable {
  const GetPostsState();

  @override
  List<Object> get props => [];
}

class GetPostsInitial extends GetPostsState {}

class PostsProccesState extends GetPostsState {}

class PostsSuccesState extends GetPostsState {
  final List<Posts> getPosts;
  const PostsSuccesState({required this.getPosts});
  @override
  List<Object> get props => [getPosts];
}
class PostsFailureState extends GetPostsState {}
