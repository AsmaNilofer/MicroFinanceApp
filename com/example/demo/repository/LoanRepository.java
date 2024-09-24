package com.example.demo.repository;

import com.example.demo.model.Loan;
import com.example.demo.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface LoanRepository extends JpaRepository<Loan, Long> {
    // Find all loans for a specific customer (User)
    List<Loan> findByCustomerId(User customerId);

    // Find all loans by loan status (Approved or Reject)
    List<Loan> findByLoanStatus(Loan.LoanStatus loanStatus);

    // Find all loans by loan term (Daily, Weekly, Monthly)
    List<Loan> findByLoanTerm(Loan.LoanTerm loanTerm);
}
