import 'package:flutter/material.dart';

AlertDialog loading = AlertDialog(
  title: Text("Wait Please"),
  content: SizedBox(width: 100, height: 100, child: Center(child: CircularProgressIndicator())),
);
