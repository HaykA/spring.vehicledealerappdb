package com.vehicledealerapp.util;

public final class InternalResourceResolver {
	private InternalResourceResolver() {}
	
	public static final String ROOT = "";
	public static final String RM = "/";
	public static final String INDEX = "index";
	public static final String RM_INDEX = RM + INDEX;

	/* SETTINGS */
	public static final String SETTINGS = "settings";
	public static final String RM_SETTINGS = RM + SETTINGS;
	
	/* Locale Settings */
	public static final String SETTINGS_LOCALE = SETTINGS + "/locale";
	public static final String RM_SETTINGS_LOCALE = RM + SETTINGS_LOCALE;
	public static final String CONTINENT = "continent";
	public static final String CONTINENTS = "continents";
	public static final String CONTINENTS_CONTINENT = CONTINENTS + "/{continent}";
	public static final String SETTINGS_LOCALE_CONTINENT = SETTINGS_LOCALE + RM + CONTINENT;
	public static final String SETTINGS_LOCALE_CONTINENTS = SETTINGS_LOCALE + RM + CONTINENTS;
	
	//
	private static final String REDIRECT = "redirect:/";
	
	public static String redirectTo(String target) {
		return REDIRECT + target;
	}

}
