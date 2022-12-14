import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/photos_model.dart';
import '../../services/http_networks.dart';

part 'get_photos_event.dart';
part 'get_photos_state.dart';

class GetPhotosBloc extends Bloc<GetPhotosEvent, GetPhotosState> {
  GetPhotosBloc() : super(GetPhotosInitial()) {
    on<PhotosSuccesEvent>(getPhotos);
  }

  Future<void> getPhotos(
    PhotosSuccesEvent event,
    Emitter<GetPhotosState> emmit,
  ) async {
    String responsePost = '';
    emmit(PhotosProccesState());
    try {
      await Network.getData(Network.photos, Network.photosParams())
          .then((value) => {
                responsePost = value!,
              });
      if (responsePost.isNotEmpty) {
        emmit(
          PhotosSuccesState(
            getPhotos: Photos.fromJsonToList(jsonDecode(responsePost)),
          ),
        );
      } else {}
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }
}
