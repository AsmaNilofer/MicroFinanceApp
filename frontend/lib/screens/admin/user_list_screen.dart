import 'package:flutter/material.dart';
import '../../models/user.dart';
import '../../services/api_service.dart';
import 'add_user_screen.dart';
import 'edit_user_screen.dart';

class UserListScreen extends StatefulWidget {
  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'User List',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.purpleAccent,
        actions: [
          IconButton(
            icon: Icon(Icons.add, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddUserScreen()),
              ).then((value) => setState(() {})); // Refresh the list after adding a user
            },
          ),
        ],
      ),
      body: FutureBuilder<List<User>>(
        future: apiService.getAllUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(color: Colors.purpleAccent));
          } else if (snapshot.hasError) {
            return _buildErrorContent(snapshot.error);
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Text(
                'No users available',
                style: TextStyle(fontSize: 18),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                User user = snapshot.data![index];
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 4,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    title: Text(
                      user.name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(user.email),
                    trailing: Icon(Icons.arrow_forward_ios, color: Colors.purpleAccent),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditUserScreen(user: user,pageType: 'User',),
                        ),
                      ).then((value) => setState(() {})); // Refresh the list after editing a user
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }

  Widget _buildErrorContent(Object? error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error, color: Colors.red, size: 40),
          SizedBox(height: 8),
          Text(
            'Failed to load users',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 8),
          Text(
            '$error', // Display the actual error message
            style: TextStyle(color: Colors.red, fontSize: 14),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
