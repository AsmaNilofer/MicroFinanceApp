import 'package:flutter/material.dart';
import 'screens/admin/admin_dashboard_screen.dart';
import 'screens/login-logout/login_screen.dart';
import 'screens/agent/agent_dashboard_screen.dart';
import 'screens/customer/customer_dashboard_screen.dart';

void main() {
  runApp(MicrofinanceApp());
}

class MicrofinanceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Microfinance',
      theme: ThemeData(primarySwatch: Colors.purple),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/admin': (context) => AdminDashboard(),
        '/agent': (context) => AgentDashboard(),
        '/customer': (context) => CustomerDashboard(),
        // Define more routes as necessary
      },
    );
  }
}
