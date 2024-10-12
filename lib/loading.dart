import 'package:flutter/material.dart';
import 'dart:async';
import 'main.dart'; // Import the main.dart file for navigation to MyHomePage

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 6),
      vsync: this,
    )..forward(); // Start the animation to fill in the logo

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    Timer(const Duration(seconds: 6), () {
      // Navigate to the main page (MyHomePage) after 6 seconds
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const MyHomePage()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return ClipRect(
              child: Align(
                alignment: Alignment.bottomCenter,
                heightFactor: _animation.value, // Controls how much of the logo is shown
                child: SizedBox(
                  width: 500, // Set width of the logo, doubled to 400
                  child: child,
                ),
              ),
            );
          },
          child: Image.asset(
            'assets/Jan-manch-logo.png', // Make sure the image path is correct
            fit: BoxFit.contain, // Ensure the logo is contained within its box
          ),
        ),
      ),
    );
  }
}
