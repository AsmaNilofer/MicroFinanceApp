import 'package:flutter/material.dart';
import '../../widgets/navigation_drawer.dart' as custom_drawer; // Import the custom NavigationDrawer

class CollectionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Collections',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.purpleAccent,
      ),
      drawer: custom_drawer.NavigationDrawer(), // Use the renamed custom drawer
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildElevatedButton(
              context: context,
              label: 'Loan Collection Lists',
              onPressed: () {
                // Navigate to Loan Collection Lists Screen
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildElevatedButton({
    required BuildContext context,
    required String label,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.purpleAccent,
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 16.0),
        textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onPressed: onPressed,
      child: Text(label),
    );
  }
}
