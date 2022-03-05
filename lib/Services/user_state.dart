import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:silend/Screens/bottom_bar.dart';
import 'package:silend/Screens/welcome.dart';

import '../DatabaseMethods/database.dart';

class UserState extends StatelessWidget {
  List<PageViewModel> listPagesViewModel = [
    PageViewModel(
      title: "Hello",
      body:
          "A new way to pay it forward. Give Anonymously Receive to pay it forward. Give Anonymously Receive Silently.A new way to pay it forward. Give Anonymously Receive Silently. A new way to pay it forward. Give Anonymously Receive Silently.",
      image: Center(
        child: Image.asset("assets/images/brittblack120.png", height: 175.0),
      ),
    ),
    PageViewModel(
      title: 'asd',
      body:
          "A new way to pay it forward. Give Anonymously Receive to pay it forward. Give Anonymously Receive Silently.A new way to pay it forward. Give Anonymously Receive Silently. A new way to pay it forward. Give Anonymously Receive Silently.",
      image: Center(
        child: Image.asset("assets/images/Layer 2.1.png", height: 175.0),
      ),
    ),
    PageViewModel(
      title: 'Solution',
      image: Center(
        child: Image.asset("assets/images/Layer 2.0.png", height: 175.0),
      ),
    )
  ];
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
                  IntroductionScreen(
                pages: listPagesViewModel,
                showSkipButton: true,
                skip: const Text("Skip"),
                done: const Text("Done",
                    style: TextStyle(fontWeight: FontWeight.w600)),
                onDone: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => WelcomescreenWidget(),
                  ));
                },
                baseBtnStyle: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
                skipStyle: TextButton.styleFrom(primary: Colors.red),
              );
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
