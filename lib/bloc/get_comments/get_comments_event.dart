part of 'get_comments_bloc.dart';

abstract class GetCommentsEvent extends Equatable {
  const GetCommentsEvent();

  @override
  List<Object> get props => [];
}

class CommentsSuccesEvent extends GetCommentsEvent {
  final int paginationCount;

  const CommentsSuccesEvent({required this.paginationCount});
  @override
  List<Object> get props => [paginationCount];
}
