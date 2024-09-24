package com.example.demo.controller;

import com.example.demo.model.Loan;
import com.example.demo.service.LoanService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/loans")
public class LoanController {

    @Autowired
    private LoanService loanService;

    // Get all loans
    @GetMapping("/view/all")
    public List<Loan> getAllLoans() {
        return loanService.getAllLoans();
    }

    // Get all loans by customer (User)
    @GetMapping("/view/customer/{customerId}")
    public List<Loan> getLoansByCustomer(@PathVariable Long customerId) {
        return loanService.getLoansByCustomer(customerId);
    }

    // Get loans by status (Approved, Reject)
    @GetMapping("/view/status/{status}")
    public List<Loan> getLoansByStatus(@PathVariable Loan.LoanStatus status) {
        return loanService.getLoansByStatus(status);
    }

    // Get loan by loan ID
    @GetMapping("/view/{id}")
    public Loan getLoanById(@PathVariable Long id) {
        return loanService.getLoanById(id);
    }

    // Add a new loan
    @PostMapping("/add")
    public Loan createLoan(@RequestBody Loan loan) {
        return loanService.createLoan(loan);
    }

    // Update loan information
    @PutMapping("/update/{id}")
    public Loan updateLoan(@PathVariable Long id, @RequestBody Loan loanDetails) {
        return loanService.updateLoan(id, loanDetails);
    }

    // Delete loan by loan ID
    @DeleteMapping("/delete/{id}")
    public ResponseEntity<Void> deleteLoan(@PathVariable Long id) {
        try {
            loanService.deleteLoan(id);
            return ResponseEntity.ok().build(); // Return 200 OK if successful
        } catch (Exception e) {
            return ResponseEntity.status(500).build(); // Return 500 if an error occurs
        }
    }
}
