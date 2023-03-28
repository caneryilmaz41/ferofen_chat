import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final User user;
  final VoidCallback onSignOut;
  const HomePage({required this.user,required this.onSignOut, super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title:Text('Anasayfa'),
      actions: [
        ElevatedButton(onPressed: _cikisYap,
        
        child:Text('Çıkış Yap'))
      ],
      ),
      body:Center(child: Text('Hoşgeldiniz ${widget.user.uid}')),
    );
  }

  void _cikisYap() async{
   await FirebaseAuth.instance.signOut();
   widget.onSignOut();
  }
}