import 'package:alert_app/details.dart';
import 'package:flutter/material.dart';
import 'brandbox.dart'; // Import the BrandBox widget

class AcBrandPage extends StatelessWidget {
  const AcBrandPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select AC Brand"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          BrandBox(
            brandName: 'Samsung',
            logoPath: 'assets/images/samsung.png',
            onPressed: () => _navigateToDetailsPage(context, 'AC', 'Samsung'),
          ),
          const SizedBox(height: 20),
          BrandBox(
            brandName: 'Lloyd',
            logoPath: 'assets/images/lloyd.png',
            onPressed: () => _navigateToDetailsPage(context, 'AC', 'Lloyd'),
          ),
          const SizedBox(height: 20),
          BrandBox(
            brandName: 'LG',
            logoPath: 'assets/images/lg.png',
            onPressed: () => _navigateToDetailsPage(context, 'AC', 'LG'),
          ),
          const SizedBox(height: 20),
          BrandBox(
            brandName: 'Whirlpool',
            logoPath: 'assets/images/whirlpool.png',
            onPressed: () => _navigateToDetailsPage(context, 'AC', 'Whirlpool'),
          ),
        ],
      ),
    );
  }

  void _navigateToDetailsPage(BuildContext context, String applianceType, String brandName) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailsPage(
          applianceType: applianceType,
          applianceBrand: brandName, brandName: '',
        ),
      ),
    );
  }
}
