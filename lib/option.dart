import 'package:flutter/material.dart';

class OptionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Options'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Select an Option:',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
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
            const SizedBox(height: 10),
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
            const SizedBox(height: 10),
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
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        backgroundColor: Colors.blue, // Use backgroundColor instead of primary
        foregroundColor: Colors.white, // Use foregroundColor instead of onPrimary
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18),
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
        title: const Text('Categories'),
      ),
      body: const Center(
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
        title: const Text('Listing'),
      ),
      body: const Center(
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
        title: const Text('Marketplace'),
      ),
      body: const Center(
        child: Text('Marketplace Page', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
