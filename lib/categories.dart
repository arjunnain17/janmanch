import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Marketplace',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
                _buildImageButton(context, 'services.png'),
                _buildImageButton(context, 'products.png'),
                _buildImageButton(context, 'groceries.png'),
              ],
            ),
            const SizedBox(height: 40),

            // Second row of images
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildImageButton(context, 'services2.png'),
                _buildImageButton(context, 'products2.png'),
                _buildImageButton(context, 'groceries2.png'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Function to create a clickable image button
  Widget _buildImageButton(BuildContext context, String imageName) {
    return GestureDetector(
      onTap: () {
        // Define the action when the button is tapped
        print('Button with $imageName clicked');
      },
      child: Container(
        width: 150, // Set width for large buttons
        height: 150, // Set height for large buttons
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/$imageName'),
            fit: BoxFit.cover, // Cover the container with the image
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
    );
  }
}
