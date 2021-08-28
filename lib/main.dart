import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home/cubit/social_cubit.dart';
import 'package:home/layout/home_layout.dart';
import 'package:home/layout/new_post.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:home/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Future<FirebaseApp> _initialization = Firebase.initializeApp();

    return FutureBuilder(
      future: _initialization,
      builder: (context, appSnapshot) {
        return BlocProvider(
          create: (context) => SocialCubit()..getAllPosts(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              appBarTheme: AppBarTheme(
                  color: Colors.white70,
                  centerTitle: true,
                  elevation: 2,
                  titleTextStyle: TextStyle(
                    color: Colors.red,
                  ),
                  iconTheme: IconThemeData(color: Colors.black)),
              textTheme: TextTheme(
                bodyText1: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                ),
              ),
              primarySwatch: Colors.blue,
            ),
            home: appSnapshot.connectionState != ConnectionState.done
                ? SplashScreen()
                : HomeLayout(),
            routes: {
              '/new_post': (context) => NewPost(),
              '/posts': (context) => HomeLayout(),
            },
          ),
        );
      },
    );
  }
}
