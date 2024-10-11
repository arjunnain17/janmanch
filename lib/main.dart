import 'package:flutter/material.dart';
import 'login.dart'; // Import the login.dart file
import 'log.dart';   // Import the log.dart file

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Janmanch',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 22, 218, 179)),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between the top and bottom
        children: <Widget>[
          // Welcome Message at the top
          const SizedBox(height: 80), // Add space at the top to move the welcome message down
          Center(
            child: MouseRegion(
              onEnter: (_) {
                setState(() {
                  _isHovered = true;
                });
              },
              onExit: (_) {
                setState(() {
                  _isHovered = false;
                });
              },
              child: AnimatedDefaultTextStyle(
                style: _isHovered
                    ? const TextStyle(
                        fontSize: 36,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      )
                    : const TextStyle(
                        fontSize: 28,
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                      ),
                duration: const Duration(milliseconds: 300),
                child: const Text('Welcome to Janmanch'),
              ),
            ),
          ),
          // Buttons at the bottom center
          Column(
            mainAxisAlignment: MainAxisAlignment.end, // Align buttons at the bottom
            children: [
              const SizedBox(height: 40), // Space before the buttons
              // Login Button
              MouseRegion(
                onEnter: (_) {
                  setState(() {
                    _isHovered = true;
                  });
                },
                onExit: (_) {
                  setState(() {
                    _isHovered = false;
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  transform: Matrix4.translationValues(0, _isHovered ? -5 : 0, 0), // Bouncy effect
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to the log.dart page
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LogPage()), // Assuming LogPage is in log.dart
                      );
                    },
                    child: const Text('Login'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40), // Increase button size
                      textStyle: const TextStyle(fontSize: 18), // Increase font size
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20), // Space between buttons
              // Signup Button
              MouseRegion(
                onEnter: (_) {
                  setState(() {
                    _isHovered = true;
                  });
                },
                onExit: (_) {
                  setState(() {
                    _isHovered = false;
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  transform: Matrix4.translationValues(0, _isHovered ? -5 : 0, 0), // Bouncy effect
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to the LoginPage (used as Signup for now)
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginPage()),
                      );
                    },
                    child: const Text('Signup'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40), // Increase button size
                      textStyle: const TextStyle(fontSize: 18), // Increase font size
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40), // Space at the bottom of the page
            ],
          ),
        ],
      ),
    );
  }
}
