// lib/views/home_screen.dart
import 'package:flutter/material.dart';

import 'ip_adress_screen.dart';
import 'mac_adress_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Network Info',
          style: TextStyle(
            fontSize: 32,
            color: Colors.deepPurpleAccent,
            fontWeight: FontWeight.w600
          ),
        ),

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 60,
              width: 250,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MacAddressScreen()),
                  );
                },
                child: const Text(
                  'MAC Addressni olish',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurpleAccent,
                  shape: RoundedRectangleBorder(
                    // This defines the button shape
                    borderRadius: BorderRadius.circular(8), // Rounded corners
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 250,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => IpAddressScreen()),
                  );
                },
                child: const Text(
                  'IP Addressni olish',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurpleAccent,
                  shape: RoundedRectangleBorder(
                    // This defines the button shape
                    borderRadius: BorderRadius.circular(8), // Rounded corners
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
