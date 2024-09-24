import 'package:flutter/material.dart';
import '../../models/loan.dart';
import '../../services/api_service.dart';
import '../../widgets/navigation_drawer.dart' as custom_drawer;


class LoanListScreen extends StatefulWidget {
  final String loanStatus;  // Accept loan status as a parameter

  const LoanListScreen({Key? key, required this.loanStatus}) : super(key: key);

  @override
  _LoanListScreenState createState() => _LoanListScreenState();
}

class _LoanListScreenState extends State<LoanListScreen> {
  ApiService apiService = ApiService();
  late Future<List<Loan>> _loanList;

  @override
  void initState() {
    super.initState();
    _loanList = _getLoanListBasedOnStatus();
  }

  Future<List<Loan>> _getLoanListBasedOnStatus() {
    if (widget.loanStatus == 'Approved') {
      return apiService.getLoansByStatus('Approved');  // Fetch approved loans
    }else if (widget.loanStatus == 'Rejected') {
      return apiService.getLoansByStatus('Rejected');  // Fetch rejected loans
    } else if (widget.loanStatus == 'Inprogress') {
      return apiService.getLoansByStatus('Inprogress');
    }
    else
    {
      return apiService.getAllLoans();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.loanStatus} Loans'),
      ),
      drawer: custom_drawer.NavigationDrawer(),
      body: FutureBuilder<List<Loan>>(
        future: _loanList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No loans found'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final loan = snapshot.data![index];
                return ListTile(
                  title: Text('Loan ID: ${loan.loanId}, Amount: ${loan.loanAmount}'),
                  subtitle: Text('Status: ${loan.loanStatus}, Term: ${loan.loanTerm}'),
                );
              },
            );
          }
        },
      ),
    );
  }
}
