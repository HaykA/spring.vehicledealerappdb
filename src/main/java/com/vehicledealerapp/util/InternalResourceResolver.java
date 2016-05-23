package com.vehicledealerapp.util;

public final class InternalResourceResolver {
	private InternalResourceResolver() {}
	
	public static final String ROOT = "";
	public static final String _ROOT = "/";
	public static final String INDEX = "index";
	public static final String _INDEX = ROOT + INDEX;
	
	private static final String SETTINGS = "settings/";
	private static final String LOCALE = SETTINGS + "locale/";
	public static final String CONTINENTS = LOCALE + "continents";
	public static final String _CONTINENTS = ROOT + CONTINENTS;
	public static final String COUNTRIES = LOCALE + "/countries";
	
	private static final String REDIRECT = "redirect:/";
	
	public static String redirectTo(String target) {
		return REDIRECT + target;
	}

}
