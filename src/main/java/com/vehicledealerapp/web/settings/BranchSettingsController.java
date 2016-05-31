package com.vehicledealerapp.web.settings;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.vehicledealerapp.persistence.general.entities.Branch;
import com.vehicledealerapp.persistence.shared.entities.Country;
import com.vehicledealerapp.services.BranchService;
import com.vehicledealerapp.web.util.BranchAttributes;
import com.vehicledealerapp.web.util.BranchResourceResolver.Mapping;
import com.vehicledealerapp.web.util.BranchResourceResolver.Path;
import com.vehicledealerapp.web.util.BranchResourceResolver.View;
import com.vehicledealerapp.web.util.LocaleAttributes;

@Controller
@RequestMapping(Mapping.SETTINGS_BRANCH)
public class BranchSettingsController {

	private final BranchService branchService;
	
	@Autowired
	BranchSettingsController(BranchService branchService) {
		this.branchService = branchService;
	}
	
	@InitBinder(BranchAttributes.BRANCH)
	void initBinderContinent(WebDataBinder binder) {
		binder.initDirectFieldAccess();
	}
	
	/**
	 * BRANCH SETTINGS
	 * GET
	 * Forwards: settings/branch.jsp
	 * @return STRING
	 */
	@RequestMapping(method = RequestMethod.GET)
	String branchesSettings() {
		return View.SETTINGS_BRANCH;
	}
	
	/**
	 * 1) EDIT BRANCHES > shows branches
	 * GET
	 * Path: branches
	 * Forwards: settings/branch/branches.jsp
	 * @return MODELANDVIEW
	 */
	@RequestMapping(path = Path.BRANCHES, method = RequestMethod.GET)
	ModelAndView readBranches() {
		return new ModelAndView(View.SETTINGS_BRANCH_BRANCHES,
				BranchAttributes.BRANCHES, branchService.findAll());
	}
	
	/**
	 * 2
	 * ) NEW BRANCH > shows new branch form
	 * GET
	 * Path: branches/new
	 * Forwards: settings/branch/newbranch.jsp
	 * @return MODELANDVIEW
	 */
	@RequestMapping(path = Path.BRANCHES_NEW, method = RequestMethod.GET)
	ModelAndView newBranch() {
		return new ModelAndView(View.SETTINGS_BRANCH_NEWBRANCH,
				LocaleAttributes.COUNTRIES, branchService.findEnabledCountries())
				.addObject(new Branch());
	}
	
	/**
	 * 2
	 * ) NEW BRANCH > saves new branch
	 * POST
	 * Path: branches/new
	 * Redirect to:
	 * @return STRING
	 */
	@RequestMapping(path = Path.BRANCHES_NEW, method = RequestMethod.POST)
	ModelAndView saveBranch(@Valid Branch branch, BindingResult bindingResult) {
		boolean postalCodeError
			= !Country.postalCodeMatches(branch.getCountry(), branch.getAddress().getCity().getPostalCode());
		
		if (bindingResult.hasErrors() || postalCodeError) {
			ModelAndView modelAndView = new ModelAndView(View.SETTINGS_BRANCH_NEWBRANCH);
			bindingResult.getFieldErrors().stream().map(FieldError::getField).forEach(field -> {
				modelAndView.addObject(field.replace('.', '_') + "Err", true);
			});
			modelAndView.addObject(LocaleAttributes.COUNTRIES, branchService.findEnabledCountries())
					.addObject("branch", branch);
			
			if (postalCodeError) {
				modelAndView.addObject("postalCodeMatcherErr", true);
			}
			return modelAndView;
		}
	
		branchService.updateBranch(branch);
		return new ModelAndView("redirect:/settings/branch/branches/" + branch.getId());
	}
	
	@RequestMapping(path = Path.BRANCHES_CLEANBRANCH, method = RequestMethod.GET)
	ModelAndView readBranch(@PathVariable Branch branch) {
		return new ModelAndView(View.SETTINGS_BRANCH_BRANCH,
				BranchAttributes.BRANCH, branch);
	}
}