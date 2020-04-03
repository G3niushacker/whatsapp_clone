import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:whatsapp_clone/Screens/Authentication.dart';
import 'package:whatsapp_clone/Screens/HomeScreen.dart';

// class PhoneAuth {
//   //Handles Auth
//   handleAuth() {
//     return StreamBuilder(
//         stream: FirebaseAuth.instance.onAuthStateChanged,
//         builder: (BuildContext context, snapshot) {
//           if (snapshot.hasData) {
//             return HomeScreen();
//           } else {
//             return Authentication();
//           }
//         });
//   }

//   //Sign out
//   signOut() {
//     FirebaseAuth.instance.signOut();
//   }

//   //SignIn
//   signIn(AuthCredential authCreds) {
//     FirebaseAuth.instance.signInWithCredential(authCreds);
//   }

//   signInWithOTP(smsCode, verId) {
//     AuthCredential authCreds = PhoneAuthProvider.getCredential(
//         verificationId: verId, smsCode: smsCode);
//     signIn(authCreds);
//   }
// }