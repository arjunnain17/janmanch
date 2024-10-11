import 'package:flutter/material.dart';
import 'dart:async';

void main() {
    runApp(MyApp());
}
// test
class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            home: LoadingScreen(),
        );
    }
}

class LoadingScreen extends StatefulWidget {
    @override
    _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen>
        with SingleTickerProviderStateMixin {
    AnimationController _controller;
    Animation<double> _animation;

    @override
    void initState() {
        super.initState();
        _controller = AnimationController(
            duration: const Duration(seconds: 3),
            vsync: this,
        )..repeat(reverse: true);
        _animation = CurvedAnimation(
            parent: _controller,
            curve: Curves.easeInOut,
        );

        Timer(Duration(seconds: 3), () {
            // Navigate to the next screen after 3 seconds
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => NextScreen()),
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
                child: ScaleTransition(
                    scale: _animation,
                    child: Image.asset('assets/Jan-manch-logo.png'),
                ),
            ),
        );
    }
}

class NextScreen extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Next Screen'),
            ),
            body: Center(
                child: Text('Welcome to the next screen!'),
            ),
        );
    }
}