import 'package:flutter/material.dart';
import '../../widgets/agent_navigation_drawer.dart';

class AssignedLoanScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Assigned Loan')),
      drawer: AgentNavigationDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Customer Information:', style: TextStyle(fontSize: 18)),
            // Add customer details here
            SizedBox(height: 20),
            Text('Loan Information:', style: TextStyle(fontSize: 18)),
            // Add loan details here
          ],
        ),
      ),
    );
  }
}
