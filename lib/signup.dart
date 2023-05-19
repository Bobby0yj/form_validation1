import 'dart:convert';
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:form_validation/valida_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Userprofile extends StatefulWidget {
  const Userprofile({Key? key}) : super(key: key);

  @override
  UserprofileState createState() => UserprofileState();
}

class UserprofileState extends State<Userprofile> {
  String? imageUrl =
      "data:image/png;base64,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";

  void updateImage(String newImageUrl) {
    setState(() {
      imageUrl = newImageUrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 200,
          height: 200,
          child: imageUrl != null
              ? CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl!),
                  child: Container(
                    alignment: Alignment.bottomRight,
                    child: Icon(Icons.add_a_photo_outlined),
                  ),
                )
              : Placeholder(),
        ),
      ],
    );
  }
}

class ImageUrl extends StatelessWidget {
  final TextEditingController _imageUrlController = TextEditingController();
  final GlobalKey<UserprofileState> _UserprofileKey =
      GlobalKey<UserprofileState>();
  TextEditingController fName = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController gmail = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController cpass = TextEditingController();
  final TextEditingController _profile = TextEditingController();

  userDetails(fName, phone, gmail, dob, pass, cpass) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    Map<String, dynamic> user = {};
    List<Map<String, dynamic>> userList = [];
    user["name"] = fName;
    user["phone"] = phone;
    user["gmail"] = gmail;
    user["dob"] = dob;
    user["password"] = pass;
    user["cpass"] = cpass;
    userList.add(user);
    prefs.setString("listUsers", jsonEncode(userList));
    // setState(() {});
  }

  String dropdownValue = 'Select Gender';
  final dropdownItems = ['Select Gender', 'Male', 'Female', 'Others'];
  CreateUser() {}

  void Submit(fName, phone, gmail, pass, cpass) {
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

              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => ValidPage()));
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
        child: Column(
          children: [
            Container(child: SizedBox(height: 20)),
            Userprofile(key: _UserprofileKey),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 35,
                  width: 265,
                  margin: const EdgeInsets.only(top: 10, left: 53, bottom: 10),
                  child: TextField(
                    controller: _imageUrlController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter Image URL',
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    String imageUrl = _imageUrlController.text;
                    _UserprofileKey.currentState?.updateImage(imageUrl);
                  },
                  child: const Icon(
                    Icons.arrow_forward,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            Container(
              height: 35,
              width: 265,
              margin: EdgeInsets.only(bottom: 10, top: 10),
              child: TextFormField(
                controller: fName,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Name",
                ),
              ),
            ),
            Container(
              height: 35,
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
            Container(
              height: 35,
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
              height: 35,
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
              height: 35,
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
              height: 35,
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
                    // setState(() {
                    //   dropdownValue = newValue;
                    // });
                  }
                },
              ),
            ),
            Container(
              color: Colors.green,
              child: TextButton(
                onPressed: () {
                  userDetails(fName.text, phone.text, gmail.text, dob.text,
                      pass.text, cpass.text);
                  Submit(fName.text, phone.text, gmail.text, pass.text,
                      cpass.text);
                },
                child: const Text(
                  "SignUp",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
