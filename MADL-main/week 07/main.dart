import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation & Gestures Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/second': (context) => SecondScreen(),
      },
    );
  }
}

// Home Screen
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Screen')),
      body: Center(
        child: GestureDetector(
          onTap: () {
            // Navigate to Second Screen
            Navigator.pushNamed(context, '/second');
          },
          onLongPress: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Long Pressed Home Container!')),
            );
          },
          child: Container(
            width: 200,
            height: 200,
            color: Colors.blue,
            alignment: Alignment.center,
            child: Text(
              'Tap Me!',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
        ),
      ),
    );
  }
}

// Second Screen
class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  Color containerColor = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Second Screen')),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              containerColor = containerColor == Colors.red ? Colors.green : Colors.red;
            });
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Container color changed!')),
            );
          },
          onDoubleTap: () {
            Navigator.pop(context);
          },
          child: Container(
            width: 200,
            height: 200,
            color: containerColor,
            alignment: Alignment.center,
            child: Text(
              'Tap to Change Color\nDouble Tap to Go Back',
              style: TextStyle(color: Colors.white, fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
