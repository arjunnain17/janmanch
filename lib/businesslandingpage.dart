import 'package:flutter/material.dart';

class BusinessLandingPage extends StatefulWidget {
  const BusinessLandingPage({super.key});

  @override
  _BusinessLandingPageState createState() => _BusinessLandingPageState();
}

class _BusinessLandingPageState extends State<BusinessLandingPage> {
  // Sample data for user reviews
  List<Map<String, dynamic>> userReviews = [
    {
      'profilePic': 'assets/Jan-manch-logo.png', // Replace with actual image URL
      'name': 'John Doe',
      'review': 'Great service and products!'
    },
    {
      'profilePic': 'assets/Jan-manch-logo.png', // Replace with actual image URL
      'name': 'Jane Smith',
      'review': 'Really enjoyed my experience.'
    },
    {
      'profilePic': 'assets/Jan-manch-logo.png', // Replace with actual image URL
      'name': 'Alice Johnson',
      'review': 'The best business I have dealt with so far.'
    },
    {
      'profilePic': 'assets/Jan-manch-logo.png', // Replace with actual image URL
      'name': 'Bob Lee',
      'review': 'Exceptional customer service!'
    },
  ];

  // Sample data for product images
  List<String> productImages = [
    'assets/products.png', // Image for Product 1
    'assets/products2.png', // Image for Product 2
    'assets/services.png', // Image for Product 3
    'assets/services2.png', // Image for Product 4
    'assets/groceries.png', // Image for Product 5
    'assets/groceries2.png', // Image for Product 6
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Business Dashboard'),
        actions: [
          // Profile picture with popup menu
          PopupMenuButton<String>(
            icon: CircleAvatar(
              backgroundImage: NetworkImage('assets/Jan-manch-logo.png'), // Replace with actual image URL
            ),
            onSelected: (value) {
              if (value == 'Business Management') {
                // Handle Business Management navigation
                print("Business Management selected");
              } else if (value == 'Sign Out') {
                // Handle Sign Out
                print("Sign Out selected");
              }
            },
            itemBuilder: (BuildContext context) {
              return {'Business Management', 'Sign Out'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Your Images Section
              const Text(
                'Your Products',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // 3 images per row
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1, // Adjust aspect ratio for square images
                ),
                itemCount: productImages.length, // Use the length of productImages
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Display individual images
                        Image.network(
                          productImages[index], // Use the corresponding image URL
                          width: 150, // Adjust the width as necessary
                          height: 150, // Adjust the height as necessary
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          '', // You can customize the text for each product if needed
                          style: TextStyle(fontSize: 14), // Smaller text size
                        ),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),

              // User Ratings Section
              const Text(
                'User Ratings',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 reviews per row
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 3, // Make cards more horizontal
                ),
                itemCount: userReviews.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4,
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage:
                            NetworkImage(userReviews[index]['profilePic']),
                      ),
                      title: Text(userReviews[index]['name']),
                      subtitle: Text(userReviews[index]['review']),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
