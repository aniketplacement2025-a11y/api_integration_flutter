import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MUltipart Request"),
      ),
      body: Column(
        children: [

          Expanded(
              child: Container(

              ),
          ),

          TextButton(
              onPressed:(){},
              child: Text("Pick Image"),
          ),

          Expanded(
            child: Container(

            ),
          ),
        ],
      ),
    );
  }
}
