import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyElevatedBtn extends StatelessWidget {
  final VoidCallback callback;
  MyElevatedBtn(this.callback);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          onPressed: () {
            callback();
          },
          child: Text("Click Me")),
    );
  }
}
