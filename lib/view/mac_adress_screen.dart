// lib/views/mac_address_screen.dart
import 'package:flutter/material.dart';
import 'package:get_macadress/view_model/network_info_view_model.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

class MacAddressScreen extends StatefulWidget {
  @override
  _MacAddressScreenState createState() => _MacAddressScreenState();
}

class _MacAddressScreenState extends State<MacAddressScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch MAC address once when the screen is initialized
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<NetworkInfoViewModel>(context, listen: false)
          .fetchMacAddress();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.deepPurpleAccent),
        title: Text(
          'MAC Address',
          style: TextStyle(
              fontSize: 24,
              color: Colors.deepPurpleAccent,
              fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<NetworkInfoViewModel>(
          builder: (context, viewModel, child) {
            if (viewModel.isLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (viewModel.errorMessage != null) {
              return Center(
                child: Text(
                  viewModel.errorMessage!,
                  style: TextStyle(fontSize: 18, color: Colors.red),
                  textAlign: TextAlign.center,
                ),
              );
            } else if (viewModel.macAddress != null) {
              return Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'MAC Address: ${viewModel.macAddress}',
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                      QrImageView(
                        data: viewModel.macAddress!,
                        version: QrVersions.auto,
                        size: 200.0,
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return Center(
                child: Text(
                  'Iltimos, MAC manzilni olish uchun kuting.',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
