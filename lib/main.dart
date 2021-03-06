import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ecomerience_21/packages/quote/quote.dart';
import 'package:flutter_ecomerience_21/packages/quote/quote_model.dart';
import 'package:flutter_ecomerience_21/pages/landing_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Quotes().getAll();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LandingPage(),
    );
  }
}
