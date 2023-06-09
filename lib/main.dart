
import 'package:ferofen_chat/pages/landing_page.dart';
import 'package:ferofen_chat/pages/sign_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();
  runApp(const MyApp());
} 
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FerofenChat',
      debugShowCheckedModeBanner:false,
      theme:ThemeData(
        primarySwatch:Colors.green
      ),

      home:LandingPage()
    );
  }
}