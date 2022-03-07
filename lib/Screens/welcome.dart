// import 'package:flutter/material.dart';
// import 'dart:math' as math;
// import 'package:flutter_svg/svg.dart';
// import 'package:silend/Theme/colors.dart';

// import '../Components/custom_text_button.dart';
// import '../Components/custom_unicorn_button.dart';
// import 'Auth/Login/UI/login_page.dart';
// import 'Auth/Registration/UI/register_page.dart';

// class WelcomescreenWidget extends StatelessWidget {
//   const WelcomescreenWidget({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // Figma Flutter Generator WelcomescreenWidget - FRAME
//     return SafeArea(
//       child: Scaffold(
//         body: Stack(
//           alignment: Alignment.bottomCenter,
//           children: [
//             Image.asset(
//               'assets/splash_screen_ppl.png',
//               fit: BoxFit.cover,
//               height: MediaQuery.of(context).size.height,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: CustomTextButton(
//                     onTap: () {
//                       Navigator.of(context).push(MaterialPageRoute(
//                         builder: (context) => const LoginPage(),
//                       ));
//                     },
//                     text: 'Login',
//                     isGradient: true,
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: MyOutlinedButton(
//                     onPressed: () {
//                       Navigator.of(context).push(MaterialPageRoute(
//                         builder: (context) => RegisterPage(),
//                       ));
//                       // Navigator.of(context).push(MaterialPageRoute(
//                       //   builder: (context) => const HomeNewUserFollowPage(),
//                       // ));
//                     },
//                     gradient:
//                         LinearGradient(colors: [btnGradLeft, btnGradRight]),
//                     child: Text(
//                       'Sign Up',
//                       style: TextStyle(color: btnGradLeft, fontSize: 20),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
