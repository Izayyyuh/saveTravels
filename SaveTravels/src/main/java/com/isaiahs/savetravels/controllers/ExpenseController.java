package com.isaiahs.savetravels.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.isaiahs.savetravels.models.Expense;
import com.isaiahs.savetravels.services.ExpenseService;

import jakarta.validation.Valid;

@Controller
@RequestMapping("/expenses")
public class ExpenseController {
	
	@Autowired
	private ExpenseService expenseService;
	
	@GetMapping("")
	public String index(@ModelAttribute("newExpense") Expense newExpense, Model viewModel) {
		viewModel.addAttribute("allTheExpenses", expenseService.allExpenses());
		return "index.jsp";
	}

	@PostMapping("/create")
	public String createBook(@Valid @ModelAttribute("newExpense")Expense newExpense, BindingResult result, Model viewModel) { //PARAMETER ANNOTATIONS MUST BE IN THIS ORDER!!!
		if(result.hasErrors()) {
			viewModel.addAttribute("allTheExpenses", expenseService.allExpenses());
			return "index.jsp";
		}
		this.expenseService.createExpense(newExpense);
		return "redirect:/expenses";
	}
	
	@RequestMapping("/edit/{expenseId}")
	public String edit(@PathVariable("expenseId") Long id, Model viewModel) {
		viewModel.addAttribute("expenseToEdit", this.expenseService.findExpense(id));
		return "edit.jsp";
	}
	
	@PutMapping("/update/{id}")
	public String update(@Valid @ModelAttribute("expenseToEdit")Expense editedExpense, BindingResult result, Model viewModel) {
		if(result.hasErrors()) {
		
			return "edit.jsp";
		}
		this.expenseService.updateExpense(editedExpense);
		return "redirect:/expenses";
	}
	
	@RequestMapping("/{expenseId}")
	public String viewExpense(@PathVariable("expenseId")Long id, Model viewModel) {
		viewModel.addAttribute("viewExpense", this.expenseService.findExpense(id));
		return "view.jsp";
	}
	
	@GetMapping("/delete/{expenseId}")
	public String delete(@PathVariable("expenseId")Long id) {
		this.expenseService.deleteById(id);
		return "redirect:/expenses";
	}
}

