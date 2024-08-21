import 'package:flutter/material.dart';
import 'package:in_prep/controller/my_controller.dart';
import 'package:in_prep/model/api_model.dart';
import 'package:in_prep/view/fb_LogReg/fb_login.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SampleApi sampleApiobj = SampleApi();
  @override
  void initState() {
    fetchdata();
    super.initState();
  }

  Future<void> fetchdata() async {
    await Provider.of<MyController>(context, listen: false).fetchData();
  }

  @override
  Widget build(BuildContext context) {
    final MyControllerobj = Provider.of<MyController>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("fetching from Api"),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FbLogin(),
                      ));
                },
                icon: Icon(
                  Icons.swipe_right,
                  color: Colors.black,
                ))
          ],
        ),
        body: ListView.builder(
          itemCount: MyControllerobj.sampleApiobj.users?.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 500,
              width: 500,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                children: [
                  Text(
                    MyControllerobj.sampleApiobj.users?[index].firstName ?? "",
                    style: TextStyle(fontSize: 40),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
