import 'package:flutter/material.dart';
import '../screens/customer/customer_dashboard_screen.dart';
import '../screens/customer/customer_apply_loan_screen.dart';
import '../screens/customer/customer_loan_details_screen.dart';
import '../screens/customer/customer_payment_screen.dart';
import '../screens/customer/customer_profile_screen.dart';
import '../screens/login-logout/login_screen.dart';


class CustomerNavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.purpleAccent,
              image: DecorationImage(
                image: AssetImage('assets/images/customer_background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                'Customer Module',
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
                  onTap: () => _navigateTo(context, CustomerDashboard()),
                ),
                _createDrawerItem(
                  icon: Icons.assignment,
                  text: 'Apply for Loan',
                  onTap: () => _navigateTo(context, CustomerApplyLoanScreen(customerId:20)),
                ),
                _createDrawerItem(
                  icon: Icons.details,
                  text: 'Loan Details',
                  onTap: () => _navigateTo(context, CustomerLoanDetailsScreen()),
                ),
                _createDrawerItem(
                  icon: Icons.payment,
                  text: 'Payments',
                  onTap: () => _navigateTo(context, CustomerPaymentScreen()),
                ),
                _createDrawerItem(
                  icon: Icons.person,
                  text: 'Profile',
                  onTap: () => _navigateTo(context, CustomerProfileScreen()),
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
