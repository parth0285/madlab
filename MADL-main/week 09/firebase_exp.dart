import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// Firebase config
const firebaseConfig = FirebaseOptions(
  apiKey: "ZIzaSyBeeXKCVek25Mbjo0BNlFlTJpLVILK7Lpw",
  authDomain: "my-flutter-app-aef79.firebaseapp.com",
  projectId: "my-flutter-app-aef79",
  storageBucket: "my-flutter-app-aef79.firebasestorage.app",
  messagingSenderId: "345634573603",
  appId: "1:345609173603:web:a2c83ab6c7e49a812dd656",
  measurementId: "G-CTG6GEWJ63",
);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: firebaseConfig);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Data Form',
      home: const DataFormPage(),
    );
  }
}

class DataFormPage extends StatefulWidget {
  const DataFormPage({super.key});

  @override
  State<DataFormPage> createState() => _DataFormPageState();
}

class _DataFormPageState extends State<DataFormPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _commentController = TextEditingController();

  final CollectionReference dataCollection =
      FirebaseFirestore.instance.collection('formData');

  Future<void> _submitData() async {
    if (_formKey.currentState!.validate()) {
      await dataCollection.add({
        'name': _nameController.text,
        'age': int.tryParse(_ageController.text) ?? 0,
        'email': _emailController.text,
        'comment': _commentController.text,
        'timestamp': FieldValue.serverTimestamp(),
      });

      // Clear fields after submission
      _nameController.clear();
      _ageController.clear();
      _emailController.clear();
      _commentController.clear();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Data submitted successfully!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Data Storing Form')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(labelText: 'Name'),
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter a name' : null,
                  ),
                  TextFormField(
                    controller: _ageController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: 'Age'),
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter age' : null,
                  ),
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(labelText: 'Email'),
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter email' : null,
                  ),
                  TextFormField(
                    controller: _commentController,
                    decoration: const InputDecoration(labelText: 'Comment'),
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter a comment' : null,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _submitData,
                    child: const Text('Submit'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text('Submitted Data:', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: dataCollection
                    .orderBy('timestamp', descending: true)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  final docs = snapshot.data!.docs;
                  return ListView(
                    children: docs.map((doc) {
                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 4),
                        child: ListTile(
                          title: Text(doc['name']),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Age: ${doc['age']}'),
                              Text('Email: ${doc['email']}'),
                              Text('Comment: ${doc['comment']}'),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
