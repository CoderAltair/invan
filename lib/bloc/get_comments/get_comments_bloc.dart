import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../models/comments_model.dart';
import '../../services/http_networks.dart';
part 'get_comments_event.dart';
part 'get_comments_state.dart';

class GetCommentsBloc extends Bloc<GetCommentsEvent, GetCommentsState> {
  GetCommentsBloc() : super(GetCommentsInitial()) {
    on<CommentsSuccesEvent>(getComments);
  }

  Future<void> getComments(
    CommentsSuccesEvent event,
    Emitter<GetCommentsState> emmit,
  ) async {
    String responsePost = '';
    emmit(CommentsProccesState());
    try {
      await Network.getData(
              Network.comments, Network.commentsParams(event.paginationCount))
          .then((value) => {
                
                responsePost = value!,
              });
      if (responsePost.isNotEmpty) {
        emmit(
          CommentsSuccesState(
            getComments: Comments.fromJsonToList(jsonDecode(responsePost)),
          ),
        );
      } else {}
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }
}
