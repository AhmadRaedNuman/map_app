import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:map_case/model/user.dart';

class UserPage extends StatefulWidget {
  final VoidCallback fetchUsersCallback;
  const UserPage({super.key, required this.fetchUsersCallback});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  List<User> users = [];
  bool isLoading = true;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Page'),
        backgroundColor: Colors.blue,
        titleTextStyle: const TextStyle(color: Colors.white),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : errorMessage.isNotEmpty
              ? Center(
                  child: Text(errorMessage,
                      style: const TextStyle(color: Colors.red)))
              : ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    final user = users[index];
                    final email = user.email;
                    final phone = user.phone;
                    final gender = user.gender;
                    final color = gender == 'male'
                        ? const Color.fromARGB(255, 12, 186, 255)
                        : const Color.fromARGB(255, 255, 156, 189);

                    return ListTile(
                      leading: Text('${index + 1}'),
                      title: Text(email),
                      tileColor: color,
                      shape: Border.all(width: 2, color: Colors.black),
                      subtitle: Text('$phone / $gender'),
                    );
                  },
                ),
    );
  }

  Future<void> fetchUsers() async {
    setState(() {
      isLoading = true;
      errorMessage = '';
    });

    const url = 'https://randomuser.me/api/?results=200';
    try {
      final uri = Uri.parse(url);
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final results = json['results'] as List<dynamic>;

        final transformed = results.map((e) {
          final name = UserName(
            title: e['name']['title'],
            first: e['name']['first'],
            last: e['name']['last'],
          );
          return User(
            email: e['email'],
            gender: e['gender'],
            phone: e['phone'],
            name: name,
          );
        }).toList();

        setState(() {
          users = transformed;
          isLoading = false;
        });
      } else {
        setState(() {
          errorMessage =
              'Failed to fetch users (Status Code: ${response.statusCode})';
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = 'An error occurred: $e';
        isLoading = false;
      });
    }
  }
}
