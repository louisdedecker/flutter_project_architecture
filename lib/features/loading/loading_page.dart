import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Container(
        child: Center(
          child: CupertinoActivityIndicator(),
        ),
      ),
    );
  }
}
