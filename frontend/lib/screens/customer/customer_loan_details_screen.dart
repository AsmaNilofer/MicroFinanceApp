import 'package:flutter/material.dart';
import '../../widgets/customer_navigation_drawer.dart';


class CustomerLoanDetailsScreen extends StatelessWidget {
  // final String loanId;
  // final String loanAmount;
  // final String loanTerm;
  // final String interestRate;
  // final String nextPaymentDate;
  // final String balanceRemaining;

  // CustomerLoanDetailsScreen({
  //   required this.loanId,
  //   required this.loanAmount,
  //   required this.loanTerm,
  //   required this.interestRate,
  //   required this.nextPaymentDate,
  //   required this.balanceRemaining,
  // });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Loan Details',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.purpleAccent,
      ),
      drawer: CustomerNavigationDrawer(),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDetailRow('Loan ID' , "2"), // loanId),
            _buildDetailRow('Loan Amount', "10000"),//'\$' + loanAmount),
            _buildDetailRow('Loan Term', "MONTHLY"), //loanTerm + ' months'),
            _buildDetailRow('Interest Rate', "11%"),// interestRate + '%'),
            _buildDetailRow('Next Payment Date', "02/10/2024" ),// nextPaymentDate),
            _buildDetailRow('Balance Remaining', "8800"),// '\$' + balanceRemaining)


          ],
        ),
      ),
    );
  }

  // Helper method to create each row of details
  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 18, color: Colors.grey[700]),
          ),
        ],
      ),
    );
  }
}
