import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts; // Fix import for charts_flutter

class BusinessLandingPage extends StatefulWidget {
  const BusinessLandingPage({super.key});

  @override
  _BusinessLandingPageState createState() => _BusinessLandingPageState();
}

class _BusinessLandingPageState extends State<BusinessLandingPage> {
  // Sample data for products
  List<String> products = ["Product 1", "Product 2", "Product 3", "Product 4"];
  
  // Sample data for user reviews
  List<Map<String, dynamic>> userReviews = [
    {
      'profilePic': 'https://via.placeholder.com/50', // Use placeholder image for now
      'name': 'John Doe',
      'review': 'Great service and products!'
    },
    {
      'profilePic': 'https://via.placeholder.com/50', // Use placeholder image for now
      'name': 'Jane Smith',
      'review': 'Really enjoyed my experience.'
    },
  ];

  // Sample data for sales statistics
  List<charts.Series<SalesData, String>> _createSampleData() {
    final data = [
      SalesData('Jan', 100),
      SalesData('Feb', 120),
      SalesData('Mar', 90),
      SalesData('Apr', 150),
      SalesData('May', 80),
      SalesData('Jun', 170),
      SalesData('Jul', 140),
      SalesData('Aug', 130),
      SalesData('Sep', 110),
      SalesData('Oct', 160),
      SalesData('Nov', 200),
      SalesData('Dec', 180),
    ];

    return [
      charts.Series<SalesData, String>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (SalesData sales, _) => sales.month,
        measureFn: (SalesData sales, _) => sales.sales,
        data: data,
      )
    ];
  }

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
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 3 / 2,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4,
                    child: Center(
                      child: Text(
                        products[index],
                        style: const TextStyle(fontSize: 16),
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
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
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

              // Sales Statistics Section
              const Text(
                'Your Sale Statistics',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Container(
                height: 200,
                padding: const EdgeInsets.all(8.0),
                child: charts.BarChart(
                  _createSampleData(),
                  animate: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Data class for sales statistics
class SalesData {
  final String month;
  final int sales;

  SalesData(this.month, this.sales);
}
