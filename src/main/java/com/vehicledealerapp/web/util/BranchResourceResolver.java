package com.vehicledealerapp.web.util;

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
		public static final String BRANCHES_NEW = BRANCHES + "/new";
	}
	
	public static final class View {
		private static final String REDIRECT_PREFIX = "redirect:";
		public static final String REDIRECT = REDIRECT_PREFIX + '/';
		
		public static final String INDEX = "index";
		public static final String SETTINGS = "settings";
		public static final String SETTINGS_BRANCH = SETTINGS + '/' + BranchAttributes.BRANCH;
		public static final String SETTINGS_BRANCHES = SETTINGS_BRANCH + '/' + BranchAttributes.BRANCHES;
		public static final String SETTINGS_BRANCH_NEWBRANCH = SETTINGS_BRANCH + "/newbranch";
		
		
		public static String redirectTo(String target) {
			return REDIRECT + target;
		}
		
		public static String redirectTo(String mapping, String path) {
			return REDIRECT_PREFIX + mapping + '/' + path;
		}
	}
}
