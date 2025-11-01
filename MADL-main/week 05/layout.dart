import 'package:flutter/material.dart';

void main() {
  runApp(LayoutLabApp());
}

class LayoutLabApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Layout Lab',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Layout Lab Practice'),
          backgroundColor: Colors.teal,
        ),
        body: Column(
          children: [
            // HEADER SECTION
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              color: Colors.teal[100],
              child: Center(
                child: Text(
                  'Welcome to Layout Lab',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal[900],
                  ),
                ),
              ),
            ),
            
            SizedBox(height: 20),

            // MIDDLE SECTION - Row of Icons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Icon(Icons.home, size: 40, color: Colors.teal),
                    SizedBox(height: 8),
                    Text('Home')
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.favorite, size: 40, color: Colors.red),
                    SizedBox(height: 8),
                    Text('Favorites')
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.settings, size: 40, color: Colors.grey),
                    SizedBox(height: 8),
                    Text('Settings')
                  ],
                ),
              ],
            ),

            SizedBox(height: 20),

            // BOTTOM SECTION - Column of Cards
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 20),
                children: [
                  Card(
                    color: Colors.teal[50],
                    child: ListTile(
                      leading: Icon(Icons.person),
                      title: Text('User Profile'),
                      subtitle: Text('Manage your account'),
                    ),
                  ),
                  Card(
                    color: Colors.teal[50],
                    child: ListTile(
                      leading: Icon(Icons.message),
                      title: Text('Messages'),
                      subtitle: Text('Check your inbox'),
                    ),
                  ),
                  Card(
                    color: Colors.teal[50],
                    child: ListTile(
                      leading: Icon(Icons.notifications),
                      title: Text('Notifications'),
                      subtitle: Text('View alerts'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
