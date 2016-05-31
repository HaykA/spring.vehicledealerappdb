package com.vehicledealerapp.web.settings;

import static com.vehicledealerapp.web.util.BranchResourceResolver.View.redirectTo;
import static com.vehicledealerapp.web.util.BranchResourceResolver.View.redirectToSettingsBranchBranchesByBranch;
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
import com.vehicledealerapp.services.BranchService;
import com.vehicledealerapp.util.RegexManager;
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
	 * 1) EDIT BRANCHES > shows the list of branches
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
	 * 1.1) EDIT BRANCHES > shows branch
	 * GET
	 * Path: branches/{branch}
	 * Forwards: settings/branch/branch.jsp
	 * @param branch
	 * @return MODELANDVIEW
	 */
	@RequestMapping(path = Path.BRANCHES_CLEANBRANCH, method = RequestMethod.GET)
	ModelAndView readBranch(@PathVariable Branch branch) {
		return new ModelAndView(View.SETTINGS_BRANCH_BRANCH,
				BranchAttributes.BRANCH, branch)
				.addObject(LocaleAttributes.COUNTRIES,
						branchService.findEnabledCountriesOrCountriesHavingBranches(branch));
	}
	
	/**
	 * 1.1) EDIT BRANCHES > updates branch
	 * POST
	 * Path: branches/{branch}
	 * Forwards: settings/branch/branch		> if bindingResult has errors
	 * Redirects to: itself					> if update succeeded 
	 * @param branch
	 * @param bindingResult
	 * @return MODELANDVIEW
	 */
	@RequestMapping(path = Path.BRANCHES_CLEANBRANCH, method = RequestMethod.POST)
	ModelAndView updateBranch(@Valid Branch branch, BindingResult bindingResult) {
		ModelAndView modelAndView = getModelAndViewToSaveOrUpdateBranch(branch, bindingResult);
		if (modelAndView != null) {
			return modelAndView.addObject(LocaleAttributes.COUNTRIES,
					branchService.findEnabledCountriesOrCountriesHavingBranches(branch));
		}
		branchService.updateBranch(branch);
		return new ModelAndView(redirectToSettingsBranchBranchesByBranch(branch));
	}
	
	/**
	 * 1.1) EDIT BRANCHES > removes branch
	 * POST
	 * Path: branches/{branch}?remove
	 * Redirects to: 1
	 * @param branch
	 * @return STRING
	 */
	@RequestMapping(path = Path.BRANCHES_CLEANBRANCH, params="remove", method = RequestMethod.POST)
	String removeBranch(@PathVariable Branch branch) {
		branchService.deleteBranch(branch);
		return redirectTo(View.SETTINGS_BRANCH_BRANCHES);
	}
	
	/**
	 * 2) NEW BRANCH > shows new branch form
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
	 * 2) NEW BRANCH > saves new branch
	 * POST
	 * Path: branches/new
	 * Redirects to: 1
	 * @return STRING
	 */
	@RequestMapping(path = Path.BRANCHES_NEW, method = RequestMethod.POST)
	ModelAndView saveBranch(@Valid Branch branch, BindingResult bindingResult) {
		ModelAndView modelAndView = getModelAndViewToSaveOrUpdateBranch(branch, bindingResult);
		if (modelAndView != null) {
			return modelAndView.addObject(LocaleAttributes.COUNTRIES,
					branchService.findEnabledCountries());
		}
		branchService.updateBranch(branch);
		return new ModelAndView(redirectToSettingsBranchBranchesByBranch(branch));
	}
	
	
	// PRIVATE
	/**
	 * Checks whether postal code matches the country postal code pattern
	 * Partial method to be used for getModelAndViewToSaveOrUpdateBranch(?,?); 
	 * @param branch
	 * @return
	 */
	private boolean getPostalCodeErr(Branch branch) {
		if (branch.getCountry() == null) {
			return false;
		}
		return !RegexManager.matches(branch.getCountry().getPostalCodePattern(),
				branch.getAddress().getCity().getPostalCode());
	}
	
	/**
	 * Gethers all field errors from a branch BindingResult and puts it into ModelAndView
	 * Partial method to be used before updating or saving a branch
	 * @param branch
	 * @param bindingResult
	 * @return
	 */
	private ModelAndView getModelAndViewToSaveOrUpdateBranch(Branch branch, BindingResult bindingResult) {
		boolean postalCodeError = getPostalCodeErr(branch);
		if (bindingResult.hasErrors() || postalCodeError) {
			ModelAndView modelAndView = new ModelAndView(View.SETTINGS_BRANCH_NEWBRANCH);
			bindingResult.getFieldErrors().stream().map(FieldError::getField).forEach(field -> {
				modelAndView.addObject(field.replace('.', '_') + "Err", true);
			});
			modelAndView.addObject("branch", branch);
			if (postalCodeError) {
				modelAndView.addObject("postalCodeMatcherErr", true);
			}
			return modelAndView;
		}
		return null;
	}
}