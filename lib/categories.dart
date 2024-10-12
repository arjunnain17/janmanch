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
        title: const Center(
          child: Text(
            'Marketplace',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Row for Categories and Profile buttons
              Row(
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
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 40),
                            textStyle: const TextStyle(fontSize: 18),
                          ),
                        ),
                        if (_isCategoriesHovered)
                          Column(
                            children: [
                              const SizedBox(height: 10),
                              ElevatedButton(
                                onPressed: () {}, // Navigate to Services page
                                child: const Text('Services'),
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 40),
                                ),
                              ),
                              const SizedBox(height: 10),
                              ElevatedButton(
                                onPressed: () {}, // Navigate to Products page
                                child: const Text('Products'),
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 40),
                                ),
                              ),
                              const SizedBox(height: 10),
                              ElevatedButton(
                                onPressed: () {}, // Navigate to Groceries page
                                child: const Text('Groceries'),
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 40),
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
                          child: const Text(
                            'P',
                            style: TextStyle(fontSize: 18),
                          ), // Placeholder for profile icon
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
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 40),
                                ),
                              ),
                              const SizedBox(height: 10),
                              ElevatedButton(
                                onPressed: () {}, // Business action
                                child: const Text('Business'),
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 40),
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 40),

              // Subheading for Trending Outlets
              const Center(
                child: Text(
                  'Trending Outlets',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),

              const SizedBox(height: 20),

              // First row of images (groceries.png, services.png, products.png)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildImageCard('assets/groceries.png'),
                  _buildImageCard('assets/services.png'),
                  _buildImageCard('assets/products.png'),
                ],
              ),

              const SizedBox(height: 20),

              // Second row of images (groceries2.png, services2.png, products2.png)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildImageCard('assets/groceries2.png'),
                  _buildImageCard('assets/services2.png'),
                  _buildImageCard('assets/products2.png'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper function to create image cards with elevation and click action
  Widget _buildImageCard(String imagePath) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          // You can add hover effects here if needed
        });
      },
      onExit: (_) {
        setState(() {
          // You can remove hover effects here if needed
        });
      },
      child: GestureDetector(
        onTap: () {
          // Define the action when the image is clicked
          print('$imagePath clicked');
        },
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
