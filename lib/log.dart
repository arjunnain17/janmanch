import 'package:flutter/material.dart';
import 'option.dart'; // Make sure option.dart is imported to use OptionsScreen
import 'businesslandingpage.dart'; // Import the BusinessLandingPage
import 'categories.dart'; // Import the CategoriesPage

class LogPage extends StatefulWidget {
  const LogPage({super.key});

  @override
  _LogPageState createState() => _LogPageState();
}

class _LogPageState extends State<LogPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _aadharController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _aadharController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Function to validate form and submit
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // If form is valid, navigate to OptionsScreen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => OptionsScreen()), // Navigate to OptionsScreen
      );

      // Display the login data (optional)
      print('Name: ${_nameController.text}');
      print('Aadhaar: ${_aadharController.text}');
      print('Password: ${_passwordController.text}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Full Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your full name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _aadharController,
                decoration: const InputDecoration(labelText: 'Aadhaar Number'),
                keyboardType: TextInputType.number,
                maxLength: 12,
                validator: (value) {
                  if (value == null || value.length != 12) {
                    return 'Please enter a valid 12-digit Aadhaar number';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true, // To hide the password input
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              // "Login as Customer" button
              ElevatedButton(
                onPressed: () {
                  // Validate the form first
                  if (_formKey.currentState!.validate()) {
                    // If valid, navigate to CategoriesPage
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CategoriesPage()), // Navigate to CategoriesPage
                    );
                  }
                },
                child: const Text('Login as Customer'),
              ),
              const SizedBox(height: 10), // Space between buttons
              // "Login as Business" button
              ElevatedButton(
                onPressed: () {
                  // Validate the form first
                  if (_formKey.currentState!.validate()) {
                    // If valid, navigate to BusinessLandingPage
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BusinessLandingPage()), // Navigate to BusinessLandingPage
                    );
                  }
                },
                child: const Text('Login as Business'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
