import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/get_photos_bloc/get_photos_bloc.dart';

class PhotosPage extends StatefulWidget {
  static const String id = 'photos_page';
  const PhotosPage({super.key});

  @override
  State<PhotosPage> createState() => _PhotosPageState();
}

class _PhotosPageState extends State<PhotosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Photos",
          style: Theme.of(context).textTheme.headline3,
        ),
        backgroundColor: Colors.white,
      ),
      body: BlocBuilder<GetPhotosBloc, GetPhotosState>(
        builder: (context, state) {
          return state is PhotosSuccesState
              ? ListView.builder(
                  shrinkWrap: true,
                  reverse: true,
                  itemCount: state.getPhotos.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8),
                      child: Card(
                        child: ListTile(
                          leading: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Image.network('ssdfdfsdfs'),
                          ),
                          title: Text(state.getPhotos[index].title),
                        ),
                      ),
                    );
                  })
              : const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
