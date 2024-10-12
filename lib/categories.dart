import 'package:flutter/material.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  // List of hover states for the 6 images
  List<bool> _isHoveredList = List.filled(6, false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Marketplace', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold))),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              'Trending Outlets',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            
            // First row of images
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildImageButton('services.png', 0),
                _buildImageButton('products.png', 1),
                _buildImageButton('groceries.png', 2),
              ],
            ),
            const SizedBox(height: 40),
            
            // Second row of images
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildImageButton('services2.png', 3),
                _buildImageButton('products2.png', 4),
                _buildImageButton('groceries2.png', 5),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Function to build each clickable image button with hover effect
  Widget _buildImageButton(String imageName, int index) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _isHoveredList[index] = true;
        });
      },
      onExit: (_) {
        setState(() {
          _isHoveredList[index] = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        transform: _isHoveredList[index]
            ? Matrix4.identity()..scale(1.1) // Scale up on hover
            : Matrix4.identity()..scale(1.0), // Default scale
        child: GestureDetector(
          onTap: () {
            // Handle the tap event (navigate or perform some action)
          },
          child: Container(
            width: 150, // Width for large buttons
            height: 150, // Height for large buttons
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/$imageName'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(15), // Rounded corners
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // Shadow position
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
