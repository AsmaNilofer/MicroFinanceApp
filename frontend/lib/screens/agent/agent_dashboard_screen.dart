import 'package:flutter/material.dart';
import '../../widgets/agent_navigation_drawer.dart';

class AgentDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Agent Dashboard',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.purpleAccent,
      ),
      drawer: AgentNavigationDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of columns
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
            childAspectRatio: 1.2, // Adjust the aspect ratio for card sizing
          ),
          itemCount: 3, // Total number of cards
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
                    // Navigate to Assigned Loans Screen
                      break;
                    case 1:
                    // Navigate to Completed Loans Screen
                      break;
                    case 2:
                    // Navigate to Pending Loans Screen
                      break;
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      SizedBox(height: 20),
                      Text(
                        getTitle(index),
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.purpleAccent,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10),
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

  // Helper methods to get the title, subtitle, and icon based on the index
  String getTitle(int index) {
    switch (index) {
      case 0:
        return 'Assigned Loans';
      case 1:
        return 'Completed Loans';
      case 2:
        return 'Pending Loans';
      default:
        return '';
    }
  }

  String getSubtitle(int index) {
    switch (index) {
      case 0:
        return '10'; // Placeholder value
      case 1:
        return '8'; // Placeholder value
      case 2:
        return '5'; // Placeholder value
      default:
        return '';
    }
  }
}

