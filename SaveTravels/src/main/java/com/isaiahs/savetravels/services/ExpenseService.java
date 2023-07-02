package com.isaiahs.savetravels.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;
import com.isaiahs.savetravels.models.Expense;
import com.isaiahs.savetravels.repositories.ExpenseRepo;

@Service
public class ExpenseService {
	// adding the book repository as a dependency
	private final ExpenseRepo expenseRepository;
	
	public ExpenseService(ExpenseRepo expenseRepository) {
		this.expenseRepository = expenseRepository;
	}
	// returns ALL Expenses
	public List<Expense> allExpenses(){
		return expenseRepository.findAll();
	}
	// creates an expense
	public Expense createExpense(Expense e) {
		return expenseRepository.save(e);
	}
	 // retrieves an expense
    public Expense findExpense(Long id) {
        Optional<Expense> optionalExpense = expenseRepository.findById(id); //findById method re
        if(optionalExpense.isPresent()) { //isPresent() method checks to see if our expense object exists
            return optionalExpense.get(); //if expense object exists, then it is returned by calling get() method. Otherwise, returns null.
        } else {
            return null;
        }
    }
    public Expense updateExpense(Expense e) {
    	return expenseRepository.save(e);
    }
    
    public void deleteById(Long id) {
    	this.expenseRepository.deleteById(id);
    }
}
