import 'package:flutter/material.dart';

class OptionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Options'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Select an Option:',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            MenuButton(
              title: 'Categories',
              onPressed: () {
                // Navigate to CategoriesScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CategoriesScreen()),
                );
              },
            ),
            SizedBox(height: 10),
            MenuButton(
              title: 'Listing',
              onPressed: () {
                // Navigate to ListingScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListingScreen()),
                );
              },
            ),
            SizedBox(height: 10),
            MenuButton(
              title: 'Marketplace',
              onPressed: () {
                // Navigate to MarketplaceScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MarketplaceScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const MenuButton({required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        primary: Colors.blue, // Set button color
        onPrimary: Colors.white, // Set text color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Text(
        title,
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}

// Sample CategoriesScreen
class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: Center(
        child: Text('Categories Page', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}

// Sample ListingScreen
class ListingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listing'),
      ),
      body: Center(
        child: Text('Listing Page', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}

// Sample MarketplaceScreen
class MarketplaceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Marketplace'),
      ),
      body: Center(
        child: Text('Marketplace Page', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
