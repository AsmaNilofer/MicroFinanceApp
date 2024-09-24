import 'package:flutter/material.dart';
import '../../widgets/customer_navigation_drawer.dart'; // Use the customer-specific navigation drawer

class CustomerDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dashboard',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.purpleAccent,
      ),
      drawer: CustomerNavigationDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of columns
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
            childAspectRatio: 1.2, // Adjust the aspect ratio for card sizing
          ),
          itemCount: 4, // Total number of cards
          itemBuilder: (context, index) {
            return Card(
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12), // Rounded corners
              ),
              color: Colors.white,
              child: InkWell(
                onTap: () {
                  // Handle card taps based on index
                  switch (index) {
                    case 0:
                    // Navigate to Loan Status Screen
                      break;
                    case 1:
                    // Navigate to Next Payment Date Screen
                      break;
                    case 2:
                    // Navigate to Balance Screen
                      break;
                    case 3:
                    // Navigate to Apply Loan Screen
                      break;
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        getTitle(index),
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.purpleAccent,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                      Text(
                        getSubtitle(index),
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[700],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // Helper methods to get the title and subtitle based on the index
  String getTitle(int index) {
    switch (index) {
      case 0:
        return 'Loan Status';
      case 1:
        return 'Next Payment Date';
      case 2:
        return 'Balance';
      case 3:
        return 'Apply for Loan';
      default:
        return '';
    }
  }

  String getSubtitle(int index) {
    switch (index) {
      case 0:
        return 'Active';
      case 1:
        return '12th Sep, 2024';
      case 2:
        return '500';
      case 3:
        return 'Click to apply';
      default:
        return '';
    }
  }
}
