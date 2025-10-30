import 'package:flutter/material.dart';
import 'widgets/user_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Debug Demo',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final users = ['Alice', 'Bob', 'Charlie', 'David'];

    return Scaffold(
      appBar: AppBar(title: const Text('User List')),
      body: ListView(
        children: users
            .map((u) => UserCard(
          name: u,
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('$u tapped!')),
            );
          },
        ))
            .toList(),
      ),
    );
  }
}