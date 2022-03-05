import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:silend/Screens/bottom_bar.dart';
import 'package:silend/Screens/welcome.dart';

import '../DatabaseMethods/database.dart';

class UserState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        // ignore: missing_return
        builder: (context, AsyncSnapshot<User?> userSnapshot) {
          if (userSnapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (userSnapshot.connectionState == ConnectionState.active) {
            if (userSnapshot.hasData) {
              print('userSnapshot.hasData ${userSnapshot.hasData}');
              var uid = userSnapshot.data!.uid;
              DatabaseMethods()
                  .fetchUserInfoFromFirebase(uid: userSnapshot.data!.uid)
                  .then((value) {
                print('The user is already logged in');
              });
              return BottomBarScreen();

              // MainScreens();
            } else {
              print('The user didn\'t login yet');
              return
                  // IntroductionAuthScreen();
                  WelcomescreenWidget();
            }
          } else if (userSnapshot.hasError) {
            return Center(
              child: Text('Error occured'),
            );
          } else {
            return Center(
              child: Text('Error occured'),
            );
          }
        });
  }
}
