import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColumnExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
                elevation: 5,
                margin: EdgeInsets.all(10),
                color: Colors.amber,
                child: InkWell(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Text("Hello World, This is Gowtham Kumar"),
                  ),
                  onTap: () {
                    //This is required for ripple effect.
                  },
                ),
              ),
              Card(
                child: Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    color: Colors.cyan,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: Text("1 mg"),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
