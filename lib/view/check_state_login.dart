import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/resource/google_sign_in.dart';

import 'background_painter.dart';
import 'home.dart';
import 'login.dart';

class CheckState extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    body: ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          final provider = Provider.of<GoogleSignInProvider>(context);
          if(snapshot.hasError) {
            print(snapshot.error);
          }if (provider.isSigningIn) {
            return buildLoading();
          } else if (snapshot.hasData) {
            return HomePage();
          } else {
            return Login();
          }
        },
      ),
    ),
  );

  Widget buildLoading() => Stack(
    fit: StackFit.expand,
    children: [
      CustomPaint(painter: BackgroundPainter()),
      Center(child: CircularProgressIndicator()),
    ],
  );
}
/*if (provider.isSigningIn) {
return buildLoading();
} else*/