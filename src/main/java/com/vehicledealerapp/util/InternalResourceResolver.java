package com.vehicledealerapp.util;

public final class InternalResourceResolver {
	private InternalResourceResolver() {}
	
	public static final String ROOT = "";
	public static final String _ROOT = "/";
	public static final String INDEX = "index";
	public static final String _INDEX = ROOT + INDEX;
	
	private static final String REDIRECT = "redirect:/";
	
	public static String redirectTo(String target) {
		return REDIRECT + target;
	}

}
