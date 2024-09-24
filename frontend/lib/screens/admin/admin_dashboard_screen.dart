import 'package:flutter/material.dart';
import '../../widgets/navigation_drawer.dart' as custom_drawer;

class AdminDashboard extends StatelessWidget {
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
      drawer: custom_drawer.NavigationDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of columns
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
            childAspectRatio: 1.2, // Adjust the aspect ratio for card sizing
          ),
          itemCount: 5, // Total number of cards
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
                    // Navigate to Loans List Screen
                      break;
                    case 1:
                    // Navigate to Users List Screen
                      break;
                    case 2:
                    // Navigate to Total Amount Distributed Screen
                      break;
                    case 3:
                    // Navigate to Total Amount Collected Screen
                      break;
                    case 4:
                    // Navigate to Total Interest Collected Screen
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
        return 'Number of Loans';
      case 1:
        return 'Number of Users';
      case 2:
        return 'Total Amount Distributed';
      case 3:
        return 'Total Amount Collected';
      case 4:
        return 'Total Interest Collected';
      default:
        return '';
    }
  }

  String getSubtitle(int index) {
    switch (index) {
      case 0:
        return '10';
      case 1:
        return '15';
      case 2:
        return '15,000';
      case 3:
        return '10,000';
      case 4:
        return '5000';
      default:
        return '';
    }
  }
}
