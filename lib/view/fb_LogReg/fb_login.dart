import 'package:flutter/material.dart';
import 'package:in_prep/view/fb_LogReg/fb_home.dart';
import 'package:in_prep/view/fb_LogReg/fb_register.dart';

class FbLogin extends StatelessWidget {
  const FbLogin({super.key});

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
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FbHome(),
                    ));
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
