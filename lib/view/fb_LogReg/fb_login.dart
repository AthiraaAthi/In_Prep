import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:in_prep/view/fb_LogReg/fb_home.dart';
import 'package:in_prep/view/fb_LogReg/fb_register.dart';

class FbLogin extends StatefulWidget {
  const FbLogin({super.key});

  @override
  State<FbLogin> createState() => _FbLoginState();
}

class _FbLoginState extends State<FbLogin> {
  final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 166, 213, 168),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Firebase Login",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  color: const Color.fromARGB(255, 21, 69, 23)),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              height: 50,
              width: 300,
              decoration: BoxDecoration(
                  border: Border.all(color: Color.fromARGB(255, 21, 69, 23)),
                  borderRadius: BorderRadius.circular(15)),
              child: TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 25),
                    border: InputBorder.none,
                    hintText: "Firebase Email",
                    hintStyle: TextStyle(
                        color: Color.fromARGB(255, 21, 69, 23), fontSize: 15)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              width: 300,
              decoration: BoxDecoration(
                  border: Border.all(color: Color.fromARGB(255, 21, 69, 23)),
                  borderRadius: BorderRadius.circular(15)),
              child: TextFormField(
                controller: passController,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 25),
                    border: InputBorder.none,
                    hintText: "Firebase Password",
                    hintStyle: TextStyle(
                        color: Color.fromARGB(255, 21, 69, 23), fontSize: 15)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () async {
                try {
                  final credential = await FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: emailController.text,
                          password: passController.text);
                  if (credential.user?.uid != null) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FbHome(),
                        ));
                  }
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'Week Password') {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("password too short"),
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.red,
                        margin: EdgeInsets.only(top: 50, left: 20, right: 20),
                      ),
                    );
                  } else if (e.code == "email already exists") {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("password too short"),
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.red,
                        margin: EdgeInsets.only(top: 50, left: 20, right: 20),
                      ),
                    );
                  }
                } catch (e) {
                  print(e);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(e.toString()),
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.red,
                      margin: EdgeInsets.only(top: 50, left: 20, right: 20),
                    ),
                  );
                }
              },
              child: Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 21, 69, 23),
                    borderRadius: BorderRadius.circular(15)),
                child: Center(
                  child: Text(
                    "Login",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account in firebase?",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  width: 5,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FbRegister(),
                        ));
                  },
                  child: Text(
                    "Register now",
                    style: TextStyle(
                        color: Color.fromARGB(255, 21, 69, 23),
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
