import 'package:atelier4_a_charkaoui_iir5g5/ListeProduits.dart';
import 'package:atelier4_a_charkaoui_iir5g5/LoginEcran.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'addproduit.dart';
class Auth extends StatelessWidget {
  const Auth({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
          if (snapshot.connectionState== ConnectionState.waiting){
            return const CircularProgressIndicator();
          } else{
            if (snapshot.hasData){
              return AjoutProduitScreen();
            }else{
              return const LoginEcran();
            }
          }

        },
      ),

    );
  }
}