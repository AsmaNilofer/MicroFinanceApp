import 'package:flutter/material.dart';
import '../../models/loan.dart';
import '../../services/api_service.dart';
import '../../widgets/customer_navigation_drawer.dart';

class CustomerApplyLoanScreen extends StatefulWidget {
  final int customerId;

  const CustomerApplyLoanScreen({Key? key, required this.customerId}) : super(key: key);

  @override
  _CustomerApplyLoanScreenState createState() => _CustomerApplyLoanScreenState();
}

class _CustomerApplyLoanScreenState extends State<CustomerApplyLoanScreen> {
  final _formKey = GlobalKey<FormState>();
  final ApiService apiService = ApiService();

  late double loanAmount;
  late String loanTerm;
  late double interestRate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Apply for a Loan'),
        backgroundColor: Colors.purpleAccent,  // Accent color for app bar
      ),
      drawer: CustomerNavigationDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),  // Adding padding for proper spacing
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,  // Align labels to the left
              children: [
                // Loan Amount
                Text(
                  'Loan Amount',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),  // Add space between label and text field
                _buildTextFormField(
                  hintText: 'Enter loan amount',
                  keyboardType: TextInputType.number,
                  onSaved: (value) => loanAmount = double.parse(value!),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter loan amount';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),  // Space between form fields

                // Loan Term
                Text(
                  'Loan Term',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                _buildTextFormField(
                  hintText: 'e.g., Monthly',
                  onSaved: (value) => loanTerm = value!,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter loan term';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),

                // Interest Rate
                Text(
                  'Interest Rate',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                _buildTextFormField(
                  hintText: 'Enter interest rate',
                  keyboardType: TextInputType.number,
                  onSaved: (value) => interestRate = double.parse(value!),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter interest rate';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 30),

                // Submit Button
                Center(
                  child: ElevatedButton(
                    onPressed: _submitForm,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purpleAccent,  // Accent color for button
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    child: Text('Submit Loan Application'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Reusable form field builder for clean code
  Widget _buildTextFormField({
    required String hintText,
    TextInputType? keyboardType,
    required FormFieldSetter<String> onSaved,
    required FormFieldValidator<String> validator,
  }) {
    return TextFormField(
      keyboardType: keyboardType,
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
      onSaved: onSaved,
      validator: validator,
    );
  }

  // Submit the form and send the loan application
  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      Loan newLoan = Loan(
        customerId: widget.customerId,
        loanAmount: loanAmount,
        loanTerm: loanTerm,
        interestRate: interestRate,
      );

      try {
        Loan appliedLoan = await apiService.applyLoan(newLoan);
        _showSuccessMessage(appliedLoan.loanId!);
      } catch (e) {
        _showErrorMessage(e.toString());
      }
    }
  }

  void _showSuccessMessage(int loanId) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Loan Application Submitted Successfully! Loan ID: $loanId'),
      backgroundColor: Colors.green,
    ));
  }

  void _showErrorMessage(String error) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Error: $error'),
      backgroundColor: Colors.red,
    ));
  }
}
