import 'package:flutter/material.dart';
import '../../widgets/navigation_drawer.dart' as custom_drawer;
import 'add_user_screen.dart';
import 'user_list_screen.dart';

class UserManagementScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'User Management',
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
        child: Column(
          children: [
            _buildOptionTile(
              context,
              title: 'Add User',
              icon: Icons.person_add,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddUserScreen()),
                );
              },
            ),
            SizedBox(height: 16),
            _buildOptionTile(
              context,
              title: 'Users List',
              icon: Icons.list,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserListScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionTile(BuildContext context, {
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        leading: Icon(icon, color: Colors.purpleAccent, size: 30),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        trailing: Icon(Icons.arrow_forward_ios, color: Colors.purpleAccent),
        onTap: onTap,
      ),
    );
  }
}
