package com.vehicledealerapp.web.settings;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.vehicledealerapp.persistence.general.entities.Branch;
import com.vehicledealerapp.services.BranchService;
import com.vehicledealerapp.web.util.BranchAttributes;
import com.vehicledealerapp.web.util.BranchResourceResolver.Mapping;
import com.vehicledealerapp.web.util.BranchResourceResolver.Path;
import com.vehicledealerapp.web.util.BranchResourceResolver.View;

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
	ModelAndView readBranches(Pageable pageable) {
		return new ModelAndView(View.SETTINGS_BRANCHES, "page", branchService.findAll(pageable));
	}
	
	/**
	 * 5) NEW BRANCH > shows new branch form
	 * GET
	 * Path: branches/new
	 * Forwards: settings/branch/newbranch.jsp
	 * @return MODELANDVIEW
	 */
	@RequestMapping(path = Path.BRANCHES_NEW, method = RequestMethod.GET)
	ModelAndView newCity() {
		return new ModelAndView(View.SETTINGS_BRANCH_NEWBRANCH)
				.addObject(new Branch());
	}
}