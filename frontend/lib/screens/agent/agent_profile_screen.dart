import 'package:flutter/material.dart';
import '../../widgets/agent_navigation_drawer.dart';

class AgentProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      drawer: AgentNavigationDrawer(),
      body: Center(child: Text('Profile Screen')),
    );
  }
}
