import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:restro_code/View/add_order/add_order.dart';
import 'package:restro_code/View/login_screen/login.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyC6ZTSWR6hd0vvh5-qnn1WTU4aTvA2UGd8", 
      appId: "1:895085665380:android:f368f4772e388d84f35371", 
      messagingSenderId:"895085665380", 
      projectId: "restroproduct"
    )
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage()
    );
  }
}
