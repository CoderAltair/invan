part of 'get_photos_bloc.dart';

abstract class GetPhotosEvent extends Equatable {
  const GetPhotosEvent();

  @override
  List<Object> get props => [];
}

class PhotosSuccesEvent extends GetPhotosEvent {}
