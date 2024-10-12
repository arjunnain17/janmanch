import 'package:flutter/material.dart';
import 'dart:async';
import 'main.dart'; // Import main.dart to navigate to MyHomePage

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

    // Animation controller for 3 seconds
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    _controller.forward(); // Start the animation

    // Timer to navigate to the main page after 3 seconds
    Timer(const Duration(seconds: 3), () {
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
        child: Stack(
          alignment: Alignment.center,
          children: [
            // The outline of the logo (always visible)
            Opacity(
              opacity: 0.3, // Make the outline a bit faded
              child: Image.asset(
                'assets/Jan-manch-logo-outline.png', // Outline image of the logo
                width: 200,
                height: 200,
              ),
            ),
            // Filling the logo from bottom to top
            ClipPath(
              clipper: LogoFillClipper(_animation.value),
              child: Image.asset(
                'assets/Jan-manch-logo.png', // Filled image of the logo
                width: 200,
                height: 200,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Custom clipper to fill the logo from bottom to top
class LogoFillClipper extends CustomClipper<Path> {
  final double fillPercent;

  LogoFillClipper(this.fillPercent);

  @override
  Path getClip(Size size) {
    final path = Path();

    // Define the clipping rectangle from the bottom to the fill percent height
    path.addRect(Rect.fromLTRB(
      0,
      size.height * (1 - fillPercent), // Starts from the bottom and goes upwards
      size.width,
      size.height,
    ));

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true; // Reclip whenever the animation changes
  }
}
