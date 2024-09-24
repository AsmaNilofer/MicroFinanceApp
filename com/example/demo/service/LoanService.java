package com.example.demo.service;

import com.example.demo.model.Loan;
import com.example.demo.model.User;
import com.example.demo.repository.LoanRepository;
import com.example.demo.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.List;

@Service
public class LoanService {

    @Autowired
    private LoanRepository loanRepository;

    @Autowired
    private UserRepository userRepository;

    // Get all loans
    public List<Loan> getAllLoans() {
        try {
            return loanRepository.findAll();
        } catch (Exception e) {
            // Log the error
            System.out.println("Error fetching all loans: " + e.getMessage());
            return null; // Or handle appropriately
        }
    }

    // Get all loans for a specific customer (User)
    public List<Loan> getLoansByCustomer(Long customerId) {
        try {
            User customer = userRepository.findById(customerId).orElse(null);
            if (customer != null) {
                return loanRepository.findByCustomerId(customer);
            }
            return null; // If no customer found
        } catch (Exception e) {
            // Log the error
            System.out.println("Error fetching loans for customer: " + e.getMessage());
            return null; // Or handle appropriately
        }
    }

    // Get loans by status (Approved or Reject)
    public List<Loan> getLoansByStatus(Loan.LoanStatus loanStatus) {
        try {
            return loanRepository.findByLoanStatus(loanStatus);
        } catch (Exception e) {
            // Log the error
            System.out.println("Error fetching loans by status: " + e.getMessage());
            return null; // Or handle appropriately
        }
    }

    // Get a loan by its ID
    public Loan getLoanById(Long id) {
        try {
            return loanRepository.findById(id).orElse(null);
        } catch (Exception e) {
            // Log the error
            System.out.println("Error fetching loan by ID: " + e.getMessage());
            return null; // Or handle appropriately
        }
    }

    // Create a new loan
    public Loan createLoan(Loan loan) {
        try {
            loan.setAppliedAt(new Timestamp(System.currentTimeMillis()));
            loan.setUpdatedAt(new Timestamp(System.currentTimeMillis()));
            loan.setLoanStatus(Loan.LoanStatus.Inprogress);
            return loanRepository.save(loan);
        } catch (Exception e) {
            // Log the error
            System.out.println("Error creating loan: " + e.getMessage());
            return null; // Or handle appropriately
        }
    }

    // Update an existing loan
    public Loan updateLoan(Long id, Loan loanDetails) {
        try {
            Loan loan = getLoanById(id);
            if (loan != null) {
                loan.setLoanAmount(loanDetails.getLoanAmount());
                loan.setLoanTerm(loanDetails.getLoanTerm());
                loan.setInterestRate(loanDetails.getInterestRate());
                loan.setLoanStatus(loanDetails.getLoanStatus());
                loan.setUpdatedAt(new Timestamp(System.currentTimeMillis()));
                return loanRepository.save(loan);
            }
            return null; // If no loan found
        } catch (Exception e) {
            // Log the error
            System.out.println("Error updating loan: " + e.getMessage());
            return null; // Or handle appropriately
        }
    }

    // Delete a loan by its ID
    public void deleteLoan(Long id) {
        try {
            loanRepository.deleteById(id);
        } catch (Exception e) {
            // Log the error
            System.out.println("Error deleting loan: " + e.getMessage());
        }
    }
}
