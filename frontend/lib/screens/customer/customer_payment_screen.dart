import 'package:flutter/material.dart';
import '../../widgets/customer_navigation_drawer.dart';


class CustomerPaymentScreen extends StatelessWidget {
  // final String dueAmount;
  // final String nextPaymentDate;
  // final String paymentHistory;
  //
  // CustomerPaymentScreen({
  //   required this.dueAmount,
  //   required this.nextPaymentDate,
  //   required this.paymentHistory,
  // });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Payment Details',
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
            _buildDetailRow('Amount Due',"1100") ,//'\$' + dueAmount),
            _buildDetailRow('Next Payment Date',"02/10/2024"),// nextPaymentDate),
            SizedBox(height: 20),
            Text(
              'Payment History',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.purpleAccent,
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                 "paymentHistory",// na taan potruken "
                  style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle payment logic here
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Payment'),
                      content: Text('Payment of \$' + "dueAmount" + ' initiated.'),//na tan " due amount ku potruken
                      actions: <Widget>[
                        TextButton(
                          child: Text('OK'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purpleAccent,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                ),
                child: Text(
                  'Pay Now',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
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
