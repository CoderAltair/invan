
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invan_aplication/screens/posts_page.dart';

import '../bloc/get posts/get_posts_bloc.dart';
import '../models/users_model.dart';
import '../services/users_local_data.dart';
import '../services/utils.dart';

class AuthPage extends StatefulWidget {
  static const String id = 'auth_page';
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  void _doLogin() async {
    String lastName = lastNameController.text;
    String email = emailController.text;
    var user = User(lastname: lastName, email: email);
    if (lastNameController.text.isEmpty && emailController.text.isEmpty) {
      Utils.fireToast('Check your Name or Email');
    } else {
      UserLocalData().storeUser(user);
       BlocProvider.of<GetPostsBloc>(context).add(
                      PostsSuccesEvent(),
                    );
      Navigator.pushReplacementNamed(context, PostsPage.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  'SignIn',
                  style: Theme.of(context).textTheme.caption,
                ),
              ),
            ),
            TextField(
              controller: lastNameController,
              decoration: const InputDecoration(
                hintText: 'Name',
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: 'Email',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: ElevatedButton(
                onPressed: () {
                  _doLogin();
                },
                child: Text(
                  'Sign In',
                  style: Theme.of(context).textTheme.headline3!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
