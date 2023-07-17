import 'package:flutter/material.dart';
import 'package:post_method/providers/put_provider.dart';
import 'package:provider/provider.dart';

class PutPageProvider extends StatelessWidget {
  static const routeName = '/put-provider';
  @override
  Widget build(BuildContext context) {
    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _jobController = TextEditingController();
    final putProvider = Provider.of<PutProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("PUT - PROVIDER"),
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
              const SizedBox(height: 20),
              FittedBox(
                child: Consumer<PutProvider>(
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
                child: Consumer<PutProvider>(
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
                child: Consumer<PutProvider>(
                  builder: (context, value, child) {
                    return Text(
                      (value.data["updatedAt"] == null)
                          ? "updatedAt : Belum ada data"
                          : "updatedAt : ${value.data["updatedAt"]}",
                      style: TextStyle(fontSize: 20),
                    );
                  },
                ),
              ),
              const SizedBox(height: 100),
              OutlinedButton(
                onPressed: () {
                  putProvider.connectApiProvider(
                      _nameController.text, _jobController.text);
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
