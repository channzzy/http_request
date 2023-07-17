import 'package:flutter/material.dart';
import 'package:post_method/providers/post_provider.dart';
import 'package:provider/provider.dart';

class PostProvider extends StatelessWidget {
  static const routeName = '/home-provider';
  @override
  Widget build(BuildContext context) {
    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _jobController = TextEditingController();
    final dataProvider = Provider.of<HttpProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("POST - PROVIDER"),
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
                child: Consumer<HttpProvider>(
                  builder: (context, value, child) {
                    return Text(
                      (value.data["id"] == null)
                          ? "ID : Belum ada data"
                          : "ID : ${value.data["id"]}",
                      style: TextStyle(fontSize: 20),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              FittedBox(
                child: Consumer<HttpProvider>(
                  builder: (context, value, child) {
                    return Text(
                      (value.data["name"] == null)
                          ? "Nama : Belum ada data"
                          : "Nama : ${value.data["name"]}",
                      style: TextStyle(fontSize: 20),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              FittedBox(
                child: Consumer<HttpProvider>(
                  builder: (context, value, child) {
                    return Text(
                      (value.data["job"] == null)
                          ? "Job : Belum ada data"
                          : "Job : ${value.data["job"]}",
                      style: TextStyle(fontSize: 20),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              FittedBox(
                child: Consumer<HttpProvider>(
                  builder: (context, value, child) {
                    return Text(
                      (value.data["createdAt"] == null)
                          ? "createdAt : Belum ada data"
                          : "createdAt : ${value.data["createdAt"]}",
                      style: TextStyle(fontSize: 20),
                    );
                  },
                ),
              ),
              const SizedBox(height: 100),
              OutlinedButton(
                onPressed: () {
                  dataProvider.connectApiProvider(
                      _nameController.text, _jobController.text);
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
