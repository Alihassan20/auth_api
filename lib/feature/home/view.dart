import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
        body:  Container(
          child: const Center(
            child: Text("Home",style: TextStyle(fontSize: 50),),
          ),
        ));
  }
}
