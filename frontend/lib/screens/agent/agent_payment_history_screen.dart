import 'package:flutter/material.dart';
import '../../widgets/agent_navigation_drawer.dart';
class AgentPaymentHistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Payment History')),
      drawer: AgentNavigationDrawer(),

      body: Center(child: Text('Payment History Screen')),
    );
  }
}
