import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invan_aplication/screens/comments_page.dart';

import '../bloc/get posts/get_posts_bloc.dart';
import '../bloc/get_comments/get_comments_bloc.dart';
import '../services/users_local_data.dart';

class PostsPage extends StatefulWidget {
  static const String id = 'post_page';

  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  int paginationNumber = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Posts",
          style: Theme.of(context).textTheme.headline3,
        ),
        backgroundColor: Colors.white,
      ),
      body: BlocBuilder<GetPostsBloc, GetPostsState>(
        builder: (context, state) {
          return state is PostsSuccesState
              ? Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.getPosts.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              child: ListTile(
                                leading:
                                    Text(state.getPosts[index].id.toString()),
                                title: Text(state.getPosts[index].body),
                                subtitle: Text(state.getPosts[index].title),
                              ),
                            ),
                          );
                        }),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () async {
                              UserLocalData().loadPaginationNumber()==null
                                  ? paginationNumber = 1
                                  : paginationNumber =
                                      UserLocalData().loadPaginationNumber()!;
                              BlocProvider.of<GetCommentsBloc>(context).add(
                                CommentsSuccesEvent(
                                    paginationCount: paginationNumber),
                              );
                              Navigator.pushReplacementNamed(
                                  context, CommentsPage.id);
                            },
                            child: const Text('Next Page'),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              : const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
