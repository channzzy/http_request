import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../pages/firebase_http/detail_player.dart';
import '../../pages/firebase_http/post_firebase.dart';

import 'package:post_method/providers/firebase_providers/players.dart';

class HomePageFirebase extends StatefulWidget {
  static const routeName = "/post-firebase";

  @override
  State<HomePageFirebase> createState() => _HomePageFirebaseState();
}

class _HomePageFirebaseState extends State<HomePageFirebase> {
  bool isInit = true;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies

    if (isInit) {
      Provider.of<Players>(context).initialData();
    }
    isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final allPlayerProvider = Provider.of<Players>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("ALL PLAYERS"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(context, AddPlayer.routeName);
            },
          ),
        ],
      ),
      body: (allPlayerProvider.jumlahPlayer == 0)
          ? Container(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "No Data",
                    style: TextStyle(fontSize: 25),
                  ),
                  SizedBox(height: 20),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AddPlayer.routeName);
                    },
                    child: Text(
                      "Add Player",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: allPlayerProvider.jumlahPlayer,
              itemBuilder: (context, index) {
                var id = allPlayerProvider.allPlayer[index].id;
                return ListTile(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      DetailPlayer.routeName,
                      arguments: id,
                    );
                  },
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                      allPlayerProvider.allPlayer[index].imageUrl!,
                    ),
                  ),

                  // leading: ClipRRect(
                  //   borderRadius: BorderRadius.circular(50),
                  //   child: SizedBox(
                  //     width: 50,
                  //     height: 50,
                  //     child: CachedNetworkImage(
                  //       imageUrl: allPlayerProvider.allPlayer[index].imageUrl!,
                  //       placeholder: (context, url) =>
                  //           const CircularProgressIndicator(),
                  //       errorWidget: (context, url, error) => SizedBox(
                  //         height: 50,
                  //         width: 50,
                  //         child: Image.network(
                  //             "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQM5z7l_V183adxjX0NHjejDhNSdunjN8UoTkZIBKts_Q&s"),
                  //       ),
                  //     ),
                  //   ),
                  // ),

                  title: Text(
                    allPlayerProvider.allPlayer[index].name!,
                  ),
                  subtitle: Text(
                    DateFormat.yMMMMd()
                        .format(allPlayerProvider.allPlayer[index].createdAt!),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      allPlayerProvider.deletePlayer(id).then(
                        (_) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Berhasil dihapus"),
                              duration: Duration(milliseconds: 500),
                            ),
                          );
                        },
                      );
                    },
                    icon: Icon(Icons.delete),
                  ),
                );
              },
            ),
    );
  }
}
