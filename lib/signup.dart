import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:form_validation/valida_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController fName = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController gmail = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController cpass = TextEditingController();
  int? counter = 0;
  List userList = [];
  userDetails(fName, phone, gmail, dob, pass, cpass) {
    Map user = {};
    user["name"] = fName;
    user["phone"] = phone;
    user["gmail"] = gmail;
    user["dob"] = dob;
    user["password"] = pass;
    user["cpass"] = cpass;
    userList.add(user);
    print(userList);
  }

  String dropdownValue = 'Select Gender';
  final dropdownItems = ['Select Gender', 'Male', 'Female', 'Others'];
  CreateUser() {}

  void Submit(fName, phone, gmail, pass, cpass) {
    // var fName = "Bobby";
    // var phone = "7095631376";
    // var plus = "+91 ";
    // var gmail = "rvbhadram013@gmail.com";
    // var pass = "Bobby1234";
    // var cpass = "Bobby@1234";

    RegExp firstname = RegExp(r'^[A-Z]+[a-z]');
    RegExp phoneNumber = RegExp(r'^[0-9]{10}$');
    RegExp emailid = RegExp(r'^[a-z]+[0-9]+[@]+[a-z]+[.]');
    RegExp password = RegExp(r'^[A-Z]+[a-z]+[!@#$%^&]+[0-9]');
    RegExp dateOfBirth = RegExp(r'^[0-9]');

    if (firstname.hasMatch(fName)) {
      print(fName);
      if (phoneNumber.hasMatch(phone)) {
        phone = "+" + phone;
        print(phone);
        if (emailid.hasMatch(gmail)) {
          print(gmail);
          if (password.hasMatch(pass)) {
            print(pass);
            if (pass == cpass) {
              print(cpass);

              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ValidPage()));
            } else {
              print("Password Doesn't Match");
            }
          } else {
            print("Invalid Password");
          }
        } else {
          print("Invalid Mail");
        }
      } else {
        print("Invalid Mobile No");
      }
    } else {
      print("Invalid Name");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            height: 30,
            width: 265,
            margin: EdgeInsets.only(bottom: 10),
            color: Colors.lightGreen,
            child: const Center(
              child: Text("Sign Up Page"),
            ),
          ),
          Container(
            height: 30,
            width: 265,
            margin: EdgeInsets.only(bottom: 10),
            child: TextFormField(
              controller: fName,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Name",
              ),
            ),
          ),
          Container(
            height: 30,
            width: 265,
            margin: EdgeInsets.only(bottom: 10),
            child: TextFormField(
              keyboardType: TextInputType.number,
              controller: phone,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Mobile No",
              ),
            ),
          ),
          // Container(
          //   height: 30,
          //   width: 200,
          //   margin: EdgeInsets.only(bottom: 10),
          //   child: TextFormField(

          //     decoration: const InputDecoration(
          //       border: OutlineInputBorder(),
          //       labelText: "Age",
          //     ),
          //   ),
          // ),
          Container(
            height: 30,
            width: 265,
            margin: EdgeInsets.only(bottom: 10),
            child: TextFormField(
              controller: gmail,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Gmail",
              ),
            ),
          ),
          Container(
            height: 30,
            width: 265,
            margin: EdgeInsets.only(bottom: 10),
            child: TextFormField(
              controller: dob,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Date of Birth",
              ),
            ),
          ),
          Container(
            height: 30,
            width: 265,
            margin: EdgeInsets.only(bottom: 10),
            child: TextFormField(
              controller: pass,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Password",
              ),
            ),
          ),
          Container(
            height: 30,
            width: 265,
            margin: EdgeInsets.only(bottom: 10),
            child: TextFormField(
              controller: cpass,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Confirm Password",
              ),
            ),
          ),
          Container(
            height: 50,
            width: 265,
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(bottom: 10),
            child: DropdownButton(
              value: dropdownValue,
              icon: const Icon(
                Icons.arrow_drop_down,
              ),
              items: dropdownItems.map((String item) {
                return DropdownMenuItem(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    dropdownValue = newValue;
                  });
                }
              },
            ),
          ),
          Container(
            height: 35,
            width: 265,
            // child: Radio(value: ),
          ),
          Container(
            color: Colors.green,
            child: TextButton(
              onPressed: () {
                userDetails(fName.text, phone.text, gmail.text, dob.text,
                    pass.text, cpass.text);
                Submit(
                    fName.text, phone.text, gmail.text, pass.text, cpass.text);
              },
              child: const Text(
                "SignUp",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Text(counter.toString())
        ]),
      ),
    );
  }
}
