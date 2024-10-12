import 'package:flutter/material.dart';

class BusinessLandingPage extends StatefulWidget {
  const BusinessLandingPage({super.key});

  @override
  _BusinessLandingPageState createState() => _BusinessLandingPageState();
}

class _BusinessLandingPageState extends State<BusinessLandingPage> {
  // Sample data for products
  List<String> products = ["Product 1", "Product 2", "Product 3", "Product 4", "Product 5", "Product 6"];
  
  // Sample data for user reviews
  List<Map<String, dynamic>> userReviews = [
    {
      'profilePic': 'https://via.placeholder.com/50', // Placeholder image
      'name': 'John Doe',
      'review': 'Great service and products!'
    },
    {
      'profilePic': 'https://via.placeholder.com/50', // Placeholder image
      'name': 'Jane Smith',
      'review': 'Really enjoyed my experience.'
    },
    {
      'profilePic': 'https://via.placeholder.com/50', // Placeholder image
      'name': 'Alice Johnson',
      'review': 'The best business I have dealt with so far.'
    },
    {
      'profilePic': 'https://via.placeholder.com/50', // Placeholder image
      'name': 'Bob Lee',
      'review': 'Exceptional customer service!'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Business Dashboard'),
        actions: [
          // Profile picture with popup menu
          PopupMenuButton<String>(
            icon: const CircleAvatar(
              backgroundImage: NetworkImage('https://via.placeholder.com/50'), // Replace with actual image URL
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
              // Your Products Section
              const Text(
                'Your Products',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // 3 items per row
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1.5, // Adjust aspect ratio for smaller icons
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4,
                    child: Center(
                      child: Text(
                        products[index],
                        style: const TextStyle(fontSize: 14), // Smaller text size
                      ),
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
