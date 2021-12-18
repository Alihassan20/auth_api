import 'package:flutter/material.dart';

import 'core/storage.dart';
import 'feature/home/view.dart';
import 'feature/login/view.dart';
import 'feature/sign_up/view.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await AppStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AppStorage.isLogged ? const Home() : const Login(),
    );
  }
}

