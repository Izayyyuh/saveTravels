package com.isaiahs.savetravels.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.isaiahs.savetravels.models.Expense;

@Repository
public interface ExpenseRepo extends CrudRepository<Expense, Long> {
	List<Expense> findAll();
	
	List<Expense> findByVendorContaining(String search);
	
	Long countByDescriptionContaining(String search);
	
	Long deleteByExpenseStartingWith(String search);

}
