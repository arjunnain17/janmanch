import 'package:flutter/material.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  bool _isCategoriesHovered = false;
  bool _isProfileHovered = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Marketplace', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold))),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Categories Dropdown Menu
            MouseRegion(
              onEnter: (_) {
                setState(() {
                  _isCategoriesHovered = true;
                });
              },
              onExit: (_) {
                setState(() {
                  _isCategoriesHovered = false;
                });
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ElevatedButton(
                    onPressed: () {}, // You can define actions here
                    child: const Text('Categories'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                      textStyle: const TextStyle(fontSize: 18),
                    ),
                  ),
                  if (_isCategoriesHovered)
                    Column(
                      children: [
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {}, // Navigate to Services page or perform action
                          child: const Text('Services'),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                          ),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {}, // Navigate to Products page or perform action
                          child: const Text('Products'),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                          ),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {}, // Navigate to Groceries page or perform action
                          child: const Text('Groceries'),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),

            // Profile Button
            MouseRegion(
              onEnter: (_) {
                setState(() {
                  _isProfileHovered = true;
                });
              },
              onExit: (_) {
                setState(() {
                  _isProfileHovered = false;
                });
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {}, // Profile action
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(20), // Circular button size
                    ),
                    child: const Text('P', style: TextStyle(fontSize: 18)), // Placeholder for profile icon
                  ),
                  if (_isProfileHovered)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {}, // Signout action
                          child: const Text('Signout'),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                          ),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {}, // Business action
                          child: const Text('Business'),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
