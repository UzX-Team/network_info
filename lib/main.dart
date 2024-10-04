// lib/main.dart
import 'package:flutter/material.dart';
import 'package:get_macadress/view/home_screen.dart';
import 'package:provider/provider.dart';

import 'view_model/network_info_view_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NetworkInfoViewModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
