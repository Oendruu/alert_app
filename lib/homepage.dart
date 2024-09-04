import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'ac.dart';  // Import the AC Brand Page
import 'fridge.dart';  // Import the Fridge Brand Page

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late FlutterLocalNotificationsPlugin localNotification;

  @override
  void initState() {
    super.initState();

    var androidInitialize = const AndroidInitializationSettings('app_icon');
    var initializationSettings =
        InitializationSettings(android: androidInitialize);
    localNotification = FlutterLocalNotificationsPlugin();
    localNotification.initialize(initializationSettings);
  }

  Future _showNotification(String title, String body) async {
    var androidDetails = const AndroidNotificationDetails(
      "Channel ID",
      "AC and Fridge Maintenance",
      importance: Importance.high,
    );
    var generalNotificationDetails =
        NotificationDetails(android: androidDetails);

    await localNotification.show(0, title, body, generalNotificationDetails);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Your Appliance"),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                _showNotification("AC Maintenance", "It's time for AC maintenance!");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AcBrandPage()),
                );
              },
              child: Column(
                children: [
                  Image.asset('assets/images/ac.png', height: 150),
                  const SizedBox(height: 10),
                  const Text("AC"),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                _showNotification("Fridge Maintenance", "It's time for fridge maintenance!");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FridgeBrandPage()),
                );
              },
              child: Column(
                children: [
                  Image.asset('assets/images/fridge.png', height: 150),
                  const SizedBox(height: 10),
                  const Text("Fridge"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
