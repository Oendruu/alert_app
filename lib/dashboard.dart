import 'package:alert_app/homepage.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  final String username;
  final String email;
  final int pin;

  const DashboardScreen({
    super.key,
    required this.username,
    required this.email,
    required this.pin,
  });

  void _navigateToHome(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const HomePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Welcome, $username!', style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 10),
            Text('Email: $email', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text('Your unique 4-digit PIN: $pin', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _navigateToHome(context),
              child: const Text("Proceed"),
            ),
          ],
        ),
      ),
    );
  }
}
