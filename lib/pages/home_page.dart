import 'package:firebase/services/fire_store_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        elevation: 5,
        title: const Text("Home Page"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await FireStoreService.signout();
            Navigator.of(context).pop();
          },
          child: const Text('Logout'),
        ),
      ),
    );
  }
}
