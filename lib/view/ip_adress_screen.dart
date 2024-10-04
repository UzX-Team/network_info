// lib/views/ip_address_screen.dart
import 'package:flutter/material.dart';
import 'package:get_macadress/res/showdialog.dart';
import 'package:get_macadress/view_model/network_info_view_model.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

class IpAddressScreen extends StatefulWidget {
  @override
  _IpAddressScreenState createState() => _IpAddressScreenState();
}

class _IpAddressScreenState extends State<IpAddressScreen> {
  late TextEditingController _ipController;

  @override
  void initState() {
    super.initState();
    // Fetch IP address once when the screen is initialized
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<NetworkInfoViewModel>(context, listen: false)
          .fetchIpAddress();
    });

    // Initialize TextEditingController
    _ipController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.deepPurpleAccent),
        title: Text(
          'IP Address',
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
            } else if (viewModel.ipAddress != null) {
              return Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'IP Address: ${viewModel.ipAddress}',
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                      QrImageView(
                        data: viewModel.ipAddress!,
                        version: QrVersions.auto,
                        size: 200.0,
                      ),
                      SizedBox(height: 30),
                      SizedBox(
                        height: 40,
                        width: 200,
                        child: ElevatedButton(
                          onPressed: () {
                            ShowEditIpDialog(
                              context,
                              viewModel,
                              _ipController,
                            );
                          },
                          child: Text(
                            "Edit IP Address",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurpleAccent,
                            shape: RoundedRectangleBorder(
                              // This defines the button shape
                              borderRadius:
                                  BorderRadius.circular(8), // Rounded corners
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return Center(
                child: Text(
                  'Iltimos, IP manzilni olish uchun kuting.',
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

  // Function to show the dialog for editing IP Address

  @override
  void dispose() {
    _ipController.dispose();
    super.dispose();
  }
}
