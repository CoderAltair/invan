part of 'get_comments_bloc.dart';

abstract class GetCommentsState extends Equatable {
  const GetCommentsState();

  @override
  List<Object> get props => [];
}

class GetCommentsInitial extends GetCommentsState {}

class CommentsProccesState extends GetCommentsState {}

class CommentsSuccesState extends GetCommentsState {
  final List<Comments> getComments;
  const CommentsSuccesState({required this.getComments});
  @override
  List<Object> get props => [getComments];
}

class CommentsFailureState extends GetCommentsState {}
