import 'package:flutter/material.dart';
import 'package:test_notification/api/firebase_api.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<String?>? token;

  @override
  void initState() {
    super.initState();
    token = FirebaseApi().getToken();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade300,
      appBar: AppBar(
        title: const Text('PushNotifications'),
        backgroundColor: Colors.blue.shade200,
      ),
      body: Center(
        child: FutureBuilder<String?>(
            future: token,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return Text(snapshot.data ?? 'No token');
              }
            }),
      ),
    );
  }
}
