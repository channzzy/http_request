import 'package:flutter/material.dart';
import 'package:post_method/pages/firebase_http/detail_player.dart';
import 'package:post_method/pages/firebase_http/home_page.dart';
import 'package:post_method/pages/firebase_http/post_firebase.dart';
import 'package:post_method/providers/delete_provider.dart';
import 'package:post_method/providers/firebase_providers/players.dart';
import 'package:post_method/providers/get_provider.dart';
import 'package:post_method/providers/post_provider.dart';
import 'package:post_method/providers/put_provider.dart';
import 'package:post_method/pages/delete_provider.dart';
import 'package:post_method/pages/get_provider.dart';
import 'package:post_method/pages/get_stateful.dart';
import 'package:post_method/pages/post_provider.dart';
import 'package:post_method/pages/post_stateful.dart';
import 'package:post_method/pages/put_provider.dart';
import 'package:post_method/pages/put_stateful.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => HttpProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => GetProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => PutProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => DeleteProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => Players(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Learn Post',
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/home-stateful': (context) => const PostStateful(),
        '/home-provider': (context) => PostProvider(),
        '/get-stateful': (context) => GetPageStateful(),
        '/get-provider': (context) => GetPageProvider(),
        '/put-stateful': (context) => const PutPageStateful(),
        '/put-provider': (context) => PutPageProvider(),
        '/delete-provider': (context) => DeletePage(),
        '/post-firebase': (context) => HomePageFirebase(),
        '/add-player': (context) => AddPlayer(),
        '/detail-player': (context) => DetailPlayer(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        actions: const [],
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, PostStateful.routeName);
              },
              child: const Text('POST - STATEFUL'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, PostProvider.routeName);
              },
              child: const Text('POST - PROVIDER'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, GetPageStateful.routeName);
              },
              child: const Text('GET - STATEFUL'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, GetPageProvider.routeName);
              },
              child: const Text('GET - PROVIDER'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, PutPageStateful.routeName);
              },
              child: const Text('PUT - STATEFUL'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, PutPageProvider.routeName);
              },
              child: const Text('PUT - PROVIDER'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, DeletePage.routeName);
              },
              child: const Text('DELETE - PROVIDER'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, HomePageFirebase.routeName);
              },
              child: const Text('POST - FIREBASE'),
            ),
          ],
        ),
      ),
    );
  }
}
