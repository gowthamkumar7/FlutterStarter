import 'package:challenge_1/play_ground/MyElevatedBtn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RootedClass extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RootClass();
  }
}

class RootClass extends State<RootedClass> {
  String data = "Hello ";
  // final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      // key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Column(
        children: [   
          Text(data), MyElevatedBtn(updateText)],
      ),
    ));
    ;
  }

  _showToast() {
    print("Gowtham");
  }

  updateText() {
    setState(() {
      data = data + "Gowtham";
    });
  }
}
