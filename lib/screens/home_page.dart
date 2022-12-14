import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invan_aplication/screens/auth_page.dart';
import 'package:invan_aplication/screens/comments_page.dart';
import 'package:invan_aplication/screens/photos_page.dart';
import 'package:invan_aplication/screens/posts_page.dart';

import '../bloc/get posts/get_posts_bloc.dart';
import '../bloc/get_comments/get_comments_bloc.dart';
import '../bloc/get_photos_bloc/get_photos_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => GetPostsBloc()),
        BlocProvider(create: (_) => GetCommentsBloc()),
        BlocProvider(create: (_) => GetPhotosBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: const Color(0xff303F9F),
          fontFamily: 'Montserrat',
          backgroundColor: Colors.white,
          canvasColor: const Color(0xffEDF4FF),
          scaffoldBackgroundColor: Colors.white,
          textTheme: const TextTheme(
            button: TextStyle(
              letterSpacing: 0.1,
              fontSize: 10.0,
              color: Colors.black,
            ),
            overline: TextStyle(
              letterSpacing: 0.1,
              fontSize: 8.0,
              fontWeight: FontWeight.w400,
            ),
            headline1: TextStyle(
              fontSize: 13.0,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
            headline2: TextStyle(
              fontSize: 18.0,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
            headline3: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
            headline4: TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.w600,
                color: Colors.black),
            headline5: TextStyle(
              fontSize: 12.0,
              color: Colors.black,
            ),
            headline6: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w700,
            ),
            subtitle1: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w500,
            ),
            subtitle2: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
                color: Color(0xff808080)),
            caption: TextStyle(
              fontSize: 21.0,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
            bodyText2: TextStyle(
              color: Colors.black,
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 25,
              ),
              textStyle: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
              elevation: 1,
            ),
          ),
          inputDecorationTheme: InputDecorationTheme(
            contentPadding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide.none,
            ),
            fillColor: const Color(0xffEDF4FF),
            filled: true,
            hintStyle: const TextStyle(
              color: Color(0xFFABB2DA),
            ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xffFFDCDC),
              ),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xffFFDCDC),
              ),
            ),
          ),
        ),
        home: const AuthPage(),
        routes: {
          PostsPage.id: (context) => const PostsPage(),
          AuthPage.id: (context) => const AuthPage(),
          CommentsPage.id: (context) => const CommentsPage(),
          PhotosPage.id: (context) => const PhotosPage(),
        },
      ),
    );
  }
}
