import 'package:flutter/material.dart';
import '../../models/user.dart'; // Assuming you have a User model

class ProfileScreen extends StatefulWidget {
  final User user;

  const ProfileScreen({Key? key, required this.user}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  late String name;
  late String email;
  late String phone;
  late String password;
  late String dob;
  late String address;
  late String employmentStatus;
  late double monthlyIncome;

  @override
  void initState() {
    super.initState();
    // Pre-fill existing values for Name, Email, Phone, and Password
    name = widget.user.name;
    email = widget.user.email;
    phone = widget.user.phone;
    password = widget.user.password;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.purpleAccent, // Accent color
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Name (Pre-filled)
                _buildTextFormField(
                  label: 'Name',
                  initialValue: name,
                  readOnly: true, onChanged: (String ) {  }, // Name is read-only
                ),
                SizedBox(height: 20),

                // Email (Pre-filled)
                _buildTextFormField(
                  label: 'Email',
                  initialValue: email,
                  readOnly: true, onChanged: (String ) {  }, // Email is read-only
                ),
                SizedBox(height: 20),

                // Phone (Pre-filled)
                _buildTextFormField(
                  label: 'Phone',
                  initialValue: phone,
                  readOnly: true, onChanged: (String ) {  }, // Phone is read-only
                ),
                SizedBox(height: 20),

                // Password (Pre-filled, but can be edited)
                _buildTextFormField(
                  label: 'Password',
                  initialValue: password,
                  obscureText: true, // To hide password input
                  onChanged: (value) => password = value,
                ),
                SizedBox(height: 20),

                // Date of Birth (New Field)
                _buildTextFormField(
                  label: 'Date of Birth',
                  hintText: 'Enter your date of birth',
                  onChanged: (value) => dob = value,
                ),
                SizedBox(height: 20),

                // Address (New Field)
                _buildTextFormField(
                  label: 'Address',
                  hintText: 'Enter your address',
                  onChanged: (value) => address = value,
                ),
                SizedBox(height: 20),

                // Employment Status (New Field)
                _buildTextFormField(
                  label: 'Employment Status',
                  hintText: 'Enter your employment status',
                  onChanged: (value) => employmentStatus = value,
                ),
                SizedBox(height: 20),

                // Monthly Income (New Field)
                _buildTextFormField(
                  label: 'Monthly Income',
                  hintText: 'Enter your monthly income',
                  keyboardType: TextInputType.number,
                  onChanged: (value) => monthlyIncome = double.parse(value),
                ),
                SizedBox(height: 30),

                // Save Button
                Center(
                  child: ElevatedButton(
                    onPressed: _submitForm,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purpleAccent,
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    child: Text('Save Profile'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField({
    required String label,
    String? initialValue,
    String? hintText,
    bool readOnly = false,
    bool obscureText = false,
    TextInputType? keyboardType,
    required Function(String) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        TextFormField(
          initialValue: initialValue,
          decoration: InputDecoration(
            hintText: hintText,
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.purpleAccent),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.purpleAccent, width: 2),
            ),
          ),
          keyboardType: keyboardType,
          obscureText: obscureText,
          readOnly: readOnly,
          onChanged: onChanged,
        ),
      ],
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Here, you'd typically save the updated profile information to the backend
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Profile updated successfully!'),
        backgroundColor: Colors.green,
      ));
    }
  }
}
