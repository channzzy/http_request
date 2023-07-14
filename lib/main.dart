import 'package:flutter/material.dart';
import 'package:post_method/models/post_provider.dart';
import 'package:post_method/pages/get_stateful.dart';
import 'package:post_method/pages/post_provider.dart';
import 'package:post_method/pages/post_stateful.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => HttpProvider(),
    child: const MyApp(),
  ));
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
          ],
        ),
      ),
    );
  }
}
