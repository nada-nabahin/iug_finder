// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
//import 'package:lost_and_found/my_report_details_screen.dart';

class MyReportsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_forward, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyReportsScreen()),
              );
            },
          ),
          title: Text("بلاغاتي")),
      body: Center(child: Text("هذه واجهة بلاغاتي")),
    );
  }
}
