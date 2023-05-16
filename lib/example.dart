// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: public_member_api_docs

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesDemo extends StatefulWidget {
  const SharedPreferencesDemo({super.key});

  @override
  SharedPreferencesDemoState createState() => SharedPreferencesDemoState();
}

class SharedPreferencesDemoState extends State<SharedPreferencesDemo> {
  int? counter;
  saveUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    counter = await prefs.getInt("counter") ?? 0;
    counter = counter! + 1;
    prefs.setInt("counter", counter!);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SharedPreferences Demo'),
      ),
      body: Center(
        child: counter == null ? Text("wait") : Text(counter.toString()),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: saveUser,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
