package com.vehicledealerapp.web.settings;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.vehicledealerapp.web.util.ResourceResolver.Mapping;
import com.vehicledealerapp.web.util.ResourceResolver.View;
@Controller
@RequestMapping(Mapping.SETTINGS_BRANCH)
public class BranchSettingsController {

	@RequestMapping(method = RequestMethod.GET)
	String branchesSettings() {
		return View.SETTINGS_BRANCH;
	}
}