import 'package:flutter/material.dart';
import 'package:get_macadress/view_model/network_info_view_model.dart';

Future<void> ShowEditIpDialog(BuildContext context,
    NetworkInfoViewModel viewModel, TextEditingController _ipController) async {
  _ipController.text = viewModel.ipAddress ?? ''; // Prepopulate with current IP

  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          "Edit IP Address",
          style: TextStyle(
            fontSize: 18,
            color: Colors.deepPurpleAccent,
            fontWeight: FontWeight.w500,
          ),
        ),
        content: TextField(
          controller: _ipController,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey,
                width: 1.5,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.deepPurple,
                width: 1.5,
              ),
            ),
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text(
              "Cancel",
              style: TextStyle(
                color: Colors.red.shade700,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
          ),
          TextButton(
            child: Text(
              "Save",
              style: TextStyle(
                color: Colors.green.shade700,
              ),
            ),
            onPressed: () {
              // Update IP address in the ViewModel
              viewModel.updateIpAddress(_ipController.text);
              Navigator.of(context).pop(); // Close the dialog
            },
          ),
        ],
      );
    },
  );
}
