import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
  
}

class _LoginPageState extends State<LoginPage> {

  
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _aadharController = TextEditingController();
  final _panController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController(); // New password controller

  @override
  void dispose() {
    _nameController.dispose();
    _aadharController.dispose();
    _panController.dispose();
    _phoneController.dispose();
    _passwordController.dispose(); // Dispose password controller
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // You can now use the form data (for example, send it to a server or display it)
      print('Name: ${_nameController.text}');
      print('Aadhaar: ${_aadharController.text}');
      print('PAN: ${_panController.text}');
      print('Phone: ${_phoneController.text}');
      print('Password: ${_passwordController.text}');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Form submitted successfully!')),
      );
    }
  }

  // Helper method to validate password
  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    if (!RegExp(r'\d').hasMatch(value)) {
      return 'Password must contain at least one number';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signup Form'),
      ),
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/janmanchbackdrop.jpg', // Replace with your image asset path
              fit: BoxFit.cover,
            ),
          ),
          // Foreground content
          Padding(
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
                        return 'Please enter your name';
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
                    controller: _panController,
                    decoration: const InputDecoration(labelText: 'PAN Number'),
                    maxLength: 10,
                    validator: (value) {
                      if (value == null || value.length != 10) {
                        return 'Please enter a valid PAN number';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _phoneController,
                    decoration: const InputDecoration(labelText: 'Phone Number'),
                    keyboardType: TextInputType.phone,
                    maxLength: 10,
                    validator: (value) {
                      if (value == null || value.length != 10) {
                        return 'Please enter a valid 10-digit phone number';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _passwordController, // Password field
                    decoration: const InputDecoration(labelText: 'Password'),
                    obscureText: true,
                    validator: _validatePassword, // Use the custom validator
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _submitForm,
                    child: const Text('Submit'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
