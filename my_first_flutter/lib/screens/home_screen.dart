import 'package:flutter/material.dart';
import 'package:my_first_flutter/screens/login_screen.dart'; // Import halaman login

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
        backgroundColor: Colors.teal, // Set your preferred color
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        color: Colors.teal.shade50, // Set your preferred color
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Welcome to the Home Screen!',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.teal, // Set your preferred text color
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Navigasi kembali ke halaman login
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                  (route) => false,
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.teal, // Set your preferred button color
              ),
              child: Text(
                'Logout',
                style: TextStyle(
                  color: Colors.white, // Set your preferred text color
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
