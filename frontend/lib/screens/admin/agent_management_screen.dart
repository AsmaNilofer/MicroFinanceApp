import 'package:flutter/material.dart';
import '../../widgets/navigation_drawer.dart' as custom_drawer;
import 'add_agent_screen.dart';
import 'agent_list_screen.dart';

class AgentManagementScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Agent Management',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.purpleAccent,
      ),
      drawer: custom_drawer.NavigationDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildElevatedButton(
              context: context,
              label: 'Add Agent',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddAgentScreen()),
                );
                // Navigate to Add Agent Screen
              },
            ),
            SizedBox(height: 20),
            _buildElevatedButton(
              context: context,
              label: 'View Agent',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AgentListScreen()),
                );// Navigate to Delete Agent Screen
              },
            ),
            SizedBox(height: 20),
            _buildElevatedButton(
              context: context,
              label: 'Assign Agent to Customers',
              onPressed: () {
                // Navigate to Assign Agent to Customers Screen
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
