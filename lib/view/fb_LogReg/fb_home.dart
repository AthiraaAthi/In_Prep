import 'package:flutter/material.dart';
import 'package:in_prep/view/home.dart';

class FbHome extends StatelessWidget {
  const FbHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ));
              },
              icon: Icon(
                Icons.home,
                color: Colors.black,
              ))
        ],
        title: Text("Welcome to Fb Home"),
      ),
    );
  }
}
