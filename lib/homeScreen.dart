import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {

  const HomeScreen({ super.key });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> users = [];

   @override
   Widget build(BuildContext context) {
       return Scaffold(
         appBar: AppBar(
           title: const Text('API CALLS'),
         ),// appBar
         body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index){
            final user = users[index];
            final name = user['name']['first'];
            final email = user['email'];
            final imgUrl = user['picture']['thumbnail'];
            return ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network(imgUrl),
              ),
              title: Text(name),
              subtitle: Text(email),
            );//listTile
          },
         ),
         floatingActionButton: FloatingActionButton(
          onPressed: fetchUsers,
         )//floatingActionButton
       );//Scaffold
  }
  Future<void> fetchUsers() async {
    print('fetch users called');
    const url = 'https://randomuser.me/api/?results=10';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body); // Use dart:convert's jsonDecode
    setState(() {
      users = json['results'];
    });
    print('Fetch Users completed');
  }
}

