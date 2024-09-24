import 'package:flutter/material.dart';
import '../../widgets/agent_navigation_drawer.dart';

class AgentReportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Report')),
      drawer: AgentNavigationDrawer(),
      body: Center(child: Text('Report Screen')),
    );
  }
}
