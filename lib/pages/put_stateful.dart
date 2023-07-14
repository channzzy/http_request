import 'package:flutter/material.dart';
import 'package:post_method/models/put_stateful.dart';

class PutPageStateful extends StatefulWidget {
  static const routeName = '/put-stateful';

  const PutPageStateful({super.key});
  @override
  _PutPageStatefulState createState() => _PutPageStatefulState();
}

class _PutPageStatefulState extends State<PutPageStateful> {
  PutStateful putResponse = PutStateful();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _jobController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PUT - STATEFUL"),
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
              const SizedBox(height: 20),
              FittedBox(
                child: Text(
                  putResponse.name == null
                      ? "Name : Belum ada data"
                      : "Name : ${putResponse.name}",
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              FittedBox(
                child: Text(
                  putResponse.job == null
                      ? "Job : Belum ada data"
                      : "Job: ${putResponse.job}",
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              FittedBox(
                child: Text(
                  putResponse.updatedAt == null
                      ? "updateAt : Belum ada data"
                      : "updateAt : ${putResponse.updatedAt}",
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(height: 100),
              OutlinedButton(
                onPressed: () {
                  PutStateful.putStateful(
                          _nameController.text, _jobController.text)
                      .then((value) {
                    setState(() {
                      putResponse = value;
                    });
                  });
                },
                child: const Text(
                  "PUT DATA",
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
