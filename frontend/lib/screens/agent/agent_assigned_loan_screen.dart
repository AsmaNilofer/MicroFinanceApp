import 'package:flutter/material.dart';
import '../../widgets/agent_navigation_drawer.dart';

class AgentAssignedLoanScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Loan details')),
      drawer: AgentNavigationDrawer(),
      body: Center(child: Text('Assigned Loans Screen')),
    );
  }
}
