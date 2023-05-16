import 'package:flutter/material.dart';

class ValidPage extends StatefulWidget {
  const ValidPage({Key? key}) : super(key: key);

  @override
  _ValidPageState createState() => _ValidPageState();
}

class _ValidPageState extends State<ValidPage> {
  String dropList = "Male";
  final dropDown = ['Male', 'Female', 'others'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome RUDRARAPU VEERABHADRAM"),
      ),
      body: Container(
        color: Colors.black,
      ),
    );
  }
}
