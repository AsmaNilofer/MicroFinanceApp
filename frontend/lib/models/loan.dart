import 'user.dart';

class Loan {
  int? loanId;
  double? loanAmount;
  String? loanTerm;
  double? interestRate;
  String? appliedAt;
  String? updatedAt;
  String? loanStatus;
  User? customer; // This field will map to 'customerId' in the JSON
  int? customerId;

  Loan({
    this.loanId,
    this.loanAmount,
    this.loanTerm,
    this.interestRate,
    this.appliedAt,
    this.updatedAt,
    this.loanStatus,
    this.customer, // Mapped from 'customerId'
    this.customerId,
  });

  // Factory method to create a Loan object from JSON data
  factory Loan.fromJson(Map<String, dynamic> json) {
    return Loan(
      loanId: json['loanId'] as int?,
      loanAmount: (json['loanAmount'] as num?)?.toDouble(),
      loanTerm: json['loanTerm'] as String?,
      interestRate: (json['interestRate'] as num?)?.toDouble(),
      appliedAt: json['appliedAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      loanStatus: json['loanStatus'] as String?,
      customer: json['customerId'] != null ? User.fromJson(json['customerId']) : null, // Parse 'customerId' as 'User'
    );
  }

  // Method to serialize Loan object to JSON data
  Map<String, dynamic> toJson() {
    return {
      'loanId': loanId,
      'loanAmount': loanAmount,
      'loanTerm': loanTerm,
      'interestRate': interestRate,
      'appliedAt': appliedAt,
      'updatedAt': updatedAt,
      'loanStatus': loanStatus,
      'customerId': customerId,// Serialize 'customer' as 'customerId'
    };
  }
}
