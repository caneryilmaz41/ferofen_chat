
import 'package:ferofen_chat/widgets/social_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class SignInPage extends StatelessWidget {
 
  final Function(User ?user)onSigin;
   SignInPage({required this.onSigin, super.key});
  
  void _misafirGirisi() async {
  await Firebase.initializeApp(); // Firebase projenizi yapılandırın
  UserCredential sonuc = await FirebaseAuth.instance.signInAnonymously();
  onSigin(sonuc.user);
  print("oturum açan user id:" + sonuc.user!.uid.toString());
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FerofenChat'),
        elevation: 0,
      ),
      backgroundColor: Colors.grey.shade200,
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Oturum Açın',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
            ),
            const SizedBox(height: 8),
            SocialLoginButton(
                buttonText: 'Google ile Giriş Yap',
                buttonColor: Color(0xFFdb4437),
                textColor: Colors.white,
                radius: 16,
                buttonIcon: Icon(FontAwesomeIcons.google,),
                onPressed: () {}),
                 SocialLoginButton(
                buttonText: 'Facebook ile Giriş Yap',
                buttonColor: Color(0xFF334D92),
                textColor: Colors.white,
                radius: 16,
                buttonIcon: Icon(Icons.facebook),
                onPressed: () {}),
                 SocialLoginButton(
                buttonText: 'E-Mail ile Giriş Yap',
                buttonColor: Colors.green,
                textColor: Colors.white,
                radius: 16,
                buttonIcon: Icon(Icons.mail),
                onPressed: () {}),
                SocialLoginButton(
                buttonText: 'Misafir Girişi',
                buttonColor: Colors.teal,
                textColor: Colors.white,
                radius: 16,
                buttonIcon: Icon(FontAwesomeIcons.user),
                onPressed:_misafirGirisi,
                
                ),
                
          ],
        ),
      ),
    );
  }

 
}
