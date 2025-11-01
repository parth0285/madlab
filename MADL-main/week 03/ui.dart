import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UI Lab',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          bodyText2: TextStyle(fontSize: 18, color: Colors.black),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter UI Lab'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Row with Containers
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    color: Colors.red,
                  ),
                  Container(
                    width: 60,
                    height: 60,
                    color: Colors.green,
                  ),
                  Container(
                    width: 60,
                    height: 60,
                    color: Colors.blue,
                  ),
                ],
              ),
              SizedBox(height: 20), // Spacing
              
              // TextField
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your name',
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              SizedBox(height: 20),

              // Button
              ElevatedButton.icon(
                onPressed: () {
                  print("Button Pressed!");
                },
                icon: Icon(Icons.send),
                label: Text("Submit"),
              ),

              SizedBox(height: 20),

              // Styled Container
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.orangeAccent,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Text(
                  "This is a styled container",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
