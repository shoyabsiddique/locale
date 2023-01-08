import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:locale/pages/chat.dart';
import 'package:locale/pages/forgotpass.dart';
import 'package:locale/pages/home.dart';
import 'package:locale/pages/otp.dart';
import 'package:locale/pages/profile.dart';
import 'package:locale/pages/register.dart';
import 'package:locale/pages/splash.dart';
import 'package:locale/widgets/signup_user.dart';

import 'pages/login.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/splash',
    routes: {
      '/splash': (context) => Splash(),
      '/login': (context) => Login(),
      '/signup': (context) => Register(),
      '/forgotpass': (context) => ForgotPass(),
      '/otp': (context) => OTP(),
      'home': (context) => Home(),
      '/profile': (context) => Profile(),
      '/chat': (context) => Chat(),
    },
  ));
}