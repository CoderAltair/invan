part of 'get_photos_bloc.dart';

abstract class GetPhotosState extends Equatable {
  const GetPhotosState();

  @override
  List<Object> get props => [];
}

class GetPhotosInitial extends GetPhotosState {}

class PhotosProccesState extends GetPhotosState {}

class PhotosSuccesState extends GetPhotosState {
  final List<Photos> getPhotos;
  const PhotosSuccesState({required this.getPhotos});
  @override
  List<Object> get props => [getPhotos];
}

class PhotosFailureState extends GetPhotosState {}
