import 'package:flutter/material.dart';
import '../screens/admin/admin_dashboard_screen.dart';
import '../screens/admin/user_management_screen.dart';
import '../screens/admin/loan_management_screen.dart';
import '../screens/admin/agent_management_screen.dart';
import '../screens/admin/collection_screen.dart';
import '../screens/admin/report_screen.dart';
import '../screens/login-logout/login_screen.dart';



class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.purpleAccent,
              image: DecorationImage(
                image: AssetImage('assets/images/admin_background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                'Admin Module',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      offset: Offset(2, 2),
                      blurRadius: 4,
                      color: Colors.black54,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                _createDrawerItem(
                  icon: Icons.dashboard,
                  text: 'Dashboard',
                  onTap: () => _navigateTo(context, AdminDashboard()),
                ),
                _createDrawerItem(
                  icon: Icons.person,
                  text: 'User Management',
                  onTap: () => _navigateTo(context, UserManagementScreen()),
                ),
                _createDrawerItem(
                  icon: Icons.money,
                  text: 'Loan Management',
                  onTap: () => _navigateTo(context, LoanManagementScreen()),
                ),
                _createDrawerItem(
                  icon: Icons.group,
                  text: 'Agent Management',
                  onTap: () => _navigateTo(context, AgentManagementScreen()),
                ),
                _createDrawerItem(
                  icon: Icons.collections,
                  text: 'Collections',
                  onTap: () => _navigateTo(context, CollectionsScreen()),
                ),
                _createDrawerItem(
                  icon: Icons.report,
                  text: 'Report',
                  onTap: () => _navigateTo(context, ReportScreen()),
                ),
              ],
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout, color: Colors.redAccent),
            title: Text(
              'Logout',
              style: TextStyle(color: Colors.redAccent),
            ),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
                    (Route<dynamic> route) => false, // Remove all routes until the login screen
              );
           },
          ),
        ],
      ),
    );
  }

  Widget _createDrawerItem({
    required IconData icon,
    required String text,
    required GestureTapCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.purpleAccent),
      title: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
      onTap: onTap,
    );
  }

  void _navigateTo(BuildContext context, Widget destination) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => destination),
    );
  }
}
