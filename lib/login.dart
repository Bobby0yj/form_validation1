import 'package:flutter/material.dart';
import 'package:form_validation/signup.dart';
import 'package:form_validation/valida_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Validation extends StatefulWidget {
  const Validation({super.key});

  @override
  State<Validation> createState() => _ValidationState();
}

class _ValidationState extends State<Validation> {
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  bool showpassword = true;
  var a = "Invalid Email";
  void submit(name, password) {
    if (name.text == "rvbhadram013@gmail.com") {
      if (password.text == "112") {
        print(
            "WELCOME " + name.text.replaceAll('@gmail.com', "").toUpperCase());
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ValidPage()));
      } else {
        print("Wrong Password");
      }
    } else {
      print(a);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  height: 35,
                  width: 265,
                  color: const Color.fromARGB(255, 19, 19, 19),
                  margin: EdgeInsets.all(5),
                  child: const TextButton(
                    onPressed: null,
                    child: Text(
                      "Login Page",
                      style:
                          TextStyle(color: Color.fromARGB(255, 248, 249, 249)),
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  height: 35,
                  width: 265,
                  color: const Color.fromARGB(255, 28, 27, 27),
                  margin: EdgeInsets.all(10),
                  child: TextField(
                      controller: name,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Email",
                          labelStyle: TextStyle(
                              color: Color.fromARGB(255, 100, 101, 102)))),
                ),
              ),
              Center(
                child: Row(
                  children: [
                    Container(
                      height: 35,
                      width: 220,
                      color: const Color.fromARGB(255, 33, 32, 32),
                      margin: const EdgeInsets.all(10),
                      child: TextField(
                          controller: password,
                          obscureText: showpassword,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Password",
                              labelStyle: TextStyle(
                                  color: Color.fromARGB(255, 118, 118, 119)))),
                    ),
                    Container(
                      height: 35,
                      width: 45,
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            showpassword = !showpassword;
                          });
                        },
                        icon: Icon(
                          showpassword
                              ? Icons.remove_red_eye_outlined
                              : Icons.remove_red_eye,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Center(
                child: Container(
                  height: 35,
                  width: 265,
                  margin: const EdgeInsets.all(10),
                  alignment: Alignment.topLeft,
                  child: InkWell(
                    onTap: () {
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => SignUp()));
                    },
                    child: const Text(
                      "Forgot Password ?",
                      style: TextStyle(
                        color: Color.fromARGB(255, 183, 182, 184),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  height: 35,
                  width: 80,
                  color: Color.fromARGB(255, 12, 168, 6),
                  margin: EdgeInsets.all(5),
                  child: TextButton(
                    onPressed: () {
                      submit(name, password);
                    },
                    child: const Text(
                      "Login",
                      style:
                          TextStyle(color: Color.fromARGB(255, 248, 249, 249)),
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  height: 35,
                  width: 265,
                  margin: const EdgeInsets.all(15),
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignUp()));
                    },
                    child: const Text(
                      "Create an Account ?",
                      style: TextStyle(
                        color: Color.fromARGB(255, 193, 192, 194),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
