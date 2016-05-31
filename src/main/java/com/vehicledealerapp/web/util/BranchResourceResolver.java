package com.vehicledealerapp.web.util;

import com.vehicledealerapp.persistence.general.entities.Branch;

public final class BranchResourceResolver {
	private BranchResourceResolver() {}

	public static final class Mapping {
		public static final String ROOT = "";
		public static final String INDEX = '/' + View.INDEX;
		public static final String SETTINGS = '/' + View.SETTINGS;
		public static final String SETTINGS_BRANCH = '/' + View.SETTINGS_BRANCH;
	}
	
	public static final class Path {
		public static final String BRANCHES = BranchAttributes.BRANCHES;
		public static final String BRANCHES_CLEANBRANCH = BRANCHES + "/{" + BranchAttributes.BRANCH + '}';
		public static final String BRANCHES_NEW = BRANCHES + "/new";
	}
	
	public static final class View {
		private static final String REDIRECT_PREFIX = "redirect:";
		public static final String REDIRECT = REDIRECT_PREFIX + '/';
		
		public static final String INDEX = "index";
		public static final String SETTINGS = "settings";
		public static final String SETTINGS_BRANCH = SETTINGS + '/' + BranchAttributes.BRANCH;
		public static final String SETTINGS_BRANCH_BRANCHES = SETTINGS_BRANCH + '/' + BranchAttributes.BRANCHES;
		public static final String SETTINGS_BRANCH_BRANCH = SETTINGS_BRANCH + '/' + BranchAttributes.BRANCH;
		public static final String SETTINGS_BRANCH_NEWBRANCH = SETTINGS_BRANCH + "/newbranch";
		
		
		public static String redirectTo(String target) {
			return REDIRECT + target;
		}
		
		public static String redirectTo(String mapping, String path) {
			return REDIRECT_PREFIX + mapping + '/' + path;
		}
		
		public static String getSettingsBranchBranchesByBranch(Branch branch) {
			return getSettingsBranchBranchesByBranchId(branch.getId());
		}
		
		public static String getSettingsBranchBranchesByBranchId(long branchId) {
			return getSettingsBranchBranchesByBranchId(String.valueOf(branchId));
		}
		
		public static String getSettingsBranchBranchesByBranchId(String branchId) {
			return SETTINGS_BRANCH_BRANCHES + '/' + branchId;
		}
		
		public static String redirectToSettingsBranchBranchesByBranch(Branch branch) {
			return redirectTo(getSettingsBranchBranchesByBranch(branch));
		}
	}
}
