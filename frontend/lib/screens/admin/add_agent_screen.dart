import 'package:flutter/material.dart';
import '../../models/user.dart';
import '../../services/api_service.dart';

class AddAgentScreen extends StatefulWidget {
  @override
  _AddAgentScreenState createState() => _AddAgentScreenState();
}

class _AddAgentScreenState extends State<AddAgentScreen> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String password = '';
  String email = '';
  String phone = '';
  String role = 'Agent';

  final ApiService apiService = ApiService();

  void _submit() {
    if (_formKey.currentState!.validate()) {
      User newUser = User(
        name: name,
        password: password,
        email: email,
        phone: phone,
        role: role,
      );
      apiService.addUser(newUser).then((user) {
        Navigator.pop(context, user);
      }).catchError((error) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to add user')));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Agent'),
        backgroundColor: Colors.purpleAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _buildTextFormField(
                label: 'Name',
                onChanged: (value) => setState(() {
                  name = value;
                }),
                validator: (value) =>
                value!.isEmpty ? 'Please enter a name' : null,
              ),
              SizedBox(height: 16),
              _buildTextFormField(
                label: 'Password',
                obscureText: true,
                onChanged: (value) => setState(() {
                  password = value;
                }),
                validator: (value) =>
                value!.isEmpty ? 'Please enter a password' : null,
              ),
              SizedBox(height: 16),
              _buildTextFormField(
                label: 'Email',
                onChanged: (value) => setState(() {
                  email = value;
                }),
                validator: (value) =>
                value!.isEmpty ? 'Please enter an email' : null,
              ),
              SizedBox(height: 16),
              _buildTextFormField(
                label: 'Phone',
                onChanged: (value) => setState(() {
                  phone = value;
                }),
                validator: (value) =>
                value!.isEmpty ? 'Please enter a phone number' : null,
              ),

              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purpleAccent,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text('Add Agent'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField({
    required String label,
    bool obscureText = false,
    required ValueChanged<String> onChanged,
    required String? Function(String?)? validator,
  }) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
      obscureText: obscureText,
      onChanged: onChanged,
      validator: validator,
    );
  }
}
