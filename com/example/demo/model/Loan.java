package com.example.demo.model;

import jakarta.persistence.*;
import java.sql.Timestamp;

@Entity
@Table(name = "loan")
public class Loan {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long loanId;

    @ManyToOne
    @JoinColumn(name = "customer_id", referencedColumnName = "userId", nullable = false)
    private User customerId;  // Foreign key referencing User entity
    

    @Column(nullable = false, precision = 10)
    private double loanAmount;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private LoanTerm loanTerm;

    @Column(nullable = false, precision = 5)
    private double interestRate;

    @Column(nullable = false)
    private Timestamp appliedAt;

    @Column(nullable = false)
    private Timestamp updatedAt;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private LoanStatus loanStatus;

    // Default constructor
    public Loan() {
        // Set default timestamps
        this.appliedAt = new Timestamp(System.currentTimeMillis());
        this.updatedAt = new Timestamp(System.currentTimeMillis());
    }

    // Enum for Loan Term (Daily, Weekly, Monthly)
    public enum LoanTerm {
        Daily, Weekly, Monthly
    }

    // Enum for Loan Status (Reject, Approved)
    public enum LoanStatus {
        Reject, Approved ,Inprogress
    }

    // Getters and Setters
    public Long getLoanId() {
        return loanId;
    }

    public void setLoanId(Long loanId) {
        this.loanId = loanId;
    }

    public User getCustomerId() {
        return customerId;
    }

    public void setCustomerId(User customerId) {
        this.customerId = customerId;
    }

    public double getLoanAmount() {
        return loanAmount;
    }

    public void setLoanAmount(double loanAmount) {
        this.loanAmount = loanAmount;
    }

    public LoanTerm getLoanTerm() {
        return loanTerm;
    }

    public void setLoanTerm(LoanTerm loanTerm) {
        this.loanTerm = loanTerm;
    }

    public double getInterestRate() {
        return interestRate;
    }

    public void setInterestRate(double interestRate) {
        this.interestRate = interestRate;
    }

    public Timestamp getAppliedAt() {
        return appliedAt;
    }

    public void setAppliedAt(Timestamp appliedAt) {
        this.appliedAt = appliedAt;
    }

    public Timestamp getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Timestamp updatedAt) {
        this.updatedAt = updatedAt;
    }

    public LoanStatus getLoanStatus() {
        return loanStatus;
    }

    public void setLoanStatus(LoanStatus loanStatus) {
        this.loanStatus = loanStatus;
    }
}
