import 'package:flutter/material.dart';
import '../../models/user.dart';
import '../../services/api_service.dart';

class EditUserScreen extends StatefulWidget {
  final User user;
  final String pageType; // To specify whether it's for User or Agent

  EditUserScreen({required this.user, required this.pageType});

  @override
  _EditUserScreenState createState() => _EditUserScreenState();
}

class _EditUserScreenState extends State<EditUserScreen> {
  final _formKey = GlobalKey<FormState>();
  late String name;
  late String password;
  late String email;
  late String phone;
  late String role;

  final ApiService apiService = ApiService();

  @override
  void initState() {
    super.initState();
    name = widget.user.name;
    password = widget.user.password;
    email = widget.user.email;
    phone = widget.user.phone;
    role = widget.user.role;
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      User updatedUser = User(
        id: widget.user.id,
        name: name,
        password: password,
        email: email,
        phone: phone,
        role: role,
      );
      apiService.updateUser(widget.user.id!, updatedUser).then((user) {
        Navigator.pop(context, user);
      }).catchError((error) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to update user')));
      });
    }
  }

  void _deleteUser() async {
    bool confirmed = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Deletion'),
          content: Text('Are you sure you want to delete this user?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );

    if (confirmed) {
      apiService.deleteUser(widget.user.id!).then((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('User deleted successfully')),
        );
        Navigator.pop(context); // Navigate back after deletion
      }).catchError((error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to delete user')),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit ${widget.pageType}',

          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.purpleAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildTextField(
                label: 'Name',
                initialValue: name,
                onChanged: (value) => name = value,
                validator: (value) =>
                value!.isEmpty ? 'Please enter a name' : null,
              ),
              SizedBox(height: 16),
              _buildTextField(
                label: 'Password',
                initialValue: password,
                obscureText: true,
                onChanged: (value) => password = value,
                validator: (value) =>
                value!.isEmpty ? 'Please enter a password' : null,
              ),
              SizedBox(height: 16),
              _buildTextField(
                label: 'Email',
                initialValue: email,
                onChanged: (value) => email = value,
                validator: (value) =>
                value!.isEmpty ? 'Please enter an email' : null,
              ),
              SizedBox(height: 16),
              _buildTextField(
                label: 'Phone',
                initialValue: phone,
                onChanged: (value) => phone = value,
                validator: (value) =>
                value!.isEmpty ? 'Please enter a phone number' : null,
              ),
              SizedBox(height: 20),

              // Update button
              ElevatedButton(
                onPressed: _submit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purpleAccent,
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  elevation: 2,
                ),
                child: Text(
                  'Update ${widget.pageType}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 16),

              // Delete button
              ElevatedButton(
                onPressed: _deleteUser,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purpleAccent,
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  elevation: 2,
                ),
                child: Text(
                  'Delete ${widget.pageType}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required String initialValue,
    bool obscureText = false,
    required Function(String) onChanged,
    required String? Function(String?) validator,
  }) {
    return TextFormField(
      initialValue: initialValue,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      ),
      onChanged: onChanged,
      validator: validator,
    );
  }
}
