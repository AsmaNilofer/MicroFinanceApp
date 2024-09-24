import 'package:flutter/material.dart';
import '../screens/agent/agent_dashboard_screen.dart';
import '../screens/agent/agent_assigned_loan_screen.dart';
import '../screens/agent/agent_payment_history_screen.dart';
import '../screens/agent/agent_profile_screen.dart';
import '../screens/agent/agent_report_screen.dart';
import '../screens/login-logout/login_screen.dart';

class AgentNavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.purpleAccent,
              image: DecorationImage(
                image: AssetImage('assets/images/agent_background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                'Agent Module',
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
                  onTap: () => _navigateTo(context, AgentDashboard()),
                ),
                _createDrawerItem(
                  icon: Icons.assignment,
                  text: 'Assigned Loans',
                  onTap: () => _navigateTo(context, AgentAssignedLoanScreen()),
                ),
                _createDrawerItem(
                  icon: Icons.history,
                  text: 'Payment History',
                  onTap: () => _navigateTo(context, AgentPaymentHistoryScreen()),
                ),
                _createDrawerItem(
                  icon: Icons.person,
                  text: 'Profile',
                  onTap: () => _navigateTo(context, AgentProfileScreen()),
                ),
                _createDrawerItem(
                  icon: Icons.report,
                  text: 'Reports',
                  onTap: () => _navigateTo(context, AgentReportScreen()),
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
