import 'package:flutter/material.dart';
import 'package:instaclone/services/auth_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void logout () {
    final AuthService _auth = AuthService();
    _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 100),
            Text("Capybara App"),
            const SizedBox(height: 100),
            GestureDetector(
              onTap: logout,
              child: 
                Icon(Icons.logout)
              )
          ],
        ),
      ),
    );
  }
}