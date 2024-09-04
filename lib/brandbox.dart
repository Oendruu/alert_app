import 'package:flutter/material.dart';

class BrandBox extends StatelessWidget {
  final String brandName;
  final String logoPath;
  final VoidCallback onPressed; // Add this line

  const BrandBox({
    super.key,
    required this.brandName,
    required this.logoPath,
    required this.onPressed, // Add this line
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white, // Background color
        shadowColor: Colors.grey,
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: onPressed, // Use the callback
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Image.asset(logoPath, height: 50), // Brand logo
            const SizedBox(width: 20),
            Text(
              brandName,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
