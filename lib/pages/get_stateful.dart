import 'dart:math';

import 'package:flutter/material.dart';
import 'package:post_method/models/get_stateful.dart';

class GetPageStateful extends StatefulWidget {
  static const routeName = '/get-stateful';
  @override
  _GetPageStatefulState createState() => _GetPageStatefulState();
}

class _GetPageStatefulState extends State<GetPageStateful> {
  GetStateful dataReponse = GetStateful();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GET - STATEFUL"),
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ClipRRect(
            //   borderRadius: BorderRadius.circular(50),
            //   child: Container(
            //     height: 100,
            //     width: 100,
            //     child: Image.network(
            //       (dataReponse.avatar == null)
            //           ? "https://www.uclg-planning.org/sites/default/files/styles/featured_home_left/public/no-user-image-square.jpg?itok=PANMBJF-"
            //           : dataReponse.avatar!,
            //       fit: BoxFit.cover,
            //     ),
            //   ),
            // ),
            SizedBox(height: 20),
            FittedBox(
              child: Text(
                (dataReponse.id == null)
                    ? "ID: Belum Ada Data"
                    : "ID : ${dataReponse.id}",
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(height: 20),
            FittedBox(
              child: Text(
                (dataReponse.fullname == null)
                    ? "Fullname: Belum Ada Data"
                    : "Fullname : ${dataReponse.fullname}",
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(height: 20),
            FittedBox(
              child: Text(
                (dataReponse.id == null)
                    ? "Email: Belum Ada Data"
                    : "Email : ${dataReponse.email}",
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(height: 100),
            OutlinedButton(
              onPressed: () {
                GetStateful.getStateful((1 + Random().nextInt(10)).toString())
                    .then((value) {
                  setState(() {
                    dataReponse = value;
                  });
                });
              },
              child: Text(
                "GET DATA",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
