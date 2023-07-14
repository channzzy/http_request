import 'package:flutter/material.dart';
import 'package:post_method/models/post_stateful.dart';

class PostStateful extends StatefulWidget {
  static const routeName = '/home-stateful';

  const PostStateful({super.key});
  @override
  _PostStatefulState createState() => _PostStatefulState();
}

class _PostStatefulState extends State<PostStateful> {
  HttpStateful dataResponse = HttpStateful();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _jobController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("POST - STATEFUL"),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  hintText: 'Masukan Nama',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: _jobController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  hintText: 'Masukan Job',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text('Hasil Response'),
              const SizedBox(
                height: 20,
              ),
              FittedBox(
                child: Text(
                  dataResponse.id == null
                      ? "ID : Belum ada data"
                      : "ID: ${dataResponse.id}",
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              const SizedBox(height: 20),
              FittedBox(
                child: Text(
                  dataResponse.name == null
                      ? "Name : Belum ada data"
                      : "Name : ${dataResponse.name}",
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              FittedBox(
                child: Text(
                  dataResponse.job == null
                      ? "Job : Belum ada data"
                      : "Job: ${dataResponse.job}",
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              FittedBox(
                child: Text(
                  dataResponse.id == null
                      ? "createdAt : Belum ada data"
                      : "createdAt : ${dataResponse.createdAt}",
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(height: 100),
              OutlinedButton(
                onPressed: () {
                  HttpStateful.connectApi(
                          _nameController.text, _jobController.text)
                      .then((value) {
                    setState(() {
                      dataResponse = value;
                    });
                  });
                },
                child: const Text(
                  "POST DATA",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
