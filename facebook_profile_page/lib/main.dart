import 'package:facebook_profile_page/forgot_password.dart';
import 'package:facebook_profile_page/login_page.dart';
import 'package:facebook_profile_page/profile_page.dart';
import 'package:facebook_profile_page/users.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override 
  Widget build(BuildContext context){
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Users()
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.light,
          useMaterial3: true,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const LoginPage(),
          '/profile': (context) => const Profile(),
          '/forgot_password': (context) => const ForgotPassword(),
        }
      ),
    );
  }
}