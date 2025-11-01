import 'dart:convert';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String output = "Loading...";

  @override
  void initState() {
    super.initState();
    loadJson();
  }

  // Use embedded JSON directly
  void loadJson() {
    final Map<String, dynamic> data = {
      "name": "Amal",
      "age": 21,
      "skills": ["Python", "ML"]
    };

    setState(() {
      output =
          "Name: ${data['name']}\nAge: ${data['age']}\nSkills: ${data['skills'].join(', ')}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "JSON Demo",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text("JSON Demo"), backgroundColor: Colors.teal),
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.teal.shade50,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.teal.withOpacity(0.2),
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Text(
              output,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}

 

