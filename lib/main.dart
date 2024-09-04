// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'dart:math';
import 'package:alert_app/dashboard.dart';
import 'package:alert_app/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SERV!Sense - Alert App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SignUpScreen(),
    );
  }
}

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

 Future<void> _signUp() async {
  String username = _usernameController.text;
  String email = _emailController.text;

  // Generate a 4-digit pin
  int pin = Random().nextInt(9000) + 1000;

  // Get current timestamp
  Timestamp registrationDate = Timestamp.now();

  // Save user data to Firestore
  await _firestore.collection('users').add({
    'username': username,
    'email': email,
    'pin': pin,
    'registrationDate': registrationDate,
  });

  // Navigate to Dashboard
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => DashboardScreen(
        username: username,
        email: email,
        pin: pin,
      ),
    ),
  );
}


  void _navigateToPinLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const PinLoginScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email ID',
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _signUp,
                child: const Text("Sign Up"),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: _navigateToPinLogin,
                child: const Text("Already registered? Use your pin"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



class PinLoginScreen extends StatefulWidget {
  const PinLoginScreen({super.key});

  @override
  _PinLoginScreenState createState() => _PinLoginScreenState();
}

class _PinLoginScreenState extends State<PinLoginScreen> {
  final TextEditingController _pinController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> _loginWithPin() async {
    int enteredPin = int.parse(_pinController.text);

    // Query Firestore to find the user with this pin
    QuerySnapshot userSnapshot = await _firestore
        .collection('users')
        .where('pin', isEqualTo: enteredPin)
        .get();

    if (userSnapshot.docs.isNotEmpty) {
      var user = userSnapshot.docs.first.data() as Map<String, dynamic>;
      String username = user['username'];
      String email = user['email'];

      // Navigate to Dashboard
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => DashboardScreen(
            username: username,
            email: email,
            pin: enteredPin,
          ),
        ),
      );
    } else {
      // Show an error if pin is not found
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid PIN. Please try again.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pin Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _pinController,
              decoration: const InputDecoration(
                labelText: 'Enter your 4-digit PIN',
              ),
              keyboardType: TextInputType.number,
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _loginWithPin,
              child: const Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
