import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invan_aplication/screens/photos_page.dart';

import '../bloc/get_comments/get_comments_bloc.dart';
import '../bloc/get_photos_bloc/get_photos_bloc.dart';
import '../services/users_local_data.dart';

class CommentsPage extends StatefulWidget {
  static const String id = 'comments_page';

  const CommentsPage({super.key});

  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  int a = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Comments",
          style: Theme.of(context).textTheme.headline3,
        ),
        backgroundColor: Colors.white,
      ),
      body: BlocBuilder<GetCommentsBloc, GetCommentsState>(
        builder: (context, state) {
          return state is CommentsSuccesState
              ? Stack(
                  children: [
                    ListView.builder(
                        shrinkWrap: true,
                        reverse: true,
                        itemCount: state.getComments.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: index == 0
                                ? const EdgeInsets.only(bottom: 130)
                                : const EdgeInsets.all(10),
                            child: Card(
                              child: ListTile(
                                leading: Text(
                                    state.getComments[index].id.toString()),
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'email:${state.getComments[index].email}',
                                      style:
                                          Theme.of(context).textTheme.headline6,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 5),
                                      child: Text(
                                        state.getComments[index].name,
                                        style:
                                            Theme.of(context).textTheme.headline6,
                                      ),
                                    ),
                                  ],
                                ),
                                subtitle: Text(
                                  state.getComments[index].body,
                                  maxLines: 2,
                                  style: Theme.of(context).textTheme.subtitle1,
                                ),
                              ),
                            ),
                          );
                        }),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                borderRadius: BorderRadius.circular(50),
                                onTap: () async {
                                  a = a - 1;
                                  if (a <= 0) {
                                    a = 1;
                                    print(a);
                                  }
                                  print(a);
                                  BlocProvider.of<GetCommentsBloc>(context).add(
                                    CommentsSuccesEvent(paginationCount: a),
                                  );
                                  a <= 0
                                      ? UserLocalData().storePaginationNumber(1)
                                      : UserLocalData()
                                          .storePaginationNumber(a);
                                },
                                child: const CircleAvatar(
                                  child:
                                      Icon(Icons.keyboard_arrow_left_outlined),
                                ),
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              InkWell(
                                onTap: () {
                                  BlocProvider.of<GetCommentsBloc>(context).add(
                                    CommentsSuccesEvent(
                                        paginationCount: a = a + 1),
                                  );
                                  UserLocalData().storePaginationNumber(a);
                                },
                                child: const CircleAvatar(
                                  child:
                                      Icon(Icons.keyboard_arrow_right_outlined),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: ElevatedButton(
                            onPressed: () {
                              BlocProvider.of<GetPhotosBloc>(context)
                                  .add(PhotosSuccesEvent());
                              Navigator.pushReplacementNamed(
                                  context, PhotosPage.id);
                            },
                            child: const Text('Next Page'),
                          ),
                        )
                      ],
                    )
                  ],
                )
              : const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
